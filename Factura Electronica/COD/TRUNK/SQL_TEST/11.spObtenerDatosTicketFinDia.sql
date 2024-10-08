USE [CAP_INTER]
GO
/****** Object:  StoredProcedure [dbo].[spObtenerDatosTicketFinDia]    Script Date: 8/28/2024 9:19:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spObtenerDatosTicketFinDia]
-- Recibe numero de ticket y numero de sucursal
	@fechaInicial DATE,
	@fechaFinal DATE,
	@sucursal nvarchar(MAX)
AS
BEGIN
	SET NOCOUNT ON;
	CREATE TABLE #csv (a nvarchar (MAX) NOT NULL);
	WHILE LEN(@sucursal) > 0
	BEGIN
		DECLARE @TDay NVARCHAR(MAX)
		IF CHARINDEX(',',@sucursal) > 0
			SET @TDay = SUBSTRING(@sucursal,0,CHARINDEX(',',@sucursal))
		ELSE
		BEGIN
			SET @TDay = @sucursal
			SET @sucursal = ''
		END
		INSERT INTO #csv VALUES (@TDay)
		SET @sucursal = REPLACE(@sucursal, @TDay + ',' , '')
	END

	SELECT
		p.GP_NUMERO AS GP_NUMERO,
		RTRIM(LTRIM(p.GP_ETABLISSEMENT)) GP_ETABLISSEMENT,
		p.GP_TOTALTTC,
		RTRIM(LTRIM(p.GP_MODEPAIE_CODE)) GP_MODEPAIE,
		RTRIM(LTRIM(GP_REFINTERNE)) GP_REFINTERNE
	FROM [dbo].[T_PIECE] AS p
	WHERE p.GP_DATEPIECE BETWEEN @fechaInicial AND @fechaFinal 
	AND p.GP_ETABLISSEMENT IN (SELECT a FROM #csv)
	ORDER BY p.GP_ETABLISSEMENT, GP_NUMERO
END
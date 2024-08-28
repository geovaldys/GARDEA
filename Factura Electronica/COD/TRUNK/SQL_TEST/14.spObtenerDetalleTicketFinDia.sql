USE [CAP_INTER]
GO

/****** Object:  StoredProcedure [dbo].[spObtenerDetalleTicketFinDia]    Script Date: 8/28/2024 9:20:55 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[spObtenerDetalleTicketFinDia]
	-- Recibe numero de ticket y clave de caja
	@ticketNumber nvarchar(MAX),
	@sucursal nvarchar(MAX)
AS
BEGIN
	SET NOCOUNT ON;
	CREATE TABLE #csv (a nvarchar(MAX) NOT NULL);
	WHILE LEN(@ticketNumber) > 0
	BEGIN
		DECLARE @TDay NVARCHAR(MAX)
		IF CHARINDEX(',',@ticketNumber) > 0
			SET @TDay = SUBSTRING(@ticketNumber,0,CHARINDEX(',',@ticketNumber))
		ELSE
		BEGIN
			SET @TDay = @ticketNumber
			SET @ticketNumber = ''
		END
		INSERT INTO #csv VALUES (@TDay)
		SET @ticketNumber = REPLACE(@ticketNumber, @TDay + ',' , '')
	END

	SELECT
		RTRIM(LTRIM(l.[GL_REFARTBARRE])) AS GA_CODEBARRE,
		RTRIM(LTRIM(l.[GL_LIBELLE])) AS GA_LIBELLE,
		l.GL_QTEFACT,
		l.[GL_PUHT] AS prec_unit,
		l.[GL_SUBTOTAL] * 1.16 as importe,
		'' AS Aduana,
		'' AS Pedimento,
		'' AS FechaPedimento,
		l.[GL_NUMERO] as TICKET,
		l.GL_REMISELIBRE3 as descuento,
		RTRIM(LTRIM(l.GL_LIBREART4)) as ClaveProdServ,
		RTRIM(LTRIM(l.GL_UNIDAD)) AS ClaveUnidad,
		l.GL_TASA AS TasaIVA,
		l.GL_TOTALTAXEDEV1 AS ImporteIVA,
		CASE
			WHEN l.GL_UNIDAD = 'E48'
			THEN 'Servicio'
			ELSE 'Pieza'
		END AS GL_DESCRIPCION
	FROM [dbo].[T_LIGNE] as l
	WHERE l.GL_NUMERO IN (SELECT a FROM #csv) 
		  AND l.GL_ETABLISSEMENT = @sucursal
END
GO



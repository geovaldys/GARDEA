USE [CAP_INTER]
GO
/****** Object:  StoredProcedure [dbo].[spObtenerDatosTicket]    Script Date: 8/28/2024 9:19:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spObtenerDatosTicket]
-- Recibe numero de ticket y numero de sucursal
	@ticketNumber nvarchar(MAX),
	@monto numeric(19,4)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
	p.GP_NUMERO AS GP_TIERS,
	p.GP_DATEPIECE,
	RTRIM(LTRIM(p.GP_MODEPAIE)) AS GPE_MODEPAIE,
	'' AS GPE_LIBELLE,
	RTRIM(LTRIM(p.GP_ETABLISSEMENT)) GP_ETABLISSEMENT ,
	p.GP_TOTALTTC,
	'' AS GPE_DEVISE,
	'' AS T_LIBELLE,
	'' AS T_NOM2,
	'' AS T_ADRESSE1,
	'' AS T_ADRESSE2,
	'' AS T_ADRESSE3,
	'' AS T_CODEPOSTAL,
	'' AS T_VILLE,
	'' AS T_REGION,
	'' AS T_PAYS,
	'' AS YTC_TEXTELIBRE1,
	RTRIM(LTRIM(p.GP_CAISSE)) GP_CAISSE,
	RTRIM(LTRIM(P.GP_NATUREPIECE)) GP_NATUREPIECE ,
	RTRIM(LTRIM(P.GP_TICKET_REF)) GP_TICKET_REF
	FROM T_PIECE p
	WHERE
	p.GP_NUMERO=@ticketNumber
	--p.GP_REFINTERNE = @ticketNumber 
	AND p.GP_TOTALTTC = @monto
END
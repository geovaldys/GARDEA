USE [CAP_INTER]
GO
/****** Object:  StoredProcedure [dbo].[spObtenerDetalleTicket]    Script Date: 8/28/2024 9:20:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spObtenerDetalleTicket]
-- Recibe numero de ticket y clave de caja
	@ticketNumber nvarchar(MAX),
	--@monto numeric(19,4)
	@sucursal nvarchar(MAX)
	
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		RTRIM(LTRIM(l.[GL_REFARTBARRE])) AS GA_CODEBARRE,
		RTRIM(LTRIM(l.[GL_LIBELLE])) AS GA_LIBELLE,
		l.GL_QTEFACT,
		l.[GL_PUHT] AS prec_unit,
		l.[GL_SUBTOTAL] * 1.16 as importe,
		'' AS Aduana,
		'' AS Pedimento,
		'' AS FechaPedimento,
		l.GL_REMISELIBRE3 as descuento,
		RTRIM(LTRIM(l.GL_LIBREART4)) as ClaveProdServ,
		RTRIM(LTRIM(l.GL_UNIDAD)) AS ClaveUnidad,
		l.GL_TASA AS TasaIVA,
		l.GL_TOTALTAXEDEV1 AS ImporteIVA,
		'0' AS TasaIEPS,
		'0' AS ImporteIEPS,
		CASE
		WHEN l.GL_UNIDAD = 'E48'
		THEN 'Servicio'
		ELSE 'Pieza'
		END AS GL_DESCRIPCION
	FROM T_LIGNE l
	WHERE l.GL_NUMERO= @ticketNumber
	--l.GL_REFINTERNE = @ticketNumber 
	AND l.GL_ETABLISSEMENT = @sucursal
	--AND l.Gl_TOTALTTC=@monto
END
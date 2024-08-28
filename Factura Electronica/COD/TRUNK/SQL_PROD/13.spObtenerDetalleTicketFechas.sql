USE [CAP_INTER]
GO

/****** Object:  StoredProcedure [dbo].[spObtenerDetalleTicketFechas]    Script Date: 8/28/2024 9:20:30 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[spObtenerDetalleTicketFechas]
-- Recibe fecha inicial, fecha final y sucursal
	@FechaIni nvarchar(10),
	@FechaFin nvarchar(10),
	@sucursal nvarchar(MAX)
	--2019-10-17
AS
BEGIN
	SELECT
		RTRIM(LTRIM(l.[GL_REFARTBARRE])) AS GA_CODEBARRE,
		RTRIM(LTRIM(l.[GL_LIBELLE])) AS GA_LIBELLE,
		l.GL_QTEFACT,
		l.[GL_PUHT] AS prec_unit
		,l.[GL_SUBTOTAL] * 1.16 as importe,
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
		END 
		AS GL_DESCRIPCION
	FROM [dbo].[T_LIGNE] as l
	WHERE l.GL_ETABLISSEMENT = @sucursal 
	AND (l.GL_DATEPIECE BETWEEN @FechaIni AND @FechaFin)
END
GO



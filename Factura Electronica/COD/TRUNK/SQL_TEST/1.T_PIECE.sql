USE [CAP_INTER]
GO

/****** Object:  Table [dbo].[T_PIECE]    Script Date: 8/28/2024 9:14:42 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[T_PIECE](
	[GP_PIECE] [int] NULL,
	[GP_ETABLISSEMENT] [nchar](6) NULL,
	[GP_CAISSE] [nchar](6) NULL,
	[GP_NUMERO] [int] NULL,
	[GP_DATEPIECE] [datetime] NULL,
	[GP_SUBTOTAL] [numeric](19, 4) NULL,
	[GP_TOTALHT] [numeric](19, 4) NULL,
	[GP_TOTALTTC] [numeric](19, 4) NULL,
	[GP_TOTALTAXEDEV1] [numeric](19, 4) NULL,
	[GP_REMISELIBRE3] [numeric](19, 4) NULL,
	[GP_ESTATUS] [nchar](10) NULL,
	[GP_TASAS] [numeric](19, 4) NULL,
	[GP_NATUREPIECE] [nchar](3) NULL,
	[GP_MODEPAIE] [nchar](3) NULL,
	[GP_REFINTERNE] [nchar](40) NULL,
	[GP_TICKET_REF] [int] NULL,
	[GP_MODEPAIE_CODE] [nchar](20) NULL
) ON [PRIMARY]
GO



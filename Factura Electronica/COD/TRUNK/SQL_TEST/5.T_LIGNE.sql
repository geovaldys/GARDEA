USE [CAP_INTER]
GO

/****** Object:  Table [dbo].[T_LIGNE]    Script Date: 8/28/2024 9:13:52 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[T_LIGNE](
	[GL_PIECE] [int] NULL,
	[GL_ETABLISSEMENT] [nchar](6) NULL,
	[GL_CAISSE] [nchar](10) NULL,
	[GL_NUMERO] [int] NULL,
	[GL_DATEPIECE] [datetime] NULL,
	[GL_NUMLIGNE] [int] NULL,
	[GL_LIBELLE] [nchar](70) NULL,
	[GL_CODEARTICLE] [nchar](18) NULL,
	[GL_REFARTBARRE] [nchar](18) NULL,
	[GL_QTEFACT] [numeric](19, 4) NULL,
	[GL_PUHT] [numeric](19, 4) NULL,
	[GL_SUBTOTAL] [numeric](19, 4) NULL,
	[GL_REMISELIBRE3] [numeric](19, 4) NULL,
	[GL_PORCENREMISE] [numeric](19, 4) NULL,
	[GL_REGIMETAXE] [nchar](10) NULL,
	[GL_TASA] [numeric](19, 4) NULL,
	[GL_TOTALTAXEDEV1] [numeric](19, 4) NULL,
	[GL_TOTALHT] [numeric](19, 4) NULL,
	[GL_TOTALTTC] [numeric](19, 4) NULL,
	[GL_LIBREART4] [varchar](35) NULL,
	[GL_UNIDAD] [nchar](40) NULL,
	[GL_REFINTERNE] [nchar](40) NULL
) ON [PRIMARY]
GO



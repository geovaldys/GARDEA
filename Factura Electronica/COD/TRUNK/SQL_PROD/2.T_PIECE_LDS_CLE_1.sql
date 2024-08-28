USE [CAP_INTER]
GO

SET ANSI_PADDING ON
GO

/****** Object:  Index [LDS_CLE_1]    Script Date: 8/28/2024 9:15:10 AM ******/
CREATE CLUSTERED INDEX [LDS_CLE_1] ON [dbo].[T_PIECE]
(
	[GP_REFINTERNE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO



USE [CAPTEST_INT]
GO
/****** Object:  StoredProcedure [dbo].[zpr_mantener_Intermedia_Cegid]    Script Date: 8/28/2024 9:55:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Version: 1.0
Autor: Geovaldys Bobadilla Lora
Descripcion: Procedimiento almacenado encargado de eliminar de la intermedia 
			 los registros con antiguedad mayor a 6 meses apartir de la fecha
Fecha: 28/08/2024
*/
ALTER procedure [dbo].[zpr_mantener_Intermedia_Cegid]
AS 
BEGIN
    --Eliminacion de registos de la T_PIECE con mas de 6 meses de antiguedad
	DELETE FROM T_PIECE	
	WHERE GP_DATEPIECE<=CAST(DATEADD(MONTH, -6, GETDATE()) AS DATE)

	--Eliminacion de registos de la T_LIGNE con mas de 6 meses de antiguedad
	DELETE FROM T_LIGNE
	WHERE GL_DATEPIECE<=CAST(DATEADD(MONTH, -6, GETDATE()) AS DATE)

END
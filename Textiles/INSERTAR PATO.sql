USE [C:\USERS\PC\DOCUMENTS\TEXTILES.MDF]
GO

DECLARE	@return_value Int

EXEC	@return_value = [dbo].[agregar]
		@Correo = N'pato@pato.pato',
		@Clave = N'pato',
		@Patron = N'InfoToolsSV'

SELECT	@return_value as 'Return Value'

GO

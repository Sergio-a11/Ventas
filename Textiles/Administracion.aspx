<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Administracion.aspx.cs" Inherits="Textiles.Administracion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lblPresent" runat="server" Text="Admin"></asp:Label>
            <br />
            <asp:Button ID="btnCerrrar" runat="server" OnClick="btnCerrrar_Click" Text="Cerrar" />
        </div>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="loggin.aspx.cs" Inherits="Textiles.loggin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<link href="css/loggin.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 300px;
            height: 200px;
            z-index: 1;
            left: 570px;
            top: 90px;
            position: absolute;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" class="login">
        <legend class="legend">Login</legend>
        <div>
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Font-Size="XX-Large" Text="MEME CREACIONES"></asp:Label>
            <br />
            <br />
            <br />
            <br />
            <br />
            <asp:Label class="input" ID="Label1" runat="server" Text="Correo:" BackColor="#9966FF" ForeColor="White" BorderColor="White" BorderWidth="3px"></asp:Label>
            &nbsp;
            <asp:TextBox class="input" ID="txtCorreo" runat="server" TextMode="Email" BorderColor="Black" BorderWidth="3px"></asp:TextBox>
            <br />
            <br />
            <asp:Label class="input" ID="Label2" runat="server" Text="Contraseña:" BackColor="#A078FE" ForeColor="White" BorderColor="White" BorderWidth="3px"></asp:Label>
            &nbsp;
            <asp:TextBox class="input" ID="txtContrasena" runat="server" TextMode="Password" BorderColor="Black" BorderWidth="3px"></asp:TextBox>
            <br />
            <br />
            <asp:Button class="submit" ID="btnIniciar" runat="server" OnClick="btnIniciar_Click" Text="Iniciar" BackColor="#FF9933" Font-Names="Dubai" Font-Size="XX-Large" ForeColor="White" Height="57px" Width="408px" />
            <br />
            <br />
            <asp:Label ID="lblError" runat="server"></asp:Label>
        </div>
    </form>
</body>
</html>

<%@ Page Title="" Language="C#" MasterPageFile="~/plantilla.Master" AutoEventWireup="true" CodeBehind="Carrito.aspx.cs" Inherits="Textiles.Carrito" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="lblLista" runat="server" Text="Label"></asp:Label>
    <br />
    <br />
    <asp:Label ID="Label1" runat="server" Text="Datos Cliente:"></asp:Label>
    <br />
    <asp:Label ID="Label2" runat="server" Text="Nombre"></asp:Label>
&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="Label3" runat="server" Text="Direccion"></asp:Label>
&nbsp;
    <asp:TextBox ID="txtDireccion" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="Label4" runat="server" Text="Telefono"></asp:Label>
&nbsp;&nbsp;
    <asp:TextBox ID="txtTelefono" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="Label5" runat="server" Text="Correo"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="txtCorreo" runat="server"></asp:TextBox>
    <br />
    <asp:Button ID="btnFinalizar" runat="server"  Text="Finalizar Compra" OnClick="btnFinalizar_Click" />
    </asp:Content>

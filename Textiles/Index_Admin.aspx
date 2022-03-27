<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Index_Admin.aspx.cs" Inherits="Textiles.Index_Admin" %>
<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Chart ID="ventas" runat="server" Width="362px">
    <series>
        <asp:Series Name="Series1">
        </asp:Series>
    </series>
    <chartareas>
        <asp:ChartArea Name="ChartArea1">
        </asp:ChartArea>
    </chartareas>
</asp:Chart>
<asp:Label ID="Label1" runat="server" Text="Productos Vendidos  ID VENTA"></asp:Label>
<asp:TextBox ID="txtFiltro" runat="server"></asp:TextBox>
<asp:Button ID="btnFlitro" runat="server" OnClick="btnFlitro_Click" Text="Filtrar" />
</asp:Content>

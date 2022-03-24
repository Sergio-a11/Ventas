<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Inventario.aspx.cs" Inherits="Textiles.Inventario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="Label1" runat="server" Font-Size="XX-Large" Text="INVENTARIO PRODUCTOS"></asp:Label>
    <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" AutoGenerateRows="False" CellPadding="4" DataKeyNames="Id" DataSourceID="productos" ForeColor="#333333" GridLines="None" Height="252px" Width="410px">
    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
    <EditRowStyle BackColor="#999999" />
    <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
    <Fields>
        <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
        <asp:BoundField DataField="nombre" HeaderText="nombre" SortExpression="nombre" />
        <asp:BoundField DataField="talla" HeaderText="talla" SortExpression="talla" />
        <asp:BoundField DataField="precio" HeaderText="precio" SortExpression="precio" />
        <asp:BoundField DataField="observaciones" HeaderText="observaciones" SortExpression="observaciones" />
        <asp:BoundField DataField="CantidadTotal" HeaderText="CantidadTotal" ReadOnly="True" SortExpression="CantidadTotal" />
    </Fields>
    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
</asp:DetailsView>
    <asp:SqlDataSource ID="productos" runat="server" ConnectionString="<%$ ConnectionStrings:textilesConnectionString %>" SelectCommand="SELECT * FROM [Transaccion]"></asp:SqlDataSource>
</asp:Content>

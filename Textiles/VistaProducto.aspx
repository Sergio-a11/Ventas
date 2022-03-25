<%@ Page Title="" Language="C#" MasterPageFile="~/plantilla.Master" AutoEventWireup="true" CodeBehind="VistaProducto.aspx.cs" Inherits="Textiles.VistaProducto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DetailsView ID="dtvProducto" runat="server" AutoGenerateRows="False" CellPadding="4" DataSourceID="producto" ForeColor="#333333" GridLines="None" Height="157px" Width="240px">
    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
    <EditRowStyle BackColor="#999999" />
    <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
    <Fields>
        <asp:BoundField DataField="nombre" HeaderText="nombre" SortExpression="nombre" />
        <asp:BoundField DataField="talla" HeaderText="talla" SortExpression="talla" />
        <asp:BoundField DataField="precio" HeaderText="precio" SortExpression="precio" />
        <asp:BoundField DataField="observaciones" HeaderText="observaciones" SortExpression="observaciones" />
    </Fields>
    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
</asp:DetailsView>
<asp:SqlDataSource ID="producto" runat="server" ConnectionString="<%$ ConnectionStrings:textilesConnectionString %>" SelectCommand="SELECT [nombre], [talla], [precio], [observaciones] FROM [producto] WHERE ([Id] = @Id)">
    <SelectParameters>
        <asp:SessionParameter DefaultValue="" Name="Id" SessionField="ID" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:Button ID="btnAñadir" runat="server" OnClick="btnAñadir_Click" Text="Añadir al Carrito" />
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
</asp:Content>

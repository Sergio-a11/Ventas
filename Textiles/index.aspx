<%@ Page Title="" Language="C#" MasterPageFile="~/plantilla.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Textiles.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <asp:GridView ID="Productos" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="MuestrarioProductos" ForeColor="#333333" GridLines="None" OnRowCommand="Productos_RowCommand" DataKeyNames="Id">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" ReadOnly="True" />
            <asp:BoundField DataField="nombre" HeaderText="nombre" SortExpression="nombre" />
            <asp:BoundField DataField="talla" HeaderText="talla" SortExpression="talla" />
            <asp:TemplateField HeaderText="Ver Mas">
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server" Text="Ver Mas" CommandName="VerMas" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>

    <asp:SqlDataSource ID="MuestrarioProductos" runat="server" ConnectionString="<%$ ConnectionStrings:textilesConnectionString %>" SelectCommand="SELECT * FROM [Muestrario]"></asp:SqlDataSource>

</asp:Content>

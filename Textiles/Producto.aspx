<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Producto.aspx.cs" Inherits="Textiles.Producto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="Label1" runat="server" Font-Size="XX-Large" Text="PRODUCTOS"></asp:Label>
    <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" AutoGenerateRows="False" CellPadding="4" DataKeyNames="Id" DataSourceID="productos" ForeColor="#333333" GridLines="None" Height="190px" Width="322px">
    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
    <EditRowStyle BackColor="#999999" />
    <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
    <Fields>
        <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
        <asp:BoundField DataField="nombre" HeaderText="Nombre Producto" SortExpression="nombre" />
        <asp:BoundField DataField="talla" HeaderText="Talla" SortExpression="talla" />
        <asp:BoundField DataField="precio" HeaderText="Precio" SortExpression="precio" />
        <asp:BoundField DataField="observaciones" HeaderText="Observaciones" SortExpression="observaciones" />
        <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True">
        <ControlStyle BackColor="#284775" Font-Names="Dubai" ForeColor="White" />
        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
        </asp:CommandField>
    </Fields>
    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
</asp:DetailsView>
<asp:SqlDataSource ID="productos" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:textilesConnectionString %>" DeleteCommand="DELETE FROM [producto] WHERE [Id] = @original_Id AND (([nombre] = @original_nombre) OR ([nombre] IS NULL AND @original_nombre IS NULL)) AND (([talla] = @original_talla) OR ([talla] IS NULL AND @original_talla IS NULL)) AND (([precio] = @original_precio) OR ([precio] IS NULL AND @original_precio IS NULL)) AND (([observaciones] = @original_observaciones) OR ([observaciones] IS NULL AND @original_observaciones IS NULL))" InsertCommand="INSERT INTO [producto] ([nombre], [talla], [precio], [observaciones]) VALUES (@nombre, @talla, @precio, @observaciones)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [producto]" UpdateCommand="UPDATE [producto] SET [nombre] = @nombre, [talla] = @talla, [precio] = @precio, [observaciones] = @observaciones WHERE [Id] = @original_Id AND (([nombre] = @original_nombre) OR ([nombre] IS NULL AND @original_nombre IS NULL)) AND (([talla] = @original_talla) OR ([talla] IS NULL AND @original_talla IS NULL)) AND (([precio] = @original_precio) OR ([precio] IS NULL AND @original_precio IS NULL)) AND (([observaciones] = @original_observaciones) OR ([observaciones] IS NULL AND @original_observaciones IS NULL))">
    <DeleteParameters>
        <asp:Parameter Name="original_Id" Type="Int32" />
        <asp:Parameter Name="original_nombre" Type="String" />
        <asp:Parameter Name="original_talla" Type="String" />
        <asp:Parameter Name="original_precio" Type="Decimal" />
        <asp:Parameter Name="original_observaciones" Type="String" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="nombre" Type="String" />
        <asp:Parameter Name="talla" Type="String" />
        <asp:Parameter Name="precio" Type="Decimal" />
        <asp:Parameter Name="observaciones" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="nombre" Type="String" />
        <asp:Parameter Name="talla" Type="String" />
        <asp:Parameter Name="precio" Type="Decimal" />
        <asp:Parameter Name="observaciones" Type="String" />
        <asp:Parameter Name="original_Id" Type="Int32" />
        <asp:Parameter Name="original_nombre" Type="String" />
        <asp:Parameter Name="original_talla" Type="String" />
        <asp:Parameter Name="original_precio" Type="Decimal" />
        <asp:Parameter Name="original_observaciones" Type="String" />
    </UpdateParameters>
</asp:SqlDataSource>
<p>
</p>
</asp:Content>

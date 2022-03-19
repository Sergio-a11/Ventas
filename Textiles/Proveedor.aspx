<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Proveedor.aspx.cs" Inherits="Textiles.Proveedor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" AutoGenerateRows="False" CellPadding="4" DataKeyNames="Id" DataSourceID="Proveedores" ForeColor="#333333" GridLines="None" Height="184px" Width="322px">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
        <EditRowStyle BackColor="#999999" />
        <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
        <Fields>
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="nombre_completo" HeaderText="Nombre Completo" SortExpression="nombre_completo" />
            <asp:BoundField DataField="direccion" HeaderText="Dirección" SortExpression="direccion" />
            <asp:BoundField DataField="telefono" HeaderText="Telefono" SortExpression="telefono" />
            <asp:BoundField DataField="correo" HeaderText="Correo" SortExpression="correo" />
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
    <asp:SqlDataSource ID="Proveedores" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:textilesConnectionString %>" DeleteCommand="DELETE FROM [proveedor] WHERE [Id] = @original_Id AND (([nombre_completo] = @original_nombre_completo) OR ([nombre_completo] IS NULL AND @original_nombre_completo IS NULL)) AND (([direccion] = @original_direccion) OR ([direccion] IS NULL AND @original_direccion IS NULL)) AND (([telefono] = @original_telefono) OR ([telefono] IS NULL AND @original_telefono IS NULL)) AND (([correo] = @original_correo) OR ([correo] IS NULL AND @original_correo IS NULL))" InsertCommand="INSERT INTO [proveedor] ([nombre_completo], [direccion], [telefono], [correo]) VALUES (@nombre_completo, @direccion, @telefono, @correo)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [proveedor]" UpdateCommand="UPDATE [proveedor] SET [nombre_completo] = @nombre_completo, [direccion] = @direccion, [telefono] = @telefono, [correo] = @correo WHERE [Id] = @original_Id AND (([nombre_completo] = @original_nombre_completo) OR ([nombre_completo] IS NULL AND @original_nombre_completo IS NULL)) AND (([direccion] = @original_direccion) OR ([direccion] IS NULL AND @original_direccion IS NULL)) AND (([telefono] = @original_telefono) OR ([telefono] IS NULL AND @original_telefono IS NULL)) AND (([correo] = @original_correo) OR ([correo] IS NULL AND @original_correo IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_Id" Type="Int32" />
            <asp:Parameter Name="original_nombre_completo" Type="String" />
            <asp:Parameter Name="original_direccion" Type="String" />
            <asp:Parameter Name="original_telefono" Type="String" />
            <asp:Parameter Name="original_correo" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="nombre_completo" Type="String" />
            <asp:Parameter Name="direccion" Type="String" />
            <asp:Parameter Name="telefono" Type="String" />
            <asp:Parameter Name="correo" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="nombre_completo" Type="String" />
            <asp:Parameter Name="direccion" Type="String" />
            <asp:Parameter Name="telefono" Type="String" />
            <asp:Parameter Name="correo" Type="String" />
            <asp:Parameter Name="original_Id" Type="Int32" />
            <asp:Parameter Name="original_nombre_completo" Type="String" />
            <asp:Parameter Name="original_direccion" Type="String" />
            <asp:Parameter Name="original_telefono" Type="String" />
            <asp:Parameter Name="original_correo" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

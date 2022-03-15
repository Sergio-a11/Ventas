<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="NuevaCompra.aspx.cs" Inherits="Textiles.NuevaCompra" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="Id" DataSourceID="SqlDataSource2" Height="50px" Width="287px">
        <Fields>
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="nombre" HeaderText="nombre" SortExpression="nombre" />
            <asp:BoundField DataField="direccion" HeaderText="direccion" SortExpression="direccion" />
            <asp:BoundField DataField="telefono" HeaderText="telefono" SortExpression="telefono" />
            <asp:BoundField DataField="correo" HeaderText="correo" SortExpression="correo" />
            <asp:BoundField DataField="rol" HeaderText="rol" SortExpression="rol" />
            <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:textilesConnectionString1 %>" DeleteCommand="DELETE FROM [usuario] WHERE [Id] = @original_Id AND (([nombre] = @original_nombre) OR ([nombre] IS NULL AND @original_nombre IS NULL)) AND (([direccion] = @original_direccion) OR ([direccion] IS NULL AND @original_direccion IS NULL)) AND (([telefono] = @original_telefono) OR ([telefono] IS NULL AND @original_telefono IS NULL)) AND (([correo] = @original_correo) OR ([correo] IS NULL AND @original_correo IS NULL)) AND (([rol] = @original_rol) OR ([rol] IS NULL AND @original_rol IS NULL))" InsertCommand="INSERT INTO [usuario] ([nombre], [direccion], [telefono], [correo], [rol]) VALUES (@nombre, @direccion, @telefono, @correo, @rol)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [usuario]" UpdateCommand="UPDATE [usuario] SET [nombre] = @nombre, [direccion] = @direccion, [telefono] = @telefono, [correo] = @correo, [rol] = @rol WHERE [Id] = @original_Id AND (([nombre] = @original_nombre) OR ([nombre] IS NULL AND @original_nombre IS NULL)) AND (([direccion] = @original_direccion) OR ([direccion] IS NULL AND @original_direccion IS NULL)) AND (([telefono] = @original_telefono) OR ([telefono] IS NULL AND @original_telefono IS NULL)) AND (([correo] = @original_correo) OR ([correo] IS NULL AND @original_correo IS NULL)) AND (([rol] = @original_rol) OR ([rol] IS NULL AND @original_rol IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_Id" Type="Int32" />
            <asp:Parameter Name="original_nombre" Type="String" />
            <asp:Parameter Name="original_direccion" Type="String" />
            <asp:Parameter Name="original_telefono" Type="String" />
            <asp:Parameter Name="original_correo" Type="String" />
            <asp:Parameter Name="original_rol" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="nombre" Type="String" />
            <asp:Parameter Name="direccion" Type="String" />
            <asp:Parameter Name="telefono" Type="String" />
            <asp:Parameter Name="correo" Type="String" />
            <asp:Parameter Name="rol" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="nombre" Type="String" />
            <asp:Parameter Name="direccion" Type="String" />
            <asp:Parameter Name="telefono" Type="String" />
            <asp:Parameter Name="correo" Type="String" />
            <asp:Parameter Name="rol" Type="String" />
            <asp:Parameter Name="original_Id" Type="Int32" />
            <asp:Parameter Name="original_nombre" Type="String" />
            <asp:Parameter Name="original_direccion" Type="String" />
            <asp:Parameter Name="original_telefono" Type="String" />
            <asp:Parameter Name="original_correo" Type="String" />
            <asp:Parameter Name="original_rol" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="NuevaCompra.aspx.cs" Inherits="Textiles.NuevaCompra" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="Id" DataSourceID="compras" Height="88px" Width="379px" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
        <EditRowStyle BackColor="#999999" />
        <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
        <Fields>
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="fecha" HeaderText="Fecha" SortExpression="fecha" />
            <asp:BoundField DataField="cantidad" HeaderText="Cantidad" SortExpression="cantidad" />
            <asp:BoundField DataField="id_producto" HeaderText="Producto ID" SortExpression="id_producto" />
            <asp:BoundField DataField="observaciones" HeaderText="Observaciones" SortExpression="observaciones" />
            <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True">
            <ControlStyle BackColor="#405E88" Font-Names="Dubai" ForeColor="White" />
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:CommandField>
        </Fields>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    </asp:DetailsView>
    <asp:SqlDataSource ID="compras" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:textilesConnectionString %>" DeleteCommand="DELETE FROM [compra] WHERE [Id] = @original_Id AND (([fecha] = @original_fecha) OR ([fecha] IS NULL AND @original_fecha IS NULL)) AND (([cantidad] = @original_cantidad) OR ([cantidad] IS NULL AND @original_cantidad IS NULL)) AND (([id_producto] = @original_id_producto) OR ([id_producto] IS NULL AND @original_id_producto IS NULL)) AND (([observaciones] = @original_observaciones) OR ([observaciones] IS NULL AND @original_observaciones IS NULL))" InsertCommand="INSERT INTO [compra] ([fecha], [cantidad], [id_producto], [observaciones]) VALUES (@fecha, @cantidad, @id_producto, @observaciones)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [compra]" UpdateCommand="UPDATE [compra] SET [fecha] = @fecha, [cantidad] = @cantidad, [id_producto] = @id_producto, [observaciones] = @observaciones WHERE [Id] = @original_Id AND (([fecha] = @original_fecha) OR ([fecha] IS NULL AND @original_fecha IS NULL)) AND (([cantidad] = @original_cantidad) OR ([cantidad] IS NULL AND @original_cantidad IS NULL)) AND (([id_producto] = @original_id_producto) OR ([id_producto] IS NULL AND @original_id_producto IS NULL)) AND (([observaciones] = @original_observaciones) OR ([observaciones] IS NULL AND @original_observaciones IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_Id" Type="Int32" />
            <asp:Parameter DbType="Date" Name="original_fecha" />
            <asp:Parameter Name="original_cantidad" Type="Int32" />
            <asp:Parameter Name="original_id_producto" Type="Int32" />
            <asp:Parameter Name="original_observaciones" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter DbType="Date" Name="fecha" />
            <asp:Parameter Name="cantidad" Type="Int32" />
            <asp:Parameter Name="id_producto" Type="Int32" />
            <asp:Parameter Name="observaciones" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter DbType="Date" Name="fecha" />
            <asp:Parameter Name="cantidad" Type="Int32" />
            <asp:Parameter Name="id_producto" Type="Int32" />
            <asp:Parameter Name="observaciones" Type="String" />
            <asp:Parameter Name="original_Id" Type="Int32" />
            <asp:Parameter DbType="Date" Name="original_fecha" />
            <asp:Parameter Name="original_cantidad" Type="Int32" />
            <asp:Parameter Name="original_id_producto" Type="Int32" />
            <asp:Parameter Name="original_observaciones" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

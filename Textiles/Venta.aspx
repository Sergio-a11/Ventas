<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Venta.aspx.cs" Inherits="Textiles.Venta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" AutoGenerateRows="False" CellPadding="4" DataKeyNames="Id" DataSourceID="ventas" ForeColor="#333333" GridLines="None" Height="229px" Width="363px">
    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
    <EditRowStyle BackColor="#999999" />
    <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
    <Fields>
        <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
        <asp:BoundField DataField="fecha" HeaderText="Fecha" SortExpression="fecha" />
        <asp:BoundField DataField="cantidad" HeaderText="Cantidad" SortExpression="cantidad" />
        <asp:BoundField DataField="id_cliente" HeaderText="Cliente ID" SortExpression="id_cliente" />
        <asp:BoundField DataField="id_producto" HeaderText="Producto ID" SortExpression="id_producto" />
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
<asp:SqlDataSource ID="ventas" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:textilesConnectionString %>" DeleteCommand="DELETE FROM [venta] WHERE [Id] = @original_Id AND (([fecha] = @original_fecha) OR ([fecha] IS NULL AND @original_fecha IS NULL)) AND (([cantidad] = @original_cantidad) OR ([cantidad] IS NULL AND @original_cantidad IS NULL)) AND (([id_cliente] = @original_id_cliente) OR ([id_cliente] IS NULL AND @original_id_cliente IS NULL)) AND (([id_producto] = @original_id_producto) OR ([id_producto] IS NULL AND @original_id_producto IS NULL)) AND (([observaciones] = @original_observaciones) OR ([observaciones] IS NULL AND @original_observaciones IS NULL))" InsertCommand="INSERT INTO [venta] ([fecha], [cantidad], [id_cliente], [id_producto], [observaciones]) VALUES (@fecha, @cantidad, @id_cliente, @id_producto, @observaciones)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [venta]" UpdateCommand="UPDATE [venta] SET [fecha] = @fecha, [cantidad] = @cantidad, [id_cliente] = @id_cliente, [id_producto] = @id_producto, [observaciones] = @observaciones WHERE [Id] = @original_Id AND (([fecha] = @original_fecha) OR ([fecha] IS NULL AND @original_fecha IS NULL)) AND (([cantidad] = @original_cantidad) OR ([cantidad] IS NULL AND @original_cantidad IS NULL)) AND (([id_cliente] = @original_id_cliente) OR ([id_cliente] IS NULL AND @original_id_cliente IS NULL)) AND (([id_producto] = @original_id_producto) OR ([id_producto] IS NULL AND @original_id_producto IS NULL)) AND (([observaciones] = @original_observaciones) OR ([observaciones] IS NULL AND @original_observaciones IS NULL))">
    <DeleteParameters>
        <asp:Parameter Name="original_Id" Type="Int32" />
        <asp:Parameter DbType="Date" Name="original_fecha" />
        <asp:Parameter Name="original_cantidad" Type="Int32" />
        <asp:Parameter Name="original_id_cliente" Type="Int32" />
        <asp:Parameter Name="original_id_producto" Type="Int32" />
        <asp:Parameter Name="original_observaciones" Type="String" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter DbType="Date" Name="fecha" />
        <asp:Parameter Name="cantidad" Type="Int32" />
        <asp:Parameter Name="id_cliente" Type="Int32" />
        <asp:Parameter Name="id_producto" Type="Int32" />
        <asp:Parameter Name="observaciones" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter DbType="Date" Name="fecha" />
        <asp:Parameter Name="cantidad" Type="Int32" />
        <asp:Parameter Name="id_cliente" Type="Int32" />
        <asp:Parameter Name="id_producto" Type="Int32" />
        <asp:Parameter Name="observaciones" Type="String" />
        <asp:Parameter Name="original_Id" Type="Int32" />
        <asp:Parameter DbType="Date" Name="original_fecha" />
        <asp:Parameter Name="original_cantidad" Type="Int32" />
        <asp:Parameter Name="original_id_cliente" Type="Int32" />
        <asp:Parameter Name="original_id_producto" Type="Int32" />
        <asp:Parameter Name="original_observaciones" Type="String" />
    </UpdateParameters>
</asp:SqlDataSource>
</asp:Content>

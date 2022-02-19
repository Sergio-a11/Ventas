<%@ Page Title="" Language="C#" MasterPageFile="~/plantilla.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Textiles.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ListView ID="ListView1" runat="server" DataSourceID="ConexionBD" GroupItemCount="3">
        <AlternatingItemTemplate>
            <td runat="server" style="background-color:#FFF8DC;">nombre:
                <asp:Label ID="nombreLabel" runat="server" Text='<%# Eval("nombre") %>' />
                <br />talla:
                <asp:Label ID="tallaLabel" runat="server" Text='<%# Eval("talla") %>' />
                <br />precio:
                <asp:Label ID="precioLabel" runat="server" Text='<%# Eval("precio") %>' />
                <br />observaciones:
                <asp:Label ID="observacionesLabel" runat="server" Text='<%# Eval("observaciones") %>' />
                <br /></td>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <td runat="server" style="background-color:#008A8C;color: #FFFFFF;">nombre:
                <asp:TextBox ID="nombreTextBox" runat="server" Text='<%# Bind("nombre") %>' />
                <br />talla:
                <asp:TextBox ID="tallaTextBox" runat="server" Text='<%# Bind("talla") %>' />
                <br />precio:
                <asp:TextBox ID="precioTextBox" runat="server" Text='<%# Bind("precio") %>' />
                <br />observaciones:
                <asp:TextBox ID="observacionesTextBox" runat="server" Text='<%# Bind("observaciones") %>' />
                <br />
                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Actualizar" />
                <br />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancelar" />
                <br /></td>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                <tr>
                    <td>No se han devuelto datos.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <EmptyItemTemplate>
<td runat="server" />
        </EmptyItemTemplate>
        <GroupTemplate>
            <tr id="itemPlaceholderContainer" runat="server">
                <td id="itemPlaceholder" runat="server"></td>
            </tr>
        </GroupTemplate>
        <InsertItemTemplate>
            <td runat="server" style="">nombre:
                <asp:TextBox ID="nombreTextBox" runat="server" Text='<%# Bind("nombre") %>' />
                <br />talla:
                <asp:TextBox ID="tallaTextBox" runat="server" Text='<%# Bind("talla") %>' />
                <br />precio:
                <asp:TextBox ID="precioTextBox" runat="server" Text='<%# Bind("precio") %>' />
                <br />observaciones:
                <asp:TextBox ID="observacionesTextBox" runat="server" Text='<%# Bind("observaciones") %>' />
                <br />
                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insertar" />
                <br />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Borrar" />
                <br /></td>
        </InsertItemTemplate>
        <ItemTemplate>
            <td runat="server" style="background-color:#DCDCDC;color: #000000;">nombre:
                <asp:Label ID="nombreLabel" runat="server" Text='<%# Eval("nombre") %>' />
                <br />talla:
                <asp:Label ID="tallaLabel" runat="server" Text='<%# Eval("talla") %>' />
                <br />precio:
                <asp:Label ID="precioLabel" runat="server" Text='<%# Eval("precio") %>' />
                <br />observaciones:
                <asp:Label ID="observacionesLabel" runat="server" Text='<%# Eval("observaciones") %>' />
                <br /></td>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="groupPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <tr id="groupPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;"></td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <td runat="server" style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">nombre:
                <asp:Label ID="nombreLabel" runat="server" Text='<%# Eval("nombre") %>' />
                <br />talla:
                <asp:Label ID="tallaLabel" runat="server" Text='<%# Eval("talla") %>' />
                <br />precio:
                <asp:Label ID="precioLabel" runat="server" Text='<%# Eval("precio") %>' />
                <br />observaciones:
                <asp:Label ID="observacionesLabel" runat="server" Text='<%# Eval("observaciones") %>' />
                <br /></td>
        </SelectedItemTemplate>
    </asp:ListView>
<asp:SqlDataSource ID="ConexionBD" runat="server" ConnectionString="<%$ ConnectionStrings:textilesConnectionString %>" SelectCommand="SELECT [nombre], [talla], [precio], [observaciones] FROM [ropa]"></asp:SqlDataSource>

</asp:Content>

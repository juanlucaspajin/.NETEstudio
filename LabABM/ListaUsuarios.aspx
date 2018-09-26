<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ListaUsuarios.aspx.cs" Inherits="ListaUsuarios" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 240px;
        }
        .auto-style2 {
            width: 496px;
        }
        .auto-style3 {
            width: 240px;
            height: 23px;
        }
        .auto-style4 {
            width: 496px;
            height: 23px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="grdUsuarios" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="ObjectDataSource1">
            <Columns>
                <asp:CommandField ButtonType="Button" ShowDeleteButton="True" />
                <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" />
                <asp:BoundField DataField="Apellido" HeaderText="Apellido" SortExpression="Apellido" />
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                <asp:BoundField DataField="NombreUsuario" HeaderText="NombreUsuario" SortExpression="NombreUsuario" />
                <asp:BoundField DataField="FechaNac" HeaderText="FechaNac" SortExpression="FechaNac" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:HyperLinkField DataNavigateUrlFields="Id" DataNavigateUrlFormatString="ListaUsuarios.aspx?id={0}" Text="Editar" />
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DataObjectTypeName="Negocio.Usuarios" DeleteMethod="BorrarUsuario" SelectMethod="GetAll" TypeName="Negocio.ManagerUsuarios" UpdateMethod="ActualizarUsuario"></asp:ObjectDataSource>
        <br />
        <br />
        <table style="width: 75%;">
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style2">
                    <asp:Label ID="lblAccion" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3" style="text-align: right">Apellido</td>
                <td class="auto-style4">
                    <asp:TextBox ID="txtApellido" runat="server" Width="342px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1" style="text-align: right">Nombre</td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtNombre" runat="server" Width="340px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1" style="text-align: right">Tipo de Documento</td>
                <td class="auto-style2">
                    <asp:RadioButtonList ID="rblTipoDocumento" runat="server">
                        <asp:ListItem Value="1">DNI</asp:ListItem>
                        <asp:ListItem Value="2">LC / LE</asp:ListItem>
                        <asp:ListItem Value="3">Cédula de identidad</asp:ListItem>
                        <asp:ListItem Value="4">Pasaporte</asp:ListItem>
                        <asp:ListItem Value="5">Otro</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td class="auto-style1" style="text-align: right">Numero de Documento</td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtNroDocumento" runat="server" Width="189px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1" style="text-align: right">Fecha de nacimiento</td>
                <td class="auto-style2">
                    <asp:DropDownList ID="ddlDiaFechaNacimiento" runat="server">
                    </asp:DropDownList>
&nbsp;
                    <asp:DropDownList ID="ddlMesFechaNacimiento" runat="server">
                        <asp:ListItem Value="1">Enero</asp:ListItem>
                        <asp:ListItem Value="2">Febrero</asp:ListItem>
                        <asp:ListItem Value="3">Marzo</asp:ListItem>
                        <asp:ListItem Value="4">Abril</asp:ListItem>
                        <asp:ListItem Value="5">Mayo</asp:ListItem>
                        <asp:ListItem Value="6">Junio</asp:ListItem>
                        <asp:ListItem Value="7">Julio</asp:ListItem>
                        <asp:ListItem Value="8">Agosto</asp:ListItem>
                        <asp:ListItem Value="9">Septiembre</asp:ListItem>
                        <asp:ListItem Value="10">Octubre</asp:ListItem>
                        <asp:ListItem Value="11">Noviembre</asp:ListItem>
                        <asp:ListItem Value="12">Diciembre</asp:ListItem>
                    </asp:DropDownList>
&nbsp;
                    <asp:TextBox ID="txtAnioFechaNacimiento" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1" style="text-align: right">Direccion</td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtDireccion" runat="server" Height="82px" TextMode="MultiLine" Width="254px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1" style="text-align: right">Telefono</td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtTelefono" runat="server" Width="250px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1" style="text-align: right">E-Mail</td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtEmail" runat="server" Width="250px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1" style="text-align: right">Celular</td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtCelular" runat="server" Width="250px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1" style="text-align: right">Nombre Usuario</td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtNombreUsuario" runat="server" Width="250px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1" style="text-align: right">Clave</td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtClave" runat="server" Width="250px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1" style="text-align: right">Confirmar Clave</td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtConfirmarClave" runat="server" Width="250px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1" style="text-align: right">
                    <asp:Button ID="btnGuardar" runat="server" OnClick="btnGuardar_Click" Text="Guardar" />
                </td>
                <td class="auto-style2">
                    <asp:Button ID="btnCancelar" runat="server" OnClick="btnCancelar_Click" Text="Cancelar" />
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>

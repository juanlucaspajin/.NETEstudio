using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;

public partial class ListaUsuarios : System.Web.UI.Page
{
    private ManagerUsuarios _manager;

    private ManagerUsuarios ManagerUsuario
    {
        get { return _manager; }
        set { _manager = value; }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        this.CargarDiasFechaNacimiento();
        this.ManagerUsuario = new ManagerUsuarios();

        if (PaginaEnEstadoEdicion())
        {
            int id = Int32.Parse(Request.QueryString["id"]);
            this.lblAccion.Text = "Editar usuario " + id.ToString();
            Usuarios usuario = this.ManagerUsuario.GetUsuario(id);
            this.CargaUsuario(usuario);
        }
        else
        {
            this.lblAccion.Text = "Agregar nuevo usuario";
        }
    }

    private void CargarDiasFechaNacimiento()
    {
        if (Page.IsPostBack == false)
        {
            for (int i = 1; i <= 31; i++)
            {
                this.ddlDiaFechaNacimiento.Items.Add(i.ToString());
            }
        }
    }

    private bool PaginaEnEstadoEdicion()
    {
        if (Request.QueryString["id"] != null)
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    private void CargaUsuario(Usuarios usu)
    {
        int dia, mes ,anio;
        this.txtApellido.Text = usu.Apellido;
        this.txtNombre.Text = usu.Nombre;
        this.rblTipoDocumento.SelectedValue = usu.TipoDoc.ToString();
        this.txtNroDocumento.Text = usu.NroDoc.ToString();
        dia = Int32.Parse(usu.FechaNac.Substring(0, 2));
        mes = Int32.Parse(usu.FechaNac.Substring(3,2));
        anio = Int32.Parse(usu.FechaNac.Substring(6, 4));
        this.ddlDiaFechaNacimiento.SelectedValue = dia.ToString();
        this.ddlMesFechaNacimiento.SelectedValue = mes.ToString();
        this.txtAnioFechaNacimiento.Text = anio.ToString();
        this.txtDireccion.Text = usu.Direccion;
        this.txtTelefono.Text = usu.Telefono;
        this.txtEmail.Text = usu.Email;
        this.txtCelular.Text = usu.Celular;
        this.txtNombreUsuario.Text = usu.NombreUsuario;
        this.txtClave.Text = usu.Clave;
    }

    private Usuarios GuardarUsuario()
    {
        Usuarios user = new Usuarios();
        if (Request.QueryString["id"] != null)
        {
            user.Id = Int32.Parse(Request.QueryString["id"]);
        }
        user.Apellido = this.txtApellido.Text;
        user.Nombre = this.txtNombre.Text;
        user.TipoDoc = Int32.Parse(this.rblTipoDocumento.SelectedValue);
        user.NroDoc = Int32.Parse(this.txtNroDocumento.Text);
        user.FechaNac = this.ddlDiaFechaNacimiento.SelectedValue + "/" + this.ddlMesFechaNacimiento.SelectedValue + "/" + this.txtAnioFechaNacimiento.Text;
        user.Direccion = this.txtDireccion.Text;
        user.Telefono = this.txtTelefono.Text;
        user.Email = this.txtEmail.Text;
        user.Celular = this.txtCelular.Text;
        user.NombreUsuario = this.txtNombreUsuario.Text;
        user.Clave = this.txtClave.Text;
        return user;
    }
    protected void btnGuardar_Click(object sender, EventArgs e)
    {
        Usuarios user = this.GuardarUsuario();
        if (PaginaEnEstadoEdicion())
        {

            this.ManagerUsuario.ActualizarUsuario(user);
        }
        else
        {
            this.ManagerUsuario.AgregarUsuario(user);
        }

        Response.Redirect("~/ListaUsuarios.aspx");
    }
    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ListaUsuarios.aspx");
    }

}
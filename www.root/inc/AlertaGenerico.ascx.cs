using Classes.Enumeradores;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class inc_AlertaGenerico : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {


    }
    public void ShowMessager(string Mensagem, StatusEnum Status, string Titulo = "")
    {
        lblTitulo.Visible = !string.IsNullOrEmpty(Titulo);
        lblConteudo.InnerHtml = Mensagem;
        lblTitulo.InnerHtml = Titulo;
        if (Status == StatusEnum.Success)
        {
            pnlAlert.CssClass = "alert alert-success alert-dismissible    ";
        }
        if (Status == StatusEnum.Failure)
        {
            pnlAlert.CssClass = "alert alert-danger alert-dismissibler   ";
        }
        if (Status == StatusEnum.Info)
        {
            pnlAlert.CssClass = "alert alert-info alert-dismissible   ";
        }
        if (Status == StatusEnum.warning)
        {
            pnlAlert.CssClass = "alert alert-warning alert-dismissible ";
        }
        ScriptManager.RegisterStartupScript(this, Page.GetType(), "", " $('.alert').toggle(1000).delay(5000).toggle(1000);", true);
    }
}
using Classes.VO;
using Library.Inclock.web.br.BL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Logout_Default : System.Web.UI.Page
{
    protected override void OnInit(EventArgs e)
    {
        lvMobile.ItemDataBound += LvMobile_ItemDataBound;
        lvMobile.ItemCommand += LvMobile_ItemCommand;
    }

    private void LvMobile_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "desconectar")
        {
            Funcionarios.DesonnectarUsuarioMobile(Convert.ToInt32(e.CommandArgument));
            Response.Write("<script>alert('usuario desconectado');window.location.href = window.location.href</script>");
        }
    }

    private void LvMobile_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        var item = (User)e.Item.DataItem;
        var id = (Label)e.Item.FindControl("txtId");
        var nome = (Label)e.Item.FindControl("txtNome");
        nome.Text = item.Nome;
        ((Button)e.Item.FindControl("btnDesconectar")).CommandArgument = id.Text = item.Id.ToString();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lvMobile.DataSource = Funcionarios.GetUserLogadosMobile();
            lvMobile.DataBind();
        }
    }
}
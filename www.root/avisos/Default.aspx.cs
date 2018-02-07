using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class noticia_Default : Autenticacao
{
    public int TipoPagina
    {
        get
        {
            int n1;
            int.TryParse(Request.QueryString["acao"], out n1);
            return n1;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
       
        if (TipoPagina == 1)
        {
            pnlCorpo.Controls.Add(LoadControl("~/inc/avisos/Cadastrar.ascx"));           
        }
        else if (TipoPagina == 2)
        {
            pnlCorpo.Controls.Add(LoadControl("~/inc/avisos/Alterar.ascx"));
        }
        else if (TipoPagina == 3)
        {
            pnlCorpo.Controls.Add(LoadControl("~/inc/avisos/Excluir.ascx"));
        }
        else
            pnlCorpo.Controls.Add(LoadControl("~/inc/avisos/Listar.ascx"));
        //   Response.Redirect("/");
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class avisos_Default : System.Web.UI.Page
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
        
                pnlCorpo.Controls.Add(LoadControl("~/inc/avisos/Cadastrar.ascx"));
            
                pnlCorpo.Controls.Add(LoadControl("~/inc/avisos/Alterar.ascx"));
          
                pnlCorpo.Controls.Add(LoadControl("~/inc/avisos/Excluir.ascx"));               
    }
}
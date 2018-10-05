using Library.Inclock.web.br.BL.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Ponto_Ponto : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ucExpediente.BuscaEspediente(Autenticador.CurrentUser.Id);
        }
    }    
}
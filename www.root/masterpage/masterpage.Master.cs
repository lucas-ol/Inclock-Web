using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Library.Inclock.web.br.BL.Common;


public partial class masterpage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
           topoFunc.Visible = !(topoAdm.Visible = Autenticador.CurrentUser.Roles.Contains("ADM"));
            
        }

    }
        
}

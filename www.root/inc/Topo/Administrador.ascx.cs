﻿using Library.Inclock.web.br.BL.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class inc_Topo_Administrador : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!HttpContext.Current.Request.IsAuthenticated)
        {
            ucLogin.Visible = true;
            btnLogout.Visible = false;

        }
        else
        {
            ucLogin.Visible = false;
            btnLogout.Visible = true;
        }
    }
    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Autenticador.Logout();
    }
}
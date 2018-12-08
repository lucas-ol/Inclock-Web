using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Relatorios_Funcionario : System.Web.UI.Page
{
    
    public int UserId
    {
        get
        {
            int id;
            int.TryParse(Request.QueryString["id"], out id);
            return id;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ObterFuncionario();
        }
    }
    public void ObterFuncionario()
    {
        if (UserId != 0)
        {
            var user = new Library.Inclock.web.br.BL.Funcionarios().GetUser(UserId);
            if (user.Id != 0)
                hdnFuncionario.Value =string.Concat("[{\"Id\":", user.Id, ",\"Nome\":\"", user.Nome, "\"}]");
        }
    }
}
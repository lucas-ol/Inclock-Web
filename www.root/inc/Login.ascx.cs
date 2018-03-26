using Classes.VO;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class inc_Login : System.Web.UI.UserControl
{
    protected string ReturnUrl
    {
        get
        {
            string str = string.IsNullOrEmpty(Request.QueryString["ReturnUrl"]) ? "/" : Request.QueryString["ReturnUrl"];
            return str;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnLogar_Click(object sender, EventArgs e)
    {
        Funcionario funcionarioJson = new Funcionario { Id = 0 };
        Library.Inclock.web.br.BL.Login login = new Library.Inclock.web.br.BL.Login();
        // vai buscar no banco de dados      
        funcionarioJson = login.Logar(new Classes.VO.User { Senha = txtSenha.Text, Login = txtLogin.Text });

        if (funcionarioJson.Id == 0) // se for nulo ele vai verificar no arquivo de dados local
            funcionarioJson = login.LoginForms(new Classes.VO.User { Senha = txtSenha.Text, Login = txtLogin.Text }, Server.MapPath("/config/users.json"));

        if (funcionarioJson != null)
        {
            FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(1, "funcionario", DateTime.Now, DateTime.MaxValue, false, Newtonsoft.Json.JsonConvert.SerializeObject(funcionarioJson), FormsAuthentication.FormsCookiePath);
            string encrypt = FormsAuthentication.Encrypt(ticket);
            Response.Cookies.Add(new HttpCookie(FormsAuthentication.FormsCookieName, encrypt));
            Response.Redirect(FormsAuthentication.GetRedirectUrl(ReturnUrl, false), true);
        }
        else
        {
            lblMensagem.Visible = true;
            lblMensagem.InnerText = "Login ou senha não encontrado";
        }
    }

    private void RegistraScript(string script, Page pagina, bool AdicionaTag)
    {
        ScriptManager.RegisterStartupScript(pagina, pagina.GetType(), "", script, AdicionaTag);
    }
}
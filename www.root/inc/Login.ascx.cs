using Classes.VO;
using System;
using System.Collections.Generic;
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
            string str = string.IsNullOrEmpty(Request.QueryString["ReturnUrl"])? "" : Request.QueryString["ReturnUrl"].Split('?')[0];
            return str;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        bool http = Request.RequestContext.HttpContext.Request.IsAuthenticated;
        if (HttpContext.Current.Request.IsAuthenticated)
        {
            RegistraScript("alert('bem vindo novamente')", this.Page, true);
        }
    }

    protected void btnLogar_Click(object sender, EventArgs e)
    {
        Funcionario funcionario = new Funcionario();

        Library.Inclock.web.br.BL.Login login = new Library.Inclock.web.br.BL.Login();
        funcionario = login.Logar(new Classes.VO.User { Senha = txtSenha.Text, Login = txtLogin.Text });
      

        if (funcionario != null)
        {
            FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(1, funcionario.Nome, DateTime.Now, DateTime.MaxValue, false, funcionario.Login, FormsAuthentication.FormsCookiePath);
            string encrypt = FormsAuthentication.Encrypt(ticket);
            Response.Cookies.Add(new HttpCookie(FormsAuthentication.FormsCookieName, encrypt));
            RegistraScript("alert('bem vindo " + funcionario.Nome + "URL: " + FormsAuthentication.GetRedirectUrl(ReturnUrl, false) +"');window.location.href='/'", this.Page, true);
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
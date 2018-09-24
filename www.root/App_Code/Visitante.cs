using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Security.Principal;
using Classes.VO;
using System.Web.Security;

/// <summary>
/// Descrição resumida de Visitante
/// </summary>
public class Visitante
{
    public static readonly Visitante Instance = new Visitante();
    public Visitante()
    {
        //
        // TODO: Adicionar lógica do construtor aqui
        //
    }
    public static bool IsFunc
    {
        get
        {
            return !Visitante.CurrentUser.Roles.Contains("ADM");
        }
    }
    public FormsAuthenticationTicket Ticket
    {
        get
        {
            FormsAuthenticationTicket ticket;
            HttpCookie Cookieticket = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName];
            if (Cookieticket != null)
            {
                ticket = FormsAuthentication.Decrypt(Cookieticket.Value);
            }
            else
                ticket = null;
            return ticket;
        }
    }
    public static Funcionario CurrentUser
    {
        get
        {
            Funcionario func = new Funcionario();
            var ticket = Instance.Ticket;
            if (ticket != null)
            {
                func = Newtonsoft.Json.JsonConvert.DeserializeObject<Funcionario>(ticket.UserData);
            }
            return func;
        }
    }
    public void Autenticar()
    {
        if (Ticket != null && !HttpContext.Current.User.Identity.IsAuthenticated)
        {
            GenericPrincipal identity = new GenericPrincipal(new GenericIdentity(Ticket.Name), CurrentUser.Roles.ToArray());
            HttpContext.Current.User = identity;
        }
    }
    public static void CriaCookieIntegracao(Funcionario use)
    {
       
        var tcxt =  Classes.Common.Rijndael.Criptografar(use.Roles.ToArray());
        var tx = System.Text.Encoding.ASCII.GetString(tcxt);    
        var versa = Convert.ToByte(tx);
        var cookie = new HttpCookie("integracao", tx);
        HttpContext.Current.Response.Cookies.Add(cookie);
    }
  
}

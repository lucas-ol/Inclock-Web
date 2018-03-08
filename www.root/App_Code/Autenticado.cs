using Classes.VO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.Security;

/// <summary>
/// Summary description for Autenticado
/// </summary>
public class Autenticado
{

    public Funcionario CurrentUser
    {
        get
        {
            Funcionario func = new Funcionario();
            Newtonsoft.Json.JsonConvert.DeserializeObject<List<Funcionario>>(Ticket.UserData);
            return func;
        }
    }
    private FormsAuthenticationTicket Ticket
    {
        get
        {
            FormsAuthenticationTicket ticket;
            HttpCookie Cookieticket = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName];
            if (Cookieticket != null && !HttpContext.Current.User.Identity.IsAuthenticated)
            {
                ticket = FormsAuthentication.Decrypt(Cookieticket.Value);
            }
            else
                ticket = null; 
            return ticket;
        }
    }
    public Autenticado()
    {

    }    
    public void Autenticar()
    {
        if (Ticket != null)
        {
            GenericPrincipal identity = new GenericPrincipal(new GenericIdentity(Ticket.Name), CurrentUser.Roles.Split(';'));
            HttpContext.Current.User = identity;
        }
    }
}
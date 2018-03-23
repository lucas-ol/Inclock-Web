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
    public static bool IsFunc
    {
        get
        {
            bool bt = false;
            if (new Autenticado().Ticket != null)
            {
                bt = CurrentUser.Roles.Equals("FUNCIONARIO");
            }
            return bt;
        }
    }
   public static Funcionario CurrentUser
    {
        get
        {
            Funcionario func = new Funcionario();
            var ticket = new Autenticado().Ticket;
            if (ticket != null)
            {
                func = Newtonsoft.Json.JsonConvert.DeserializeObject<Funcionario>(ticket.UserData);
            }
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
            GenericPrincipal identity = new GenericPrincipal(new GenericIdentity(Ticket.Name), CurrentUser.Roles.ToArray());
            HttpContext.Current.User = identity;
        }
    }
}
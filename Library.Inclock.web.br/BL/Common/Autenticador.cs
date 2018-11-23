using Classes.Common;
using Classes.VO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace Library.Inclock.web.br.BL.Common
{
    public class Autenticador
    {
        public static readonly Autenticador Instance = new Autenticador();

        public static bool IsFunc
        {
            get
            {
                return !CurrentUser.Roles.Contains("ADM");
            }
        }
        private static List<int> _logados = (List<int>)HttpContext.Current.Application["logados"];
        public static List<int> Logados
        {
            get
            {
                return _logados;
            }
            set { _logados = value; }
        }
        public static FormsAuthenticationTicket Ticket
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
                var ticket = Ticket;
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

            var content = Rijndael.Criptografar(use.Roles.ToArray());
            var integracao = content.ToBase64();

            var cookie = new HttpCookie("integracao", integracao);
            HttpContext.Current.Response.Cookies.Add(cookie);
        }
        public static void Logout()
        {
            FormsAuthentication.SignOut();
            if (HttpContext.Current != null)
            {
                HttpContext.Current.Session.Abandon();
                HttpContext.Current.Session.Clear();
                HttpContext.Current.Response.Cookies.Add(new HttpCookie(FormsAuthentication.FormsCookieName, "") { Expires = DateTime.Now.AddDays(-1) });
                HttpContext.Current.Response.Cookies.Add(new HttpCookie("integracao", "") { Expires = DateTime.Now.AddDays(-1) });
                HttpContext.Current.Response.Redirect("/");
            }
        }
    }
}

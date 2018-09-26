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

namespace Library.Inclock.web.br.BL.Common
{
    class Autenticador
    {
        public static readonly Autenticador Instance = new Autenticador();
       
        public static bool IsFunc
        {
            get
            {
                return !CurrentUser.Roles.Contains("ADM");
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

            var content =  Rijndael.Criptografar(use.Roles.ToArray());
            var integracao = content.ToBase64();

            var cookie = new HttpCookie("integracao", integracao);
            HttpContext.Current.Response.Cookies.Add(cookie);
        }

    }
}

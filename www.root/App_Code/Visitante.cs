using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Security.Principal;
using Classes.VO;
using System.Web.Security;
using System.Security.Cryptography;
using System.Text;
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
    public static string CriaCookieIntegracao(Funcionario use)
    {
        var cookie = new HttpCookie("Integracao", string.Join("", use.Roles));
        RSAParameters parameters = new RSAParameters() { D = Encoding.UTF8.GetBytes("3233"), Q = Encoding.UTF8.GetBytes("17") };
        var crip = new RSACryptoServiceProvider();
       
        crip.ImportParameters(crip.ExportParameters(false));
        var bp = crip.Encrypt(Encoding.UTF8.GetBytes("kiko"),false);

        var de = Encoding.UTF8.GetString(crip.Decrypt(bp, false));
        return bp.ToString();
    }

}
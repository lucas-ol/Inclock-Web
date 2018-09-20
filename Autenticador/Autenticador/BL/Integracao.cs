using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.ServiceModel.Web;
using System.Text;
using System.Threading.Tasks;
using System.Web.Security;
using Classes.VO;
using Newtonsoft.Json;
using Classes.Interface;
namespace Autenticador.BL
{
    public class Integracao
    {
        private WebHeaderCollection GetHeaders()
        {
            IncomingWebRequestContext request = WebOperationContext.Current.IncomingRequest;
            return request.Headers;
        }
        public bool ValidaSessão()
        {
            var readers = GetHeaders();
            Autenticador.Autenticar(readers["aut"]);
            return false;
        }
        public class Autenticador : IRole
        {
            public IEnumerable<string> Roles => new List<string>() { "ADM", "ROOT" };

            public static void Autenticar(string encryptedToken)
            {
                
                try
                {
                    var tk = FormsAuthentication.Decrypt(encryptedToken);
                    
                    var vrt = JsonConvert.DeserializeObject<Funcionario>(tk.UserData);
                }
                catch (Exception ex)
                {

                    throw;
                }
            }

            public bool IsInRole(string[] role)
            {
                foreach (string item in role)                
                    if (Roles.Contains(item))
                        return true;
                
                return false;
            }
        }
    }
}

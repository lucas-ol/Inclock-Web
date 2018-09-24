using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.ServiceModel.Web;
using System.Text;
using System.Threading.Tasks;
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
                    byte[] bt = Encoding.ASCII.GetBytes(encryptedToken);
                    var tk = Classes.Common.Rijndael.Descriptografar(bt);
                    var vrt = JsonConvert.DeserializeObject<Funcionario>(tk);
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

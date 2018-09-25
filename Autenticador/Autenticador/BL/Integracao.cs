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
        public class Autenticador : Classes.Common.Role
        {
            delegate string CallMethodo();
            public static void Autenticar(string encryptedToken)
            {
                try
                {
                    var bt = Classes.Common.Rijndael.DescriptografaFromBase64(encryptedToken);
                }
                catch (Exception ex)
                {

                    throw;
                }
            }

        }
    }
}

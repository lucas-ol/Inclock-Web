using Classes.Common;
using Classes.VO;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel;
using System.ServiceModel.Channels;
using System.Text;
using System.Threading.Tasks;

namespace Library.Inclock.web.br.BL
{
    public class Expedientes
    {
        public List<Expediente> ListaExpediente(int funcionario_Id)
        {
            return ListaExpediente(funcionario_Id, 0);
        }
        public List<Expediente> ListaExpediente(int funcionario_Id, int semana)
        {
            List<Expediente> expediente = new List<Expediente>();

            if (funcionario_Id <= 0)            
                return expediente;
            
            string cifra = Rijndael.Criptografar(string.Join(";", Common.Autenticador.CurrentUser.Roles)).ToBase64();
            var headers = new List<KeyValuePair<string, string>> {
                new KeyValuePair<string, string>("integracao",cifra)              
            };
            using (var client = new Client(headers))
            {
                try
                {
                    var responce = client.Service.GetExpediente(semana.ToString(), funcionario_Id.ToString());
                    expediente.AddRange(responce);
                }
                catch (Exception ex)
                {
                    throw ex;
                }
                
            }

            return expediente;
        }


    }
}

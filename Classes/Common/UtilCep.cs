using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Script.Serialization;
using System.Web.Script.Services;

namespace Classes.Common
{
    public class UtilCep
    {
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string BuscaCep(string strCep)
        {
            JavaScriptSerializer js = new JavaScriptSerializer();
            string Cep = strCep.Trim().Replace("-", "").Replace(".", "");//remove os pontos eos traços
            if (Cep == null || Cep.Length <= 7 || Cep.Length >= 9)
                return js.Serialize("erro:true"); // se o usuario digitar um cep que tenha um tamanho invalido ele vai retornar um erro em XML           
            string strDadosCep = "";

            try
            {
                DataSet dt = new DataSet();
                dt.ReadXml("http://viacep.com.br/ws/" + Cep + "/xml/");

                Dictionary<string, string> json = new Dictionary<string, string>();
                foreach (DataRow linha in dt.Tables[0].Rows)
                {
                    foreach (DataColumn coluna in dt.Tables[0].Columns)
                    {
                        json.Add(coluna.ColumnName, (string)linha[coluna]);
                    }
                }
                strDadosCep = js.Serialize(json);
            }
            catch (Exception)
            {
                return js.Serialize("erro:true");
            }
            return strDadosCep;
        }
    }
}

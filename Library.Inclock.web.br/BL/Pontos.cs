using Classes.VO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Classes.Common;
namespace Library.Inclock.web.br.BL
{
    public class Pontos
    {
        public IEnumerable<Ponto> GetPontos(string InitialDate, string FinalDate, int func)
        {
            var pts = new List<Ponto>();
            string aut = Rijndael.Criptografar(string.Join(";", Common.Autenticador.CurrentUser.Roles)).ToBase64();
            var headers = new List<KeyValuePair<string, string>>() { new KeyValuePair<string, string>("integracao", aut) };

            using (var cli = new Client(headers))
            {
                pts = cli.Service.GetCheckPointByDate(InitialDate, FinalDate, func.ToString()).ToList();
            }
            return pts;
        }
    }
}

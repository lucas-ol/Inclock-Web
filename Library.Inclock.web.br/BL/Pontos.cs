using Classes.VO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Library.Inclock.web.br.BL
{
    public class Pontos
    {
        public List<Ponto> GetPontos(string InitialDate, string FinalDate,int func)
        {
            var autenticador = new Autenticador.ServiceClient();
            return autenticador.GetCheckPointByDate(InitialDate, FinalDate, func.ToString()).ToList();
          //  return new List<Ponto>();
        }
    }
}

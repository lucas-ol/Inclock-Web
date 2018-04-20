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
        public List<Ponto> GetPontos(string InitialDate, string FinalDate)
        {
            var autenticador = new Autenticador.ServiceClient();
            //return autenticador.GetCheckPointDateInterval(InitialDate, FinalDate);
            return new List<Ponto>();
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Library.Inclock.web.br.BL
{
    public class Pontos
    {
        public List<Pontos> GetPontos(string InitialDate, string FinalDate)
        {
            Autenticador.AutenticadorClient autenticador = new Autenticador.AutenticadorClient();
         //   return autenticador.GetCheckPointDateInterval(InitialDate, FinalDate);

        }
    }
}

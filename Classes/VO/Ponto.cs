using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Classes.VO
{
    public class Ponto
    {
        public string Id { get; set; }
        public int Funcionario { get; set; }
        public string DataEntrada { get; set; }
        public string Entrada { get; set; }
        public string DataSaida { get; set; }
        public string Saida { get; set; }
        public string Logitude { get; set; }
        public string Latitude { get; set; }
        public int Periodo { get; set; }
        public string Status { get; set; }
        public string Obs { get; set; }

        #region Conversores
        public TimeSpan TimeEntrada
        {
            get
            {
                DateTime time;
                DateTime.TryParse(Entrada, out time);
                return time.TimeOfDay;
            }
        }
        public TimeSpan TimeSaida
        {
            get
            {
                DateTime time;
                DateTime.TryParse(Saida, out time);
                return time.TimeOfDay;
            }
        }

        #endregion

    }

}

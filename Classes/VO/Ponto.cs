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
        public string Data { get; set; }
        public string Entrada { get; set; }
        public string Saida { get; set; }
        public string Logitude { get; set; }
        public string Latitude { get; set; }
        public int Periodo { get; set; }
        public string EntradaPausa { get; set; }
        public string SaidaPausa { get; set; }
        public TypePoint Type_Point { get; set; }

        public List<int> Status { get; set; } = new List<int>();
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
        public TimeSpan TimeSaidaPausa
        {
            get
            {
                DateTime time;
                DateTime.TryParse(SaidaPausa, out time);
                return time.TimeOfDay;
            }
        }
        public TimeSpan TimeEntradaPausa
        {
            get
            {
                DateTime time;
                DateTime.TryParse(EntradaPausa, out time);
                return time.TimeOfDay;
            }
        }
        #endregion


        public enum TypePoint
        {
            Entrada = 'E',
            Saida = 'S',
            Pausa = 'P',
            Retorno_Pausa = 'R'
        }

    }

}

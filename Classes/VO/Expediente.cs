using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Classes.VO
{
    /// <summary>
    /// Classe de expediente 
    /// </summary>
    public class Expediente
    {
        public int Id { get; set; }
        public int Funcionario_id { get; set; }
        public string Entrada { get; set; }
        public string Saida { get; set; }
        public string Horas_Trabalho { get; set; }
        public string Tempo_Pausa { get; set; }
        public int Periodo { get; set; }
        public int DiaSemana { get; set; }
        public Expediente()
        {
            Tempo_Pausa = "00:00";
        }

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
        


    }
}
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
        public int id { get; set; }
        public int IdFuncionario { get; set; }
        public TimeSpan Entrada { get; set; }
        public TimeSpan Saida { get; set; }
        public TimeSpan Horas_Trabalho { get; set; }
        public TimeSpan Tempo_Pausa { get; set; }
        public int Periodo { get; set; }
        public int Semana { get; set; }


    }
}
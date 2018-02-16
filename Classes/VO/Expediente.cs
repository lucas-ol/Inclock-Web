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
        public int funcionario_id { get; set; }
        public string Entrada { get; set; }
        public string Saida { get; set; }
        public string Horas_Trabalho { get; set; }
        public string Tempo_Pausa { get; set; }
        public int Periodo { get; set; }
        public int Semana { get; set; }


    }
}
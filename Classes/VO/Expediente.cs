using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using static Classes.VO.Ponto;

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
        public int Periodo { get; set; }
        public int PeriodoSaida { get; set; }
        public int DiaSemana { get; set; }
        public char Type { get; set; }
        public string HorasTrabalhada { get; set; }
        public Expediente()
        {

        }
    }
}
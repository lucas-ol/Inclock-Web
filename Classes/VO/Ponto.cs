using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Classes.VO
{
    public class Ponto
    {
        public int Id { get; set; }
        public int Funcionario { get; set; }
        public string DataEntrada { get; set; }
        public string Entrada { get; set; }
        public string DataSaida { get; set; }
        public string Saida { get; set; }
        public string Obs { get; set; }
        public Expediente Expediente { get; set; }
        public DateTime dt_Entrada { get; set; }
        public DateTime dt_Saida { get; set; }
        public bool Atraso { get; set; }
    }

}

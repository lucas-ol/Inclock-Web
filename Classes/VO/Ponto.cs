using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Classes.VO
{
    public class EspelhoPonto
    {
        public int Id { get; set; }
        public int Funcionario { get; set; }
        public string DataEntrada { get; set; }
        public string Entrada { get; set; }
        public string DataSaida { get; set; }
        public string Saida { get; set; }
        public int Periodo { get; set; }
        public string Status { get; set; }
        public string Obs { get; set; }
    }
    public class Ponto
    {
        public int Id { get; set; }
        public int Funcionario { get; set; }
        public int Expediente { get; set; }
        public string Data { get; set; }
        public string Hora { get; set; }
        public int Status { get; set; }
        public string Obs { get; set; }
        public string Tipo { get; set; }
    }

}

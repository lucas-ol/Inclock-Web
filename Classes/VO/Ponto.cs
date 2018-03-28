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
        public string Data { get; set; }
        public string Entrada { get; set; }
        public string Saida { get; set; }
        public string Logitude { get; set; }
        public string Latitude { get; set; }
        public int Periodo { get; set; }
        public string EntradaPausa { get; set; }
        public string SaidaPausa { get; set; }
        private List<string> status = new List<string>();
        public List<string> Status
        {
            get
            {
                return status;
            }
            set
            {
                status = value;
            }
        }
        public string Obs { get; set; }
    }
}

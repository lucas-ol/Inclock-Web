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
        public string Funcionario { get; set; }
        public string Data { get; set; }
        public string Hora { get; set; }
        public int periodo { get; set; }
        public string Logitude { get; set; }
        public string Latitude { get; set; }
    }
}

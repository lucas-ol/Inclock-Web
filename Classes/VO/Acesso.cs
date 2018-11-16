using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;

using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Classes.VO
{
   public class Acesso
    {
        public int Id { get; set; }
        public int  Funcionario_id { get; set; }
        public bool  Logado { get; set; }
        public DateTime DataLogin { get; set; }
        public string Dispositivo { get; set; }
    }
}

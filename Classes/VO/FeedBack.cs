using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Classes.VO
{
    public class FeedBack
    {
        public string Mensagem { get; set; }
        public bool Status { get;  set; } // true == tudo OK 

        public FeedBack()
        {
            
        }
    }
}

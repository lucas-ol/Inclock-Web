using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Classes.VO
{
   public class BulkConfig
    {
        public string TableName { get; set; }
        public string FieldTerminator { get; set; }
        public string LineTerminator { get; set; }
        public int NumberOfLinesToSkip { get; set; }
        public string File { get; set; }
    }
}

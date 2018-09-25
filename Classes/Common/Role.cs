using Classes.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Classes.Common
{
    public class Role 
    {
        protected IEnumerable<string> Roles => new List<string>();
        public bool IsInRole(string[] role)
        {            
            foreach (string item in role)
                if (Roles.Contains(item))
                    return true;
            return false;
        }

    }
}

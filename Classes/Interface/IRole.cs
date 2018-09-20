using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Classes.Interface
{
  public  interface IRole
    {
        IEnumerable<string> Roles { get;}
        bool IsInRole(string[] role);
    }
}

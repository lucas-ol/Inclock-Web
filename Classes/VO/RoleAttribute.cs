using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Security.AccessControl;
namespace Classes.VO
{
    [System.AttributeUsage(System.AttributeTargets.Method, Inherited = false, AllowMultiple = true)]
    public sealed class RoleAttribute : Attribute
    {
        public string[] Roles { get; set; }

    }
}


using Classes.VO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Classes.Common
{
    public class Role
    {
        public static IEnumerable<string> Roles { get; set; } = new List<string>();
        protected static bool IsInRole(string[] role)
        {
            foreach (string item in role)
                if (Roles.Contains(item))
                    return true;
            return false;
        }
        protected static bool IsInRole<T>(string[] role, string metodo = "")
        {
            if (!SetRoles(metodo, typeof(T))) // indica que o Metodo é livre
                return false;
            return IsInRole(role);
        }       

        private static bool SetRoles(string metodo, Type type)
        {
            try
            {
                var field = type.GetMethod(metodo);
                var role = (RoleAttribute)field.GetCustomAttributes(typeof(RoleAttribute), false)[0];
                Roles = role.Roles;
                return true;
            }
            catch (Exception)
            {
                return false;
            }

        }
    }
}

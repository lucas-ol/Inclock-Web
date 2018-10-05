using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Classes.VO
{
    public class User
    {
        public int Id { get; set; }
        public string Nome { get; set; }    
        public string Login { get; set; }   
        public string Senha { get; set; }
        public List<string> Roles { get; set; } = new List<string>();
        public static string ConvertToRoleStr(List<string> roles)
        {
            var str = string.Join(";", roles);          
            return str.LastIndexOf(";") == str.Length - 1 ? str.Remove(str.Length - 1) : str;
        }
    }

}

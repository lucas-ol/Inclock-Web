using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace Classes.VO
{
    public class Role
    {
        public string Value { get; set; }
        public string Text { get; set; }

        /// <summary>
        /// Metodo que vai pegar as roles apartir de um Json
        /// </summary>
        /// <param name="PathRoles">Local de onde esta o arquvio</param>
        /// <returns></returns>
        public static List<Role> GetRoles(string PathRoles)
        {
            List<Role> RoleGroup = new List<Role>();
            try
            {
                using (System.IO.StreamReader st = new System.IO.StreamReader(PathRoles))
                    RoleGroup = JsonConvert.DeserializeObject<List<Role>>(st.ReadToEnd());
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return RoleGroup;
        }
    }


}

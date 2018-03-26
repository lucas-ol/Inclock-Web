using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;

namespace Classes.Common
{
    public class UtilFile
    {
        /// <summary>
        /// metodo que verifica se um Aquivo ja existe 
        /// </summary>
        /// <param name="Diretorio">diretorio do aquivo com o nome</param>
        /// <returns></returns>
        static public bool FileExists(string Diretorio)
        {
            return File.Exists(Diretorio);
        }

        public static string FileStringReader(string Diretorio)
        {
            try
            {
                using (StreamReader st = new StreamReader(Diretorio))
                    return st.ReadToEnd();
            }
            catch (Exception ex)
            {
                throw new Exception("Erro acessar o aquivo", ex.InnerException);
            }
        }
    }
}

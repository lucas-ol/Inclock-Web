using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;

namespace Classes.Common
{
    public static class UtilFile
    {
        public static string AplicationDirectory { get { return AppDomain.CurrentDomain.BaseDirectory; } }
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
        public static FileStream CreateOrOpenFile(string filename, string diretorio)
        {
            try
            {
                FileStream fs = new FileStream(CreateFolder(diretorio).FullName + "\\" + filename, FileMode.OpenOrCreate, FileAccess.ReadWrite, FileShare.Delete);
                return fs;
            }
            catch (Exception ex)
            {
                UtilEmail.ErroMail(ex); //envia um email com o erro gerado
                throw ex;
            }
        }
        public static void FileWrite(string arquivo, string conteudo)
        {
            using (var fs = CreateOrOpenFile(GetFileName(arquivo), GetDirectoryName(arquivo)))
            {

          //      fs.Close();
            }
            try
            {
                using (StreamWriter sw = new StreamWriter(arquivo, true))
                {
                    sw.Write(conteudo);
                }
            }
            catch (Exception ex)
            {

                throw;
            }
        }
        public static DirectoryInfo CreateFolder(string nomePasta, string diretorio = "")
        {
            // string baseDirectory = AppDomain.CurrentDomain.BaseDirectory;
            if (Directory.Exists(diretorio + nomePasta))
                return new DirectoryInfo(diretorio + nomePasta);
            //  diretorio = diretorio.Remove(diretorio.LastIndexOf("//"));
            return Directory.CreateDirectory(diretorio + nomePasta);
        }
        public static string GetDirectoryName(string dir)
        {
            string str = dir;
            if (dir.IndexOf(".") > 0)
                str = dir.Substring(0, dir.LastIndexOf("\\"));
            return str;
        }
        public static string GetFileName(string dir)
        {
            string str = "";
            var tt = dir.Length - dir.LastIndexOf("\\");
            if (dir.IndexOf(".") > 0)
                str = dir.Substring(dir.LastIndexOf("\\") + 1, dir.Length - dir.LastIndexOf("\\") - 1);

            return str;
        }
    }
}

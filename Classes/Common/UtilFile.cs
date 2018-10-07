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
        public static FileStream CreateOrOpenFile(string filename, string diretorio = "c:\\")
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
        public static void FileWrite(this FileStream arquivo, string conteudo)
        {
            using (StreamWriter sw = new StreamWriter(arquivo.Name,true))
            {
                sw.Write(conteudo);
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
    }
}

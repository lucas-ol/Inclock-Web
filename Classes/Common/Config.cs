using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
namespace Classes.Common
{
    public class Config
    {
        public static string ChaveCriptografia
        {
            get
            {
                string chave = ConfigurationManager.AppSettings.Get("chave");
                return string.IsNullOrEmpty(chave) ? "" : chave;
            }
        }
        public static string UrlRest
        {
            get
            {
                string url = ConfigurationManager.AppSettings.Get("apiRest");
                return string.IsNullOrEmpty(url) ? "" : url;

            }
        }
        public static string Exports
        {
            get
            {
                string dir = ConfigurationManager.AppSettings.Get("exports");
                return string.IsNullOrEmpty(dir) ? @"c:" : dir;

            }
        }
        public static string DiretorioImagensAvisos
        {
            get
            {
                string dir = ConfigurationManager.AppSettings.Get("UpLoadImagensAvisos");
                return string.IsNullOrEmpty(dir) ? "" : dir;
            }
        }
    }
}

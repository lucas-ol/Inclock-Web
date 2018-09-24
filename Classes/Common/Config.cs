using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
namespace Classes.Common
{
    class Config
    {
        public static string ChaveCriptografia
        {
            get
            {
                string chave = ConfigurationManager.AppSettings.Get("chave");
                return string.IsNullOrEmpty(chave)? "" : chave;
            }
        }

    }
}

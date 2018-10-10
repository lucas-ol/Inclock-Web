using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Autenticador.BL
{
    public class Data
    {
        public static TimeSpan Manha
        {
            get
            {
                string horario = ConfigurationManager.AppSettings.Get("manha");
                if (TimeSpan.TryParse(horario, out TimeSpan hora))
                    return hora;
                else
                    throw new ConfigurationErrorsException("Erro ao obter a configuração do horario Manhã");
            }
        }
        public static TimeSpan Tarde
        {
            get
            {
                string horario = ConfigurationManager.AppSettings.Get("tarde");
                if (TimeSpan.TryParse(horario, out TimeSpan hora))
                    return hora;
                else
                    throw new ConfigurationErrorsException("Erro ao obter a configuração do horario tarde");
            }
        }
        public static TimeSpan Noite
        {
            get
            {
                string horario = ConfigurationManager.AppSettings.Get("noite");
                if (TimeSpan.TryParse(horario, out TimeSpan hora))
                    return hora;
                else
                    throw new ConfigurationErrorsException("Erro ao obter a configuração do horario tarde");
            }
        }
        public static int ConvertePeriodo(string hora, string tolerancia = "")
        {
            TimeSpan.TryParse(tolerancia, out TimeSpan tl);
            if (!TimeSpan.TryParse(hora.Replace(" ", ":"), out TimeSpan hr))
                return 0;
            if (hr >= Manha - tl && hr < Tarde + tl)
                return 1;
            else if (hr >= Tarde - tl && hr < Noite + tl)
                return 2;
            else if (hr >= Noite - tl)
                return 3;
            else if (hr < Manha) // isso é o que se equivale a madrugada
                return 3;

            return 0;
        }
    }
}

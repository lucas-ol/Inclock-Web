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
        public static int ConvertePeriodo(string hora)
        {
            if (!TimeSpan.TryParse(hora.Replace(" ",":"), out TimeSpan hr))
                return 0;
            if (hr >= Manha && hr < Tarde)
                return 1;
            else if (hr >= Tarde && hr < Noite)
                return 2;
            else if (hr >= Noite)
                return 3;
            else if (hr < Manha) // isso é o que se equivale a madrugada
                return 3;

            return 0;
        }
    }
}

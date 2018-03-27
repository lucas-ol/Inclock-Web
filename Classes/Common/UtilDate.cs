using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Classes.Common
{
    public class UtilDate
    {
        /// <summary>
        /// Converte um numero em um periodo
        /// </summary>
        /// <param name="periodo"></param>
        /// <returns></returns>
        public static string ConvertePeriodo(int periodo)
        {
            string szPeriodo = "";
            switch (periodo)
            {
                case 1:
                    szPeriodo = "Manhã";
                    break;
                case 2:
                    szPeriodo = "Tarde";
                    break;
                case 3:
                    szPeriodo = "Noite";
                    break;
                case 4:
                    szPeriodo = "Integral";
                    break;
            }
            return szPeriodo;
        }
        /// <summary>
        /// Metodo que vai converter um numero para semana por extenso 
        /// </summary>
        /// <param name="iSemana">numero da semana</param>
        /// <returns></returns>
        public static string ConverteSemanaExtenso(int iSemana)
        {
            string szSemana = "";
            switch (iSemana)
            {
                case 1:
                    szSemana = "Domingo";
                    break;
                case 2:
                    szSemana = "Segunda";
                    break;
                case 3:
                    szSemana = "Terça";
                    break;
                case 4:
                    szSemana = "Quarta";
                    break;
                case 5:
                    szSemana = "Quinta";
                    break;
                case 6:
                    szSemana = "Sexta";
                    break;
                case 7:
                    szSemana = "Sabado";
                    break;

            }
            return szSemana;
        }
    }
}

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
        public struct StDiasSemana
        {
            public IDictionary<DayOfWeek, IList<DateTime>> Semanas { get; private set; }
            public static StDiasSemana GetInstance()
            {
                var Instance = new StDiasSemana();
                Instance.Semanas = new Dictionary<DayOfWeek, IList<DateTime>>
                {
                    { DayOfWeek.Sunday, new List<DateTime>() },
                    { DayOfWeek.Monday, new List<DateTime>() },
                    { DayOfWeek.Tuesday, new List<DateTime>() },
                    { DayOfWeek.Wednesday, new List<DateTime>() },
                    { DayOfWeek.Thursday, new List<DateTime>() },
                    { DayOfWeek.Friday, new List<DateTime>() },
                    { DayOfWeek.Saturday, new List<DateTime>() }
                };
                return Instance;
            }
        }
        public static StDiasSemana GetDiasSemanas(int ano, int mes)
        {
            int qtdeMes = DateTime.DaysInMonth(ano, mes);
            var Dias = StDiasSemana.GetInstance();
            var Data = new DateTime(ano, mes, 1);
            for (int i = 1; i <= qtdeMes; i++)
            {
                switch (Data.DayOfWeek)
                {
                    case DayOfWeek.Sunday:
                        Dias.Semanas[DayOfWeek.Sunday].Add(Data);
                        break;
                    case DayOfWeek.Monday:
                        Dias.Semanas[DayOfWeek.Monday].Add(Data);
                        break;
                    case DayOfWeek.Tuesday:
                        Dias.Semanas[DayOfWeek.Tuesday].Add(Data);
                        break;
                    case DayOfWeek.Wednesday:
                        Dias.Semanas[DayOfWeek.Wednesday].Add(Data);
                        break;
                    case DayOfWeek.Thursday:
                        Dias.Semanas[DayOfWeek.Tuesday].Add(Data);
                        break;
                    case DayOfWeek.Friday:
                        Dias.Semanas[DayOfWeek.Friday].Add(Data);
                        break;
                    case DayOfWeek.Saturday:
                        Dias.Semanas[DayOfWeek.Saturday].Add(Data);
                        break;
                }
                Data = Data.AddDays(1);
            }
            return Dias;
        }


    }
}

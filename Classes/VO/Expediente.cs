using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Classes.VO
{
    /// <summary>
    /// Classe de expediente 
    /// </summary>
    public class Expediente
    {
        public int Id { get; set; }
        public int Funcionario_id { get; set; }
        public string Entrada { get; set; }
        public string Saida { get; set; }
        public string Horas_Trabalho { get; set; }
        public string Tempo_Pausa { get; set; }
        public int Periodo { get; set; }
        public int DiaSemana { get; set; }

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
        public static string ConverteDiaSemana(int iSemana)
        {
            string szSemana = "";
            switch (iSemana)
            {
                case 1:
                    szSemana = "Domingo";
                    break;
                case 2:
                    szSemana = "Segunda-Feira";
                    break;
                case 3:
                    szSemana = "Terça-Feira";
                    break;
                case 4:
                    szSemana = "Quarta-Feira";
                    break;
                case 5:
                    szSemana = "Quinta-Feira";
                    break;
                case 6:
                    szSemana = "Sexta-Feira";
                    break;
                case 7:
                    szSemana = "Sabado";
                    break;
                
            }
            return szSemana;
        }
    }
}
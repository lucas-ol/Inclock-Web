﻿using Classes.Common;
using Classes.VO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static Classes.VO.Ponto;

namespace Autenticador.BL
{
    public class CheckPoint : DataBase
    {
      
        #region  Ponto
        private Ponto ponto = new Ponto();
        public Ponto Ponto
        {
            get { return ponto; }
            private set { ponto = value; }
        }
        #endregion
        #region Last_point
        private Ponto last_Point = new Ponto();
        public Ponto Last_Point { get { return last_Point; } set { last_Point = value; } }
        #endregion
        #region Expediente_Hoje
      
       
        #endregion
        private TimeSpan Tolerancia = new TimeSpan(0, 59, 0); // ele tem 15 minutos de tolerancia, para entrada ou saida 
        public DateTime Hoje
        {
            get
            {
                return DateTime.Now;
            }
        }

        public CheckPoint()
        { }
        /// <summary>
        /// metodo que vai realizar o ponto dependendo do horario
        /// </summary>
        /// <returns></returns>
        public FeedBack BaterPonto(Ponto ponto)
        {
            FeedBack feed = new FeedBack { Status = false };
            var Expediente_Hoje = new Expediente();

            if (Expediente_Hoje == null)
            {
                feed.Mensagem = "Você não pode bater o ponto hoje";
                return feed;
            }
            // Primeiro vai verificar qual vai ser o tipo do ponto se vai ser entrada, saida, pausa etc...            

            if (ponto.Type_Point == TypePoint.Entrada)
            {             
                feed.Status = BaterEntrada().Status;
            } // fim entrada
            else if (ponto.Type_Point == TypePoint.Saida)
            {
                AlteraPonto(last_Point);
            }

            return feed;
        }      
        public FeedBack BaterEntrada()
        {
            MySqlAdicionaParametro("_funcionario", ponto.Funcionario);
            MySqlAdicionaParametro("_dia", Convert.ToDateTime(ponto.Data));
            MySqlAdicionaParametro("_hora", Hoje.ToString("HH:mm:ss"));
            MySqlAdicionaParametro("_periodo", ponto.Periodo);
            MySqlAdicionaParametro("_logitude", ponto.Logitude);
            MySqlAdicionaParametro("_latitude", ponto.Latitude);
            MySqlAdicionaParametro("_status", string.Join(";", ponto.Status));
            return MySqlExecutaComando("prd_insert_ponto", CommandType.StoredProcedure);
        }
        public FeedBack BaterSaida()
        {
            FeedBack feed = new FeedBack();
            return feed;
        }

        /// <summary>
        /// Metodo não esta completo
        /// </summary>
        /// <param name="ponto"></param>
        /// <returns></returns>
        private FeedBack AlteraPonto(Ponto ponto)
        {
            MySqlAdicionaParametro("_id", ponto.Id);
            MySqlAdicionaParametro("_funcionario", ponto.Funcionario);
            MySqlAdicionaParametro("_dia", ponto.Data);
            MySqlAdicionaParametro("_hora", ponto.Entrada);
            MySqlAdicionaParametro("_periodo", ponto.Periodo);
            MySqlAdicionaParametro("_logitude", ponto.Logitude);
            MySqlAdicionaParametro("_latitude", ponto.Latitude);

            MySqlExecutaComando("procedure não feita", CommandType.StoredProcedure);
            return new FeedBack();
        }
        public List<Ponto> GetListCheckPoint(string InitialDate, string FinalDate, int funcionario)
        {
            List<Ponto> ListExpediente = new List<Ponto>();
            return ListExpediente;
        }
        /// <summary>
        ///Sobrecarga, que vai setar a clase con o ultimo ponto
        /// </summary>
        public void GetLastPoint()
        {
            Last_Point = GetLastPoint(ponto.Funcionario, ponto.Periodo);
        }
        public Ponto GetLastPoint(int Funcionario, int Periodo)
        {
            MySqlAdicionaParametro("_funcionario", Funcionario);
            MySqlAdicionaParametro("_dia", Hoje.Date);
            MySqlAdicionaParametro("_periodo", Periodo);
            try
            {
                DataRow tr = MySqlLeitura("prd_se_last_point", CommandType.StoredProcedure).Rows[0];
                IEnumerable<string> list = tr["status"].ToString().Split(";".ToCharArray());
                Ponto pointer = new Ponto
                {
                    Id = tr["id"].ToString(),
                    Data = Convert.ToDateTime(tr["data_ponto"]).ToString("dd/MM/yyyy"),
                    Entrada = tr["entrada"].ToString(),
                    Saida = tr["saida"].ToString(),
                    Funcionario = Convert.ToInt32(tr["funcionario_id"]),
                    Latitude = tr["latitude"].ToString(),
                    Logitude = tr["logitude"].ToString(),
                    Periodo = Convert.ToInt32(tr["periodo"]),
                    SaidaPausa = tr["saida_pausa"].ToString(),
                    EntradaPausa = tr["entrada_pausa"].ToString(),
                    Obs = tr["obs"].ToString(),
                    Status = list as List<string>
                };
                return pointer;
            }
            catch (Exception ex)
            {
                return new Ponto();
            }
        }
        /// <summary>
        /// procedimento que vai pegar o expediente do dia ocorrente
        /// </summary>
        private void GetExpedienteHoje()
        {
          //  expediente_Hoje = new ExpedienteController().GetExpediente(ponto.Funcionario, Convert.ToInt32(Hoje.DayOfWeek) + 1, ponto.Periodo);
        }


     

        private Classes.VO.StatusPonto VerificaEntrada()
        {
            var expediente_Hoje = new Ponto();
            FeedBack feed = new FeedBack();
            if (Hoje.TimeOfDay >= expediente_Hoje.TimeEntrada - Tolerancia && Hoje.TimeOfDay - Tolerancia <= expediente_Hoje.TimeEntrada)
            {

            }
            TimeSpan entrada = Convert.ToDateTime(expediente_Hoje.Entrada).TimeOfDay;

            if (Hoje.TimeOfDay < entrada - Tolerancia)// verifica  o horario minimo para bater o ponto 
                feed.Mensagem = Convert.ToInt32(StatusPonto.Horario_Minimo) + ";";
            else if (Hoje.TimeOfDay - Tolerancia > entrada)// verifica se ele esta atrasado 
            {
                ponto.Status.Add(StatusPonto.Entrada_Com_Atraso + ";");
                feed.Mensagem = Convert.ToInt32(StatusPonto.Entrada_Com_Atraso) + ";";
            }
            return Classes.VO.StatusPonto.Entrada_Com_Atraso;
        }     


    }
}

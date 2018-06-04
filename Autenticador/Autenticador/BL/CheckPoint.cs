using Classes.Common;
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


        private TimeSpan Tolerancia = new TimeSpan(0, 59, 0); // ele tem 15 minutos de tolerancia, para entrada ou saida       

        public CheckPoint()
        {

        }

        /// <summary>
        /// metodo que vai realizar o ponto dependendo do horario
        /// </summary>
        /// <returns></returns>
        public FeedBack BaterPonto(Ponto ponto)
        {
            // Primeiro vai verificar qual vai ser o tipo do ponto se vai ser entrada, saida, pausa etc...    
            if (ponto.Type_Point == TypePoint.Entrada)
                return BaterEntrada(ponto);
            else
                return BaterSaida(ponto);

        }
        private FeedBack BaterEntrada(Ponto ponto)
        {

            var expediente = GetExpedienteHoje(ponto.Funcionario, ponto.Periodo, ponto.Type_Point);
            if (expediente == null)
                return new FeedBack { Mensagem = "Você não pode bater o ponto DateTime.Now", Status = false };

            TimeSpan entrada = Convert.ToDateTime(expediente.Entrada).TimeOfDay;
            if (entrada - Tolerancia >= DateTime.Now.TimeOfDay)
                ponto.Status.Add(Convert.ToInt32(Classes.Enumeradores.StatusPonto.Entrada_Com_Atraso));
            else if (entrada + Tolerancia < DateTime.Now.TimeOfDay)
            {
                return new FeedBack() { Status = false, Mensagem = "horario minimo para bater o ponto" + entrada };
            }

            MySqlAdicionaParametro("entrada", entrada.ToString("hh:MM:ss"));
            MySqlAdicionaParametro("status", string.Join(";", ponto.Status));
            MySqlAdicionaParametro("id", GetIdPoint(ponto.Funcionario, expediente.Id));
            return MySqlExecutaComando("update pontos set entrada = @entrada, status = @status where id = @id", CommandType.Text);


        }
        private FeedBack BaterSaida(Ponto ponto)
        {
            MySqlAdicionaParametro("entrada", DateTime.Now.ToString("HH:mm:ss"));
            return MySqlExecutaComando("update pontos set entrada = @entrada", CommandType.Text);

        }
        private FeedBack InsertDataBase(Ponto ponto)
        {
            MySqlAdicionaParametro("_funcionario", ponto.Funcionario);
            MySqlAdicionaParametro("_dia", Convert.ToDateTime(ponto.Data));
            MySqlAdicionaParametro("_hora", DateTime.Now.ToString("HH:mm:ss"));
            MySqlAdicionaParametro("_periodo", ponto.Periodo);
            MySqlAdicionaParametro("_logitude", ponto.Logitude);
            MySqlAdicionaParametro("_latitude", ponto.Latitude);
            MySqlAdicionaParametro("_status", string.Join(";", ponto.Status));
            return MySqlExecutaComando("prd_insert_ponto", CommandType.StoredProcedure);
        }

        /// <summary>
        /// Metodo não esta completo
        /// </summary>
        /// <param name="ponto"></param>
        /// <returns></returns>
        public FeedBack AlteraPonto(Ponto ponto)
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
            // Last_Point = GetLastPoint(ponto.Funcionario, ponto.Periodo);
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="Funcionario"></param>
        /// <param name="expedienteId"></param>
        /// <returns></returns>
        private int GetIdPoint(int Funcionario, int expedienteId)
        {
            MySqlAdicionaParametro("func", Funcionario);
        
            MySqlAdicionaParametro("exp", expedienteId);

            try
            {
                var tr = MySqlLeitura("select id from where data_ponto = @data and funcionario_id = @func and expediente_id = @exp", CommandType.StoredProcedure);
                int id = Convert.ToInt32(tr.Rows[0]["id"]);
                return id;
            }
            catch (Exception ex)
            {
                return 0;
            }
        }
        private Expediente GetExpedienteHoje(int funcionario, int periodo, TypePoint type)
        {
            return new ExpedienteController().GetExpediente(funcionario, DateTime.Now.DayOfWeek, periodo, type);
        }


    }
}

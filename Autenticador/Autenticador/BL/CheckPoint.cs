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
        public DateTime DataHoje { get; set; }

        public CheckPoint()
        {
            DataHoje = DateTime.Now;
        }

        /// <summary>
        /// metodo que vai realizar o ponto dependendo do horario
        /// </summary>
        /// <returns></returns>
        public FeedBack BaterPonto(Ponto ponto)
        {
            int id;
            char type;
            if (GetIdPoint(ponto.Funcionario, out id, out type))
            {

            }

            if (type == 'E')
                return BaterEntrada(ponto, id);
            else
                return BaterSaida(ponto, id);

        }
        private FeedBack BaterEntrada(Ponto ponto, int id)
        {

            var expediente = GetExpedienteHoje(ponto.Funcionario, ponto.Periodo, 'E');
            if (expediente == null)
                return new FeedBack { Mensagem = "Você não pode bater o ponto", Status = false };

            TimeSpan entrada = Convert.ToDateTime(expediente.Entrada).TimeOfDay;
            if (entrada - Tolerancia >= DateTime.Now.TimeOfDay)
                ponto.Status = "Entrada em atraso";
            else if (entrada + Tolerancia < DateTime.Now.TimeOfDay)
            {
                return new FeedBack() { Status = false, Mensagem = "horario minimo para bater o ponto" + entrada };
            }

            MySqlAdicionaParametro("hora", entrada.ToString("hh:MM:ss"));
            MySqlAdicionaParametro("status", string.Join(";", ponto.Status));
            MySqlAdicionaParametro("id", id);
            return MySqlExecutaComando("update pontos set hora = @entrada, status = @status where id = @id", CommandType.Text);


        }
        private FeedBack BaterSaida(Ponto ponto, int id)
        {
            var expediente = GetExpedienteHoje(ponto.Funcionario, ponto.Periodo, 'S');
            if (expediente == null)
                return new FeedBack { Mensagem = "Você não pode bater o ponto", Status = false };
            TimeSpan saida = Convert.ToDateTime(expediente.Entrada).TimeOfDay;
            if (saida - Tolerancia <= DateTime.Now.TimeOfDay)
                return new FeedBack { Mensagem = "horario minimo para bater o ponto " + (saida - Tolerancia).ToString("hh:MM"), Status = false };
            else if (saida + Tolerancia > DateTime.Now.TimeOfDay)
                ponto.Status = "Hora extra;";

            MySqlAdicionaParametro("hora", DateTime.Now.ToString("HH:mm:ss"));
            MySqlAdicionaParametro("status", ponto.Status);
            MySqlAdicionaParametro("id", id);
            return MySqlExecutaComando("update pontos set hora = @entrada, status = @status where id = @id", CommandType.Text);
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
            MySqlAdicionaParametro("_hora", ponto.Entrada);
            MySqlAdicionaParametro("_periodo", ponto.Periodo);
            MySqlAdicionaParametro("_logitude", ponto.Logitude);
            MySqlAdicionaParametro("_latitude", ponto.Latitude);

            MySqlExecutaComando("procedure não feita", CommandType.StoredProcedure);
            return new FeedBack();
        }
        public List<Ponto> GetListCheckPoint(string initialDate, string finalDate, int funcionario)
        {
            List<Ponto> ListExpediente = new List<Ponto>();
            MySqlAdicionaParametro("_InitialDade", initialDate);
            MySqlAdicionaParametro("_FinalDade", finalDate);
            MySqlAdicionaParametro("funcionario", funcionario);
            var tb = MySqlLeitura("procedure aqui", CommandType.StoredProcedure);
            if (tb.TableName == "erro")
                throw new Exception("erro desconhecido");
            else {
                foreach (DataRow item in tb.Rows)
                {
                    Ponto ponto = new Ponto();
                    ponto.Id = item[""].ToString();
                    ponto.Entrada = item[""].ToString();
                    ponto.DataEntrada = item[""].ToString();
                    ponto.Saida = item[""].ToString();
                    ponto.DataSaida = item[""].ToString();
                    ponto.Status = item[""].ToString();
                    ponto.Obs = item[""].ToString();
                    ListExpediente.Add(ponto);
                }
            }
            return ListExpediente;
        }
        public List<Ponto> GetCheckPointByMonth(int month, int funcionario)
        {
            List<Ponto> ListExpediente = new List<Ponto>();
            MySqlAdicionaParametro("_month", month);
            MySqlAdicionaParametro("_funcionario", funcionario);
            var tb = MySqlLeitura("procedure aqui", CommandType.StoredProcedure);
            if (tb.TableName == "erro")
                throw new Exception("erro desconhecido");
            else {
                foreach (DataRow item in tb.Rows)
                {
                    Ponto ponto = new Ponto();
                    ponto.Id = item[""].ToString();
                    ponto.Entrada = item[""].ToString();
                    ponto.DataEntrada = item[""].ToString();
                    ponto.Saida = item[""].ToString();
                    ponto.DataSaida = item[""].ToString();
                    ponto.Status = item[""].ToString();
                    ponto.Obs = item[""].ToString();
                    ListExpediente.Add(ponto);
                }
            }
            return ListExpediente;
        }
        public Ponto GetPoint(int id)
        {
            Ponto ponto = new Ponto();
            MySqlAdicionaParametro("_id", id);
            var tb = MySqlLeitura("procedure aqui ", CommandType.StoredProcedure);
            if (tb.TableName == "erro")
                throw new Exception("erro desconhecido");
            foreach (DataRow item in tb.Rows)
            {
                ponto.Id = item[""].ToString();
                ponto.Entrada = item[""].ToString();
                ponto.DataEntrada = item[""].ToString();
                ponto.Saida = item[""].ToString();
                ponto.DataSaida = item[""].ToString();
                ponto.Status = item[""].ToString();
                ponto.Obs = item[""].ToString();
            }
            return ponto;
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
        private bool GetIdPoint(int Funcionario, out int id, out char type)
        {
            MySqlAdicionaParametro("func", Funcionario);
            // MySqlAdicionaParametro("exp", expedienteId);
            //  MySqlAdicionaParametro("data", DateTime.Now.Date.ToString("yyyy-MM-dd"));
            string command = "select id, type_point from where data_ponto = {0} and funcionario_id = {1} type_point = {}";
            try
            {
                //       var tr = MySqlLeitura("select id, type_point from where data_ponto = @data and funcionario_id = @func and expediente_id = @exp", CommandType.Text);
                var tr = MySqlLeitura(string.Format(command, DataHoje.Date.ToString("yyyy-MM-dd")), CommandType.Text);
                if (tr.Rows.Count <= 0 || tr.TableName == "erro")
                    tr = MySqlLeitura(string.Format(command, DataHoje.Date.ToString("yyyy-MM-dd")), CommandType.Text);

                id = Convert.ToInt32(tr.Rows[0]["id"]);
                type = Convert.ToChar(tr.Rows[0]["type_point "]);
                return true;
            }
            catch (Exception ex)
            {
                id = 0;
                type = 'a';
                return false;
            }
        }

        private Expediente GetExpedienteHoje(int funcionario, int periodo, char type)
        {
            return new ExpedienteController().GetExpediente(funcionario, DateTime.Now.DayOfWeek, periodo, type);
        }


    }
}

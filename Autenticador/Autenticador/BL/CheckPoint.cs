using Classes.Common;
using Classes.VO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Autenticador.BL
{
    public class CheckPoint : DataBase
    {

        public int MyProperty { get; set; }
        /// <summary>
        ///Propriedade que vai verificar se o ponto vai ser de saida 
        /// </summary>
        public bool Saida
        {
            get
            {
                return true;
            }
        }
        /// <summary>
        /// Propriedade que vai verificar se o ponto vai ser de Entrada 
        /// </summary>
        public bool Entrada { get; }
        public Ponto ponto { get; set; }
        private Ponto Last_Point { get; set; }
        private Expediente expediente_Hoje;
        public Expediente Expediente_Hoje
        {
            get
            {
                return expediente_Hoje;
            }
            set { expediente_Hoje = value; }
        }
        public DateTime Hoje
        {
            get
            {
                return DateTime.Now;
            }
        }
        /// <summary>
        /// Contrutor
        /// </summary>
        public CheckPoint()
        {
            ponto = new Ponto();
            expediente_Hoje = expediente_Hoje = new ExpedienteController().GetExpediente(ponto.Funcionario, Convert.ToInt32(Hoje.DayOfWeek) + 1, ponto.Periodo);
        }
        /// <summary>
        /// Contrutor 
        /// </summary>
        /// <param name="ponto">Ponto que vai ser batido</param>
        public CheckPoint(Ponto ponto)
        {
            this.ponto = ponto;
            expediente_Hoje = expediente_Hoje = new ExpedienteController().GetExpediente(ponto.Funcionario, Convert.ToInt32(Hoje.DayOfWeek) + 1, ponto.Periodo);
            Last_Point = GetLastPoint(ponto.Funcionario, ponto.Periodo);
        }
        /// <summary>
        /// metodo que vai realizar o ponto dependendo do horario
        /// </summary>
        /// <returns></returns>
        public FeedBack BaterPonto()
        {
            FeedBack feed = new FeedBack { Status = false };
            Ponto PontoAgora = GetLastPoint(ponto.Funcionario, ponto.Periodo);

            if (Expediente_Hoje == null)
            {
                feed.Mensagem = "Você não pode bater o ponto hoje";
                return feed;
            }
            // Primeiro vai verificar qual vai ser o tipo do ponto se vai ser entrada, saida, pausa etc...
            TimeSpan Tolerancia = new TimeSpan(0, 59, 0); // ele tem 15 minutos de tolerancia, para entrada ou saida 
            TimeSpan hora = Convert.ToDateTime("28/03/2018 20:50:00").TimeOfDay; //DateTime.Now.TimeOfDay;// pega o horario do servidor para bater o ponto
            ponto.Saida = ponto.Entrada = hora.ToString();//seta no objeto o horario do ponto
            if (hora >= Convert.ToDateTime(Expediente_Hoje.Entrada).TimeOfDay - Tolerancia && hora - Tolerancia <= Convert.ToDateTime(Expediente_Hoje.Entrada).TimeOfDay && string.IsNullOrEmpty(PontoAgora.Entrada))
            {
                if (hora - Tolerancia > Convert.ToDateTime(Expediente_Hoje.Entrada).TimeOfDay)// verifica se ele esta atrasado 
                {
                    ponto.Status.Add(StatusExpediente.Entrada_Com_Atraso + ";");
                    feed.Mensagem = Convert.ToInt32(StatusExpediente.Entrada_Com_Atraso) + ";";
                }
                if (hora < Convert.ToDateTime(Expediente_Hoje.Entrada).TimeOfDay - Tolerancia)// verifica  o horario minimo para bater o ponto 
                    feed.Mensagem = Convert.ToInt32(StatusExpediente.Horario_Minimo) + ";";
                else
                    feed.Status = NovoPonto(ponto).Status;
            }
            else if (Convert.ToDateTime(Expediente_Hoje.Entrada).TimeOfDay - Tolerancia >= hora)
                feed = AlteraPonto(ponto);
            return feed;
        }

        private bool CheckExit()
        {
            try
            {
                return true;
            }
            catch (Exception ex)
            {
                throw new Exception("A propriedade Ponto não foi setada", ex.InnerException);
            }

        }
        private bool CheckEntry()
        {
            try
            {
                return true;
            }
            catch (Exception ex)
            {
                throw new Exception("A propriedade Ponto não foi setada", ex.InnerException);
            }
        }

        public FeedBack NovoPonto(Ponto ponto)
        {
            MySqlAdicionaParametro("_funcionario", ponto.Funcionario);
            MySqlAdicionaParametro("_dia", Convert.ToDateTime(ponto.Data));
            MySqlAdicionaParametro("_hora", ponto.Entrada);
            MySqlAdicionaParametro("_periodo", ponto.Periodo);
            MySqlAdicionaParametro("_logitude", ponto.Logitude);
            MySqlAdicionaParametro("_latitude", ponto.Latitude);
            MySqlAdicionaParametro("_status", string.Join(";", ponto.Status));
            return MySqlExecutaComando("prd_insert_ponto", CommandType.StoredProcedure);
        }
        public FeedBack AlteraPonto(Ponto ponto)
        {
            MySqlAdicionaParametro("_funcionario", ponto.Data);
            MySqlAdicionaParametro("_dia", ponto.Data);
            MySqlAdicionaParametro("_hora", ponto.Entrada);
            MySqlAdicionaParametro("_periodo", ponto.Periodo);
            MySqlAdicionaParametro("_logitude", ponto.Logitude);
            MySqlAdicionaParametro("_latitude", ponto.Latitude);
            MySqlExecutaComando("prd_insert_ponto", CommandType.StoredProcedure);
            return new FeedBack();
        }
        public List<Expediente> GetCheckPoint(string InitialDate, string FinalDate, int funcionario)
        {
            List<Expediente> ListExpediente = new List<Expediente>();
            return ListExpediente;
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

    }
}

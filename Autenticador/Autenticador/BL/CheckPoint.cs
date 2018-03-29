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
        public bool Saida { get; private set; }
        public bool Entrada { get; private set; }
        public Ponto ponto { get; set; }
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
        }
        /// <summary>
        /// Contrutor 
        /// </summary>
        /// <param name="ponto">Ponto que vai ser batido</param>
        public CheckPoint(Ponto ponto)
        {
            this.ponto = ponto;
        }

        public FeedBack BaterPonto()
        {
            FeedBack feed = new FeedBack { Status = false };
            Expediente expediente = new ExpedienteController().GetExpediente(ponto.Funcionario, Convert.ToInt32(DateTime.Now.DayOfWeek) + 1, ponto.Periodo);
            Ponto PontoAgora = GetCheckPoint(ponto.Funcionario, ponto.Periodo);
            if (expediente == null)
            {
                feed.Mensagem = "Você não pode bater o ponto hoje";
                return feed;
            }
            // Primeiro vai verificar qual vai ser o tipo do ponto se vai ser entrada, saida, pausa etc...
            TimeSpan Tolerancia = new TimeSpan(0, 59, 0); // ele tem 15 minutos de tolerancia, para entrada ou saida 
            TimeSpan hora = Convert.ToDateTime("28/03/2018 20:50:00").TimeOfDay; //DateTime.Now.TimeOfDay;// pega o horario do servidor para bater o ponto
            ponto.Saida = ponto.Entrada = hora.ToString();//seta no objeto o horario do ponto



            if (hora >= Convert.ToDateTime(expediente.Entrada).TimeOfDay - Tolerancia && hora - Tolerancia <= Convert.ToDateTime(expediente.Entrada).TimeOfDay && string.IsNullOrEmpty(PontoAgora.Entrada))
            {
                if (hora - Tolerancia > Convert.ToDateTime(expediente.Entrada).TimeOfDay)// verifica se ele esta atrasado 
                {
                    ponto.Status.Add(StatusExpediente.Entrada_Com_Atraso + ";");
                    feed.Mensagem = Convert.ToInt32(StatusExpediente.Entrada_Com_Atraso) + ";";
                }
                if (hora < Convert.ToDateTime(expediente.Entrada).TimeOfDay - Tolerancia)// verifica  o horario minimo para bater o ponto 
                    feed.Mensagem = Convert.ToInt32(StatusExpediente.Horario_Minimo) + ";";
                else
                    feed.Status = NovoPonto(ponto).Status;
            }
            else if (Convert.ToDateTime(expediente.Entrada).TimeOfDay - Tolerancia >= hora)
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
        public Ponto GetCheckPoint(int Funcionario, int Periodo)
        {
            MySqlAdicionaParametro("_funcionario", Funcionario);
            MySqlAdicionaParametro("_dia", Hoje.ToString("yyyy-MM-dd"));
            MySqlAdicionaParametro("_periodo", Periodo);
            try
            {
                DataRow tr = MySqlLeitura("prd_se_ponto", CommandType.StoredProcedure).Rows[0];

                IEnumerable<string> list = tr["status"].ToString().Split(";".ToCharArray());
                Ponto point = new Ponto();

                point.Id = tr["id"].ToString();
                point.Data = Convert.ToDateTime(tr["data_ponto"]).ToString("dd/MM/yyyy");
                point.Entrada = tr["entrada"].ToString();
                point.Saida = tr["saida"].ToString();
                point.Funcionario = Convert.ToInt32(tr["funcionario_id"]);
                point.Latitude = tr["latitude"].ToString();
                point.Logitude = tr["logitude"].ToString();
                point.Periodo = Convert.ToInt32(tr["periodo"]);
                point.SaidaPausa = tr["saida_pausa"].ToString();
                point.EntradaPausa = tr["entrada_pausa"].ToString();
                point.Obs = tr["obs"].ToString();
                point.Status = list as List<string>;
                return point;
            }
            catch (Exception ex)
            {
                return new Ponto();
            }


        }

    }
}

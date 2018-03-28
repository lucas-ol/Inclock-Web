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
            Expediente expediente = new ExpedienteController().GetExpediente(ponto.Funcionario, Convert.ToInt32(DateTime.Now.DayOfWeek), ponto.Periodo);
            if (expediente == null)
            {
                feed.Mensagem = "Você não pode bater o ponto hoje";
                return feed;
            }
            // Primeiro vai verificar qual vai ser o tipo do ponto se vai ser entrada, saida, pausa etc...
            TimeSpan Tolerancia = new TimeSpan(0, 15, 0); // ele tem 15 minutos de tolerancia, para entrada ou saida 
            TimeSpan hora = Convert.ToDateTime("28/03/2018 00:00:00").TimeOfDay; //DateTime.Now.TimeOfDay;// pega o horario do servidor para bater o ponto
            ponto.Saida = ponto.Entrada = DateTime.Now.ToString("HH:mm:ss");//seta no objeto o horario do ponto



            if (hora >= Convert.ToDateTime(expediente.Entrada).TimeOfDay - Tolerancia && hora - Tolerancia <= Convert.ToDateTime(expediente.Entrada).TimeOfDay)
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
        public List<Expediente> GetCheckPoint(string InitialDate, string FinalDate)
        {
            List<Expediente> ListExpediente = new List<Expediente>();
            return ListExpediente;
        }
        public Ponto GetCheckPoint(int Funcionario, string Periodo)
        {
            MySqlAdicionaParametro("_funcionario", Funcionario);
            MySqlAdicionaParametro("_dia", Periodo);
            MySqlAdicionaParametro("_periodo", Hoje.ToString("dd/MM/yyyy"));
            try
            {
                DataRow tr = MySqlLeitura("prd_se_ponto", CommandType.StoredProcedure).Rows[0];
                return new Ponto {
                    Id = Convert.ToInt32(tr["id"]),
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
                   // Status = tr[""].ToString().Split(";".ToCharArray()).ToArray<string>(),
                    
                };
            }
            catch (Exception)
            {
                return new Ponto();
            }


        }

    }
}

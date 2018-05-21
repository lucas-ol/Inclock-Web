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

        private Expediente Expediente_Hoje
        {
            get
            {
                return new ExpedienteController().GetExpediente(this.Ponto.Funcionario, DateTime.Now.DayOfWeek, this.Ponto.Periodo, this.Ponto.Type_Point);
            }
        }
        public Ponto Ponto { private get; set; }

        private TimeSpan Tolerancia = new TimeSpan(0, 59, 0); // ele tem 15 minutos de tolerancia, para entrada ou saida 
        public DateTime Hoje
        {
            get
            {
                return DateTime.Now;
            }
        }

        public CheckPoint()
        {

        }
        public CheckPoint(Ponto ponto)
        {
            this.Ponto = ponto;
        }
        /// <summary>
        /// metodo que vai realizar o ponto dependendo do horario
        /// </summary>
        /// <returns></returns>
        public FeedBack BaterPonto()
        {
            ValidaPonto();
            FeedBack feed = new FeedBack { Status = false };

            if (Expediente_Hoje == null)
            {
                feed.Mensagem = "Você não pode bater o ponto hoje";
                return feed;
            }
            // Primeiro vai verificar qual vai ser o tipo do ponto se vai ser entrada, saida, pausa etc...    
            else if (Ponto.Type_Point == TypePoint.Entrada)
            {
                feed = BaterEntrada();
            } // fim entrada
            else if (Ponto.Type_Point == TypePoint.Saida)
            {
                feed = InsertDataBase(Ponto);
            }

            return feed;
        }
        private FeedBack BaterEntrada()
        {
            TimeSpan entrada = Convert.ToDateTime(Expediente_Hoje.Entrada).TimeOfDay;
            if (entrada - Tolerancia >= Hoje.TimeOfDay)
                Ponto.Status.Add(Convert.ToInt32(Classes.Enumeradores.StatusPonto.Entrada_Com_Atraso));
            else if (entrada + Tolerancia < Hoje.TimeOfDay)
            {
                return new FeedBack() { Status = false,Mensagem ="horario minimo para bater o ponto"+entrada };
            }
            return InsertDataBase(Ponto);
        }
        private FeedBack BaterSaida()
        {

            return InsertDataBase(Ponto);
        }
        private FeedBack InsertDataBase(Ponto ponto)
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
            // Last_Point = GetLastPoint(ponto.Funcionario, ponto.Periodo);
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
                    Status = list as List<int>
                };
                return pointer;
            }
            catch (Exception ex)
            {
                return new Ponto();
            }
        }
        public void ValidaPonto()
        {
            if (this.Ponto == null)
                throw new ArgumentNullException("A propriedade Ponto não pode ser nula");
        }
    }
}

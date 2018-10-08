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
        private TimeSpan Tolerancia = new TimeSpan(23, 59, 0); // ele tem 15 minutos de tolerancia, para entrada ou saida            

        DateTime Data_Hoje
        {
            get { return DateTime.Now; }
        }
        public CheckPoint()
        {
        }
        public FeedBack BaterPonto(int funcionario, char type)
        {
            if (char.ToUpper(type) == 'E')
                return BaterEntrada(funcionario);
            else if (char.ToUpper(type) == 'S')
                return BaterSaida(funcionario);
            else
                return new FeedBack { Status = false, Mensagem = "Opção invalida" };
        }
        private FeedBack BaterEntrada(int funcionario)
        {
            int status = 0;
            int periodo = Data.ConvertePeriodo(Data_Hoje.ToString("HH:mm:ss"));
            var expediente = GetExpedienteHoje(funcionario, periodo, 'E');
            if (expediente == null)
                return new FeedBack { Mensagem = "Você não pode bater o ponto", Status = false };

            if (GetPoint(funcionario, expediente.Id, Data_Hoje.Date.ToString("yyyy-MM-dd")) != null)
                return new FeedBack { Mensagem = "Voce ja bateu o ponto entrada", Status = false };


            TimeSpan entrada = Convert.ToDateTime(Data_Hoje.ToString("dd/MM/yyyy ") + expediente.Entrada).TimeOfDay;
            if (entrada - Tolerancia >= Data_Hoje.TimeOfDay)
                status = 1;
            else if (entrada + Tolerancia < Data_Hoje.TimeOfDay)
            {
                return new FeedBack() { Status = false, Mensagem = "horario minimo para bater o ponto" + (entrada - Tolerancia) };
            }
            return SalvaPonto(funcionario, status, expediente.Id, "E");
        }
        private FeedBack BaterSaida(int funcionario)
        {
            int status = 0;
            int periodo = Data.ConvertePeriodo(Data_Hoje.ToString("HH:mm:ss"));
            var expediente = GetExpedienteHoje(funcionario, periodo, 'S');
            if (expediente == null)
                return new FeedBack { Mensagem = "Você não pode bater o ponto", Status = false };

            if (GetPoint(funcionario, expediente.Id, Data_Hoje.Date.ToString("yyyy-MM-dd")) != null)
                return new FeedBack { Mensagem = "Voce ja bateu o ponto de saida", Status = false };


            DateTime saida = Convert.ToDateTime(Data_Hoje.ToString("dd/MM/yyyy ") + expediente.Entrada);
            if (saida <= Data_Hoje - Tolerancia)
                return new FeedBack { Mensagem = "horario minimo para bater o ponto " + saida.TimeOfDay, Status = false };
            else if ((saida - Tolerancia) > Data_Hoje)
                status = 2;
        

            return SalvaPonto(funcionario, status, expediente.Id, "S");
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
            MySqlExecutaComando("procedure não feita", CommandType.StoredProcedure);
            return new FeedBack();
        }
        public Ponto GetPoint(int id)
        {
            return null;
        }
        public bool GetPoint(ref Ponto ponto)
        {
            var comand = " SELECT * FROM pontos " +
                         "WHERE funcionario_id = @func AND expediente_id = @exp AND (dta_entrada = @dta_entrada || dta_saida = @dta_saida)";
            MySqlAdicionaParametro("func",  ponto.Funcionario);
            MySqlAdicionaParametro("exp", ponto.Expediente.Id);
            MySqlAdicionaParametro("dia", !string.IsNullOrEmpty(ponto.DataEntrada)? ponto.DataEntrada: ponto.DataSaida);
            DataTable tb = MySqlLeitura(comand, CommandType.Text);
            if (tb.Rows.Count > 0 && tb.TableName != "erro")
            {
                ponto = new Ponto
                {
                    Id = Convert.ToInt32(tb.Rows[0]["id_ponto"]),
                    Entrada = tb.Rows[0]["hora"].ToString(),
                    Saida = Convert.ToDateTime(tb.Rows[0]["data"]).ToString("dd/MM/yyyy"),
                    Obs = tb.Rows[0]["obs"].ToString(),
                    Funcionario = ponto.Funcionario,
                    Expediente = MySqlLeitura("prd", CommandType.StoredProcedure).
                };

            }

            return false;
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
            else
            {
                foreach (DataRow item in tb.Rows)
                {
                    Ponto ponto = new Ponto
                    {
                        Id = Convert.ToInt32(item[""]),
                        Entrada = item[""].ToString(),
                        DataEntrada = item[""].ToString(),
                        Saida = item[""].ToString(),
                        DataSaida = item[""].ToString(),                       
                        Obs = item[""].ToString()
                    };
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
            else
            {
                foreach (DataRow item in tb.Rows)
                {
                    Ponto ponto = new Ponto
                    {
                        Id = Convert.ToInt32(item[""]),
                        Entrada = item[""].ToString(),
                        DataEntrada = item[""].ToString(),
                        Saida = item[""].ToString(),
                        DataSaida = item[""].ToString(),                       
                        Obs = item[""].ToString()
                    };
                    ListExpediente.Add(ponto);
                }
            }
            return ListExpediente;
        }

        private FeedBack SalvaPonto(int funcionario, int status, int expediente, string tipo)
        {
            MySqlAdicionaParametro("func", funcionario);
            MySqlAdicionaParametro("data", Data_Hoje.ToString("yyyy-MM-dd"));
            MySqlAdicionaParametro("hora", Data_Hoje.ToString("hh:mm:ss"));
            MySqlAdicionaParametro("status", status);
            MySqlAdicionaParametro("exp", expediente);
            MySqlAdicionaParametro("tipo", tipo);
            return MySqlExecutaComando("INSERT INTO pontos(funcionario_id,data,hora,expediente_id,tipo,status) VALUES(@func,@data,@hora,@exp,@tipo,@status);", CommandType.Text);
        }
        private Expediente GetExpedienteHoje(int funcionario, int periodo, char type)
        {
            var exp = new Expediente();
            exp = new ExpedienteController().GetExpediente(funcionario, Data_Hoje.DayOfWeek, periodo, type);
            if (exp == null)
                exp = new ExpedienteController().GetExpediente(funcionario, Data_Hoje.DayOfWeek, 4, type);  // pequisa pelo periodo integral 
            return exp;
        }
    }
}

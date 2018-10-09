using Classes.Common;
using Classes.VO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;


namespace Autenticador.BL
{
    public class CheckPoint : DataBase
    {
        public const string MSGATRASOSAIDA = "saida em atraso";
        public const string MSGATRASOENTRADA = "entrada em atraso";
        private TimeSpan Tolerancia = new TimeSpan(0, 15, 0); // ele tem 15 minutos de tolerancia, para entrada ou saida            

        DateTime Data_Hoje
        {
            get {
                return Convert.ToDateTime("8/10/2018 23:16:00");
         //       return DateTime.Now.AddDays(-1);
            }
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

            int periodo = Data.ConvertePeriodo(Data_Hoje.ToString("HH:mm:ss"));
            var expediente = GetExpedienteHoje(funcionario, periodo, 'E');
            if (expediente == null)
                return new FeedBack { Mensagem = "Você não pode bater o ponto", Status = false };

            if (GetExpelhoPonto(funcionario, expediente.Id, null, Data_Hoje.Date.ToString("yyyy-MM-dd"), out Ponto ponto))
            {
                if (!string.IsNullOrEmpty(ponto.Entrada))
                    return new FeedBack { Mensagem = "Voce ja bateu o ponto de entrada no dia " + ponto.DataEntrada + " as " + ponto.Entrada, Status = false };
            }
            else
                return new FeedBack { Mensagem = "Ponto não registrado ", Status = false };
            TimeSpan entrada = Convert.ToDateTime(Data_Hoje.ToString("dd/MM/yyyy ") + expediente.Entrada).TimeOfDay;
            if (entrada + Tolerancia < Data_Hoje.TimeOfDay)
                return new FeedBack() { Status = false, Mensagem = "horario minimo para bater o ponto" + (entrada - Tolerancia) };
            else if (entrada - Tolerancia >= Data_Hoje.TimeOfDay)
                ponto.Obs += "<br>" + MSGATRASOENTRADA;
            ponto.Entrada = Data_Hoje.ToString("HH:mm:ss");
            return AlterarPonto(ponto);
        }
        private FeedBack BaterSaida(int funcionario)
        {

            int periodo = Data.ConvertePeriodo(Data_Hoje.ToString("HH:mm:ss"));
            var expediente = GetExpedienteHoje(funcionario, periodo, 'S');
            if (expediente == null)
                return new FeedBack { Mensagem = "Você não pode bater o ponto", Status = false };

            if (GetExpelhoPonto(funcionario, expediente.Id, null, Data_Hoje.Date.ToString("yyyy-MM-dd"), out Ponto ponto))
            {
                if (!string.IsNullOrEmpty(ponto.Saida))
                    return new FeedBack { Mensagem = "Voce ja bateu o ponto de saida no dia " + ponto.DataSaida + " as " + ponto.Saida, Status = false };
            }
            else
                return new FeedBack { Mensagem = "Ponto não registrado ", Status = false };

            DateTime saida = Convert.ToDateTime(Data_Hoje.ToString("dd/MM/yyyy ") + expediente.Saida);
            if (Data_Hoje <= saida - Tolerancia)
                return new FeedBack { Mensagem = "horario minimo para bater o ponto " + (saida.TimeOfDay - Tolerancia), Status = false };
            else if (Data_Hoje > saida + Tolerancia)
                ponto.Obs += "<br>" + MSGATRASOSAIDA;
            ponto.Saida = Data_Hoje.ToString("HH:mm:ss");

            return AlterarPonto(ponto);
        }
        public Ponto GetPoint(int id)
        {
            return null;
        }
        public bool GetExpelhoPonto(int func, int exp, string entrada, string saida, out Ponto ponto)
        {
            Ponto pt = null;
            bool sucesso = false;
            var comand = " SELECT * FROM pontos " +
                         "WHERE funcionario_id = @func AND expediente_id = @exp AND " + (!string.IsNullOrEmpty(entrada) ? "dta_entrada ='" + entrada : "dta_saida ='" + saida) + "'";
            MySqlAdicionaParametro("func", func);
            MySqlAdicionaParametro("exp", exp);

            DataTable tb = MySqlLeitura(comand, CommandType.Text);
            pt = ConvertTableToPonto(tb).FirstOrDefault();
            sucesso = pt != null;
            ponto = pt;
            return sucesso;
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

        private FeedBack AlterarPonto(Ponto ponto)
        {
            MySqlAdicionaParametro("id", ponto.Id);
            MySqlAdicionaParametro("func", ponto.Funcionario);
            MySqlAdicionaParametro("entrada", ponto.Entrada);
            MySqlAdicionaParametro("saida", ponto.Saida);
            MySqlAdicionaParametro("obs", ponto.Obs);
            MySqlAdicionaParametro("dta_entrada", string.IsNullOrEmpty(ponto.DataEntrada) ? "" : Convert.ToDateTime(ponto.DataEntrada).ToString("yyyy-MM-dd"));
            MySqlAdicionaParametro("dta_saida", string.IsNullOrEmpty(ponto.DataSaida) ? "" : Convert.ToDateTime(ponto.DataSaida).ToString("yyyy-MM-dd"));
            return MySqlExecutaComando("UPDATE pontos SET funcionario_id = @func, entrada = @entrada, saida = @saida, dta_entrada = @dta_entrada,dta_saida = @dta_saida ,obs = @obs WHERE id = @id", CommandType.Text);
        }
        private Expediente GetExpedienteHoje(int funcionario, int periodo, char type)
        {
            var exp = new Expediente();
            exp = new ExpedienteController().GetExpediente(funcionario, Data_Hoje.DayOfWeek, periodo, type);
            if (exp == null)
                exp = new ExpedienteController().GetExpediente(funcionario, Data_Hoje.DayOfWeek, 4, type);  // pequisa pelo periodo integral 
            return exp;
        }
        private IEnumerable<Ponto> ConvertTableToPonto(DataTable tb, bool full = false)
        {
            List<Ponto> pontos = new List<Ponto>();
            if (tb.Rows.Count > 0 && tb.TableName != "erro")
            {
                foreach (DataRow dr in tb.Rows)
                {
                    var pt = new Ponto
                    {
                        Id = Convert.ToInt32(dr["id"]),
                        Entrada = dr["entrada"].ToString(),
                        DataEntrada = dr["dta_entrada"].ToString().Substring(0, 10),
                        DataSaida = dr["dta_saida"].ToString().Substring(0, 10),
                        Saida = dr["saida"].ToString(),
                        Obs = dr["obs"].ToString(),
                        Funcionario = Convert.ToInt32(tb.Rows[0]["funcionario_id"])
                    };
                    if (full)
                    {
                        MySqlAdicionaParametro("_id", tb.Rows[0]["expediente_id"].ToString());
                        pt.Expediente = MySqlLeitura("prd_se_full_expediente_id", CommandType.StoredProcedure).Select().Select(x => new Expediente
                        {
                            Id = Convert.ToInt32(x["id"]),
                            Entrada = x["entrada"].ToString(),
                            Saida = x["saida"].ToString(),
                            DiaSemana = Convert.ToInt32(x["etr_semana"]),
                            Periodo = Convert.ToInt32(x["etr_periodo"]),
                            PeriodoSaida = Convert.ToInt32(x["sda_semana"]),
                            Funcionario_id = pt.Funcionario
                        }).FirstOrDefault();
                    }
                    pontos.Add(pt);
                }
            }
            return pontos;
        }
    }
}

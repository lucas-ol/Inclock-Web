﻿using Classes.Common;
using Classes.VO;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace Autenticador.BL
{
    public class CheckPoint
    {
        public const string MSGATRASOSAIDA = "saida em atraso";
        public const string MSGATRASOENTRADA = "entrada em atraso";
        public const string OPERADORWEB = "web";
        private TimeSpan Tolerancia = new TimeSpan(0, 15, 0); // ele tem 15 minutos de tolerancia, para entrada ou saida            
        delegate Expediente findExp(int id);
        DateTime Data_Hoje
        {
            get
            {
                return DateTime.Now.AddMinutes(-15);
            }
        }
        public CheckPoint()
        {
        }
        public FeedBack BaterPonto(int funcionario, char type, string codigo = "0")
        {
            FeedBack feed = new FeedBack();
            if (CheckCode(codigo))
                feed = new FeedBack { Status = false, Mensagem = "O codigo QR esta espirado tente novamente" };
            else if (char.ToUpper(type) == 'E')
                feed = BaterEntrada(funcionario);
            else if (char.ToUpper(type) == 'S')
                feed = BaterSaida(funcionario);
            else
                feed = new FeedBack { Status = false, Mensagem = "Opção invalida" };

            if (feed.Status && codigo != OPERADORWEB)
                UseCode(codigo);

            return feed;
        }
        private FeedBack BaterEntrada(int funcionario)
        {

            int periodo = Data.ConvertePeriodo(Data_Hoje.ToString("HH:mm:ss"));
            var expediente = GetExpedienteHoje(funcionario, periodo, 'E');
            if (expediente == null)
                return new FeedBack { Mensagem = "Você não pode bater o ponto", Status = false };

            if (GetExpelhoPonto(funcionario, expediente.Id, Data_Hoje.Date.ToString("yyyy-MM-dd"), null, out Ponto ponto))
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
            using (DataBase db = new DataBase())
            {
                bool sucesso = false;
                Ponto pt = null;
                var comand = " SELECT * FROM pontos " +
                             "WHERE funcionario_id = @func AND expediente_id = @exp AND " + (!string.IsNullOrEmpty(entrada) ? "dta_entrada ='" + entrada : "dta_saida ='" + saida) + "'";
                db.MySqlAdicionaParametro("func", func);
                db.MySqlAdicionaParametro("exp", exp);

                DataTable tb = db.MySqlLeitura(comand, CommandType.Text);
                pt = ConvertTableToPonto(tb).FirstOrDefault();
                sucesso = pt != null;
                ponto = pt;
                return sucesso;
            }

        }
        public List<Ponto> GetListCheckPoint(string initialDate, string finalDate, int funcionario)
        {
            using (DataBase db = new DataBase())
            {
                List<Ponto> pontos = new List<Ponto>();
                db.MySqlAdicionaParametro("dta_de", DateTime.ParseExact(initialDate,"dd/MM/yyyy",null).ToString("yyyy-MM-dd"));
                db.MySqlAdicionaParametro("dta_ate", DateTime.ParseExact(finalDate, "dd/MM/yyyy", null).ToString("yyyy-MM-dd"));
                db.MySqlAdicionaParametro("funcionario", funcionario);
                var tb = db.MySqlLeitura("select * from pontos where (funcionario_id = @funcionario or @funcionario = 0 ) and dta_entrada between @dta_de and @dta_ate order by dta_entrada; ", CommandType.Text);
                if (tb == null)
                    throw new Exception("erro desconhecido");
                else
                {
                    pontos = ConvertTableToPonto(tb, true).ToList();
                }
                return pontos;
            }
        }
        /*
        public List<Ponto> GetCheckPointByMonth(int month, int funcionario)
        {
            using (DataBase db = new DataBase())
            {
                List<Ponto> ListExpediente = new List<Ponto>();
                db.MySqlAdicionaParametro("_month", month);
                db.MySqlAdicionaParametro("_funcionario", funcionario);
                var tb = db.MySqlLeitura("procedure aqui", CommandType.StoredProcedure);
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
        }
*/
        private FeedBack AlterarPonto(Ponto ponto)
        {
            using (DataBase db = new DataBase())
            {
                db.MySqlAdicionaParametro("id", ponto.Id);
                db.MySqlAdicionaParametro("func", ponto.Funcionario);
                db.MySqlAdicionaParametro("entrada", ponto.Entrada);
                db.MySqlAdicionaParametro("saida", ponto.Saida);
                db.MySqlAdicionaParametro("obs", ponto.Obs);
                db.MySqlAdicionaParametro("dta_entrada", string.IsNullOrEmpty(ponto.DataEntrada) ? "" : Convert.ToDateTime(ponto.DataEntrada).ToString("yyyy-MM-dd"));
                db.MySqlAdicionaParametro("dta_saida", string.IsNullOrEmpty(ponto.DataSaida) ? "" : Convert.ToDateTime(ponto.DataSaida).ToString("yyyy-MM-dd"));
                return db.MySqlExecutaComando("UPDATE pontos SET funcionario_id = @func, entrada = @entrada, saida = @saida, dta_entrada = @dta_entrada,dta_saida = @dta_saida ,obs = @obs WHERE id = @id", CommandType.Text);
            }
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
            var ctx = tb.Select();

            if (ctx != null)
            {
                pontos = ctx.Select(x => new Ponto
                {
                    Id = Convert.ToInt32(x["id"]),
                    Entrada = x["entrada"].ToString(),
                    DataEntrada = x["dta_entrada"].ToString().Substring(0, 10),
                    dt_Entrada = Convert.ToDateTime(x["dta_entrada"]),
                    DataSaida = x["dta_saida"].ToString().Substring(0, 10),
                    dt_Saida = Convert.ToDateTime(x["dta_saida"]),
                    Saida = x["saida"].ToString(),
                    Obs = x["obs"].ToString(),
                    Funcionario = Convert.ToInt32(x["funcionario_id"]),
                    Atraso = x["obs"].ToString().Contains(MSGATRASOENTRADA),
                    Expediente = full ? new ExpedienteController().GetExpedienteId(Convert.ToInt32(x["expediente_id"])) : null
                }).ToList();
            }
            return pontos;
        }
        public bool CheckCode(string codigo)
        {
            if (codigo != OPERADORWEB)
                return false;
            using (var db = new DataBase())
            {
                db.MySqlAdicionaParametro("code", codigo);
                var table = db.MySqlLeitura("select expirado from log_codes where id = @code", System.Data.CommandType.Text);
                if (table.TableName != "erro")
                {
                    return table.Select().Select(x => Convert.ToBoolean(x["expirado"])).FirstOrDefault();
                }
            }
            return true;
        }
        public void UseCode(string codigo)
        {
            Task.Factory.StartNew(() =>
            {
                using (var db = new DataBase())
                {
                    db.MySqlAdicionaParametro("code", codigo);
                    var linhas = db.MySqlExecutaComando("update log_codes set expirado = 1  where id = @code", System.Data.CommandType.Text);
                }
            });
        }
        public BasicInformations GetBasicInformations(string initialDate, string finalDate, string funcionario)
        {
            var info = new BasicInformations();
            using (DataBase db = new DataBase())
            {
                IEnumerable<Ponto> pontos = new List<Ponto>();
                db.MySqlAdicionaParametro("dta_de", Convert.ToDateTime(initialDate).ToString("yyyy-MM-dd"));
                db.MySqlAdicionaParametro("dta_ate", Convert.ToDateTime(finalDate).ToString("yyyy-MM-dd"));
                db.MySqlAdicionaParametro("funcionario", funcionario);
                var tb = db.MySqlLeitura("select * from pontos where (funcionario_id = @funcionario or @funcionario = 0 ) and dta_entrada between @dta_de and @dta_ate order by dta_entrada; ", CommandType.Text);
                info.Montar(ConvertTableToPonto(tb, false));
            }
            return info;
        }
        public class BasicInformations
        {
            [JsonProperty("Informacao")]
            public List<Informacao> Informacoes { get; set; } = new List<Informacao>();
            [JsonProperty("Registros")]
            public List<Ponto> Pontos { get; set; } = new List<Ponto>();
            public void Montar(IEnumerable<Ponto> pontos)
            {
                Pontos = pontos.ToList();
                /*Monta o Primeiro relatorio*/
                var vt = pontos.GroupBy(x => x.Funcionario);
                foreach (var item in pontos.GroupBy(x => x.Funcionario))
                {
                    var bt = item;
                    Informacoes.Add(new Informacao() { Funcionario = item.Key, Tipo = "Entrada", Qtde = item.Count(x => x.Entrada != "") });
                    Informacoes.Add(new Informacao() { Funcionario = item.Key, Tipo = "Saida", Qtde = item.Count(x => x.Saida != "") });
                    Informacoes.Add(new Informacao() { Funcionario = item.Key, Tipo = "Atrasos", Qtde = item.Count(x => x.Atraso) });
                    Informacoes.Add(new Informacao() { Funcionario = item.Key, Tipo = "Faltas", Qtde = item.Count(x => x.Entrada == "" && x.Saida =="" && x.dt_Entrada <= DateTime.Now) });
                }
                //        Informacoes.AddRange();
            }
            public class Informacao
            {
                [JsonProperty("funcionario")]
                public int Funcionario { get; set; }

                [JsonProperty("tipo")]
                public string Tipo { get; set; }

                [JsonProperty("QTDE")]
                public long Qtde { get; set; }
            }
        }
    }
}

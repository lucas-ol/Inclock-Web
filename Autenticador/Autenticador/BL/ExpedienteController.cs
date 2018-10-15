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
    public class ExpedienteController
    {
        public List<Expediente> GetExpediente(int semana, int funcionario_id)
        {
            using (var db = new DataBase())
            {
                db.MySqlAdicionaParametro("iSemana", semana);
                db.MySqlAdicionaParametro("iFuncionario", funcionario_id);
                List<Expediente> ExpedienteList = new List<Expediente>();
                DataTable tb = db.MySqlLeitura("prd_se_expediente_semana", CommandType.StoredProcedure);
                if (tb.TableName != "erro")
                {
                    foreach (DataRow linha in tb.Rows)
                    {
                        Expediente expediente = new Expediente
                        {
                            Id = Convert.ToInt32(linha["id"]),
                            Entrada = DateTime.Parse(linha["entrada"].ToString()).ToString("HH:mm"),
                            Saida = DateTime.Parse(linha["saida"].ToString()).ToString("HH:mm"),
                            DiaSemana = Convert.ToInt32(linha["diasemana"]),
                            Funcionario_id = Convert.ToInt32(linha["funcionario_id"]),
                            Periodo = Convert.ToInt32(linha["periodo"])
                        };


                        // var tts = vr.AddMinutes(bt);
                        expediente.HorasTrabalhada = GetHorasTrabalhada(expediente).ToString().Substring(0, 5);
                        ExpedienteList.Add(expediente);
                    }
                }
                return ExpedienteList;
            }
        }

        /// <summary>
        /// Sobrecarga de metodo, Busca o expediente de entrada ou saida
        /// </summary>
        /// <param name="funcionario">Id do funcionario</param>
        /// <param name="semana">semana do expediente</param>
        /// <param name="periodo">periodo do expediente</param>
        /// <param name="tp">Tipo do expediente se vai se E para entrada ou S para saida</param>
        /// <returns></returns>
        public Expediente GetExpediente(int funcionario, DayOfWeek semana, int periodo, char tp)
        {
            using (var db = new DataBase())
            {
                db.MySqlAdicionaParametro("_funcionario", funcionario);
                db.MySqlAdicionaParametro("_semana", Convert.ToInt32(semana) + 1);
                db.MySqlAdicionaParametro("_periodo", periodo);
                db.MySqlAdicionaParametro("_type", tp);
                DataTable tb = db.MySqlLeitura("prd_se_expediente", CommandType.StoredProcedure);

                if (tb.Rows.Count > 0 && tb.TableName != "erro")
                {
                    return new Expediente
                    {
                        Id = Convert.ToInt32(tb.Rows[0]["expediente_id"]),
                        Periodo = Convert.ToInt32(tb.Rows[0]["periodo"]),
                        Type = Convert.ToChar(tb.Rows[0]["type_point"]),
                        Funcionario_id = Convert.ToInt32(tb.Rows[0]["funcionario_id"]),
                        Entrada = tb.Rows[0]["hora"].ToString(),
                        Saida = tb.Rows[0]["hora"].ToString(),
                        DiaSemana = Convert.ToInt32(tb.Rows[0]["diasemana"])
                    };
                }
                return null;
            }
        }

        public FeedBack SalvaExpediente(Expediente expediente)
        {
            using (var db = new DataBase())
            {
                if (!ValidaDados(expediente))
                    return new FeedBack() { Mensagem = "Dados invalidos", Status = false };
                FeedBack feedBack = new FeedBack() { Status = false };
                db.MySqlAdicionaParametro("_saida", expediente.Saida);
                db.MySqlAdicionaParametro("_entrada", expediente.Entrada);
                db.MySqlAdicionaParametro("_semanaEntrada", expediente.DiaSemana);
                db.MySqlAdicionaParametro("_semanaSaida", CheckSaida(expediente));
                db.MySqlAdicionaParametro("_periodo", Data.ConvertePeriodo(expediente.Entrada));
                db.MySqlAdicionaParametro("_periodo_sda", Data.ConvertePeriodo(expediente.Saida));
                db.MySqlAdicionaParametro("_funcionario_id", expediente.Funcionario_id);
                feedBack = db.MySqlExecutaComando("prd_insert_expediente", CommandType.StoredProcedure);

                if (feedBack.Status)
                {
                    if (feedBack.Mensagem.Contains("duplicate"))
                    {
                        feedBack.Status = false;
                        feedBack.Mensagem = "Expediente ja cadastrado";
                    }
                    else
                    {
                        AdicionaPontosExpediente(Convert.ToInt32(feedBack.Mensagem),expediente.Funcionario_id);
                        feedBack.Mensagem = "Expediente cadastrado com sucesso";
                    }
                }
                else
                    feedBack.Mensagem = "Erro ao processar dados no DB";
                return feedBack;
            }
        }

        public FeedBack AtualizaExpediente(Expediente expediente)
        {
            using (var db = new DataBase())
            {
                FeedBack feedBack = new FeedBack();
                if (!ValidaDados(expediente))
                    return new FeedBack() { Mensagem = "Dados invalidos", Status = false };

                db.MySqlAdicionaParametro("_id", expediente.Id);
                db.MySqlAdicionaParametro("_saida", expediente.Saida);
                db.MySqlAdicionaParametro("_entrada", expediente.Entrada);
                db.MySqlAdicionaParametro("_semanaEntrada", expediente.DiaSemana);
                db.MySqlAdicionaParametro("_semanaSaida", CheckSaida(expediente));
                db.MySqlAdicionaParametro("_periodo", Data.ConvertePeriodo(expediente.Entrada));
                db.MySqlAdicionaParametro("_periodo_sda", Data.ConvertePeriodo(expediente.Saida));
                db.MySqlAdicionaParametro("_funcionario_id", expediente.Funcionario_id);
                feedBack = db.MySqlExecutaComando("prd_updade_expediente", CommandType.StoredProcedure);

                if (feedBack.Status)
                {
                    if (feedBack.Mensagem.Contains("duplicate"))
                    {
                        feedBack.Status = false;
                        feedBack.Mensagem = "Expediente ja cadastrado";
                    }
                    else
                        feedBack.Mensagem = "expediente cadastrado com sucesso";
                }
                else
                    feedBack.Mensagem = "Erro ao processar dados no DB";

                return feedBack;
            }
        }
        public FeedBack Excluir(int id)
        {
            using (var db = new DataBase())
            {
                db.MySqlAdicionaParametro("id", id);
                return db.MySqlExecutaComando("delete from expediente_id where id = @id", System.Data.CommandType.Text);
            }
        }
        public static TimeSpan GetHorasTrabalhada(Expediente expediente)
        {
            TimeSpan horasTrabalhada;
            try
            {
                var VinteQuatroHoras = TimeSpan.Parse("23:59:59");

                TimeSpan saida = TimeSpan.Parse(expediente.Saida).Add(TimeSpan.Parse("00:00:01"));
                TimeSpan entrada = TimeSpan.Parse(expediente.Entrada);
                horasTrabalhada = ((entrada - saida) - VinteQuatroHoras).Duration();
                //se for mais que 24 indica que que ele entrou em um dia e saiu no outro
                return horasTrabalhada > VinteQuatroHoras ? (entrada - saida).Duration() : horasTrabalhada;
            }
            catch (Exception ex)
            {
                throw ex;
            }


        }
        public Expediente GetExpedienteId(int id)
        {
            using (var db = new DataBase())
            {
                db.MySqlAdicionaParametro("_id", id);
                var ret = db.MySqlLeitura("prd_se_full_expediente_id", CommandType.StoredProcedure).Select().Select(x => new Expediente
                {
                    Id = Convert.ToInt32(x["id"]),
                    Funcionario_id = Convert.ToInt32(x["id"]),
                    Entrada = x["entrada"].ToString(),
                    Saida = x["saida"].ToString(),
                    DiaSemana = Convert.ToInt32(x["etr_semana"]),
                    Periodo = Convert.ToInt32(x["etr_periodo"]),
                    PeriodoSaida = Convert.ToInt32(x["sda_semana"])
                }).FirstOrDefault();
                return ret;
            }
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="expediente"></param>
        /// <returns></returns>
        private int CheckSaida(Expediente expediente)
        {
            /* dia onde o dia da semana é o mesmo do dia do mes */
            DateTime etr = Convert.ToDateTime(string.Format("2018/07/{0} {1}", expediente.DiaSemana, expediente.Entrada));
            etr = etr.Add(GetHorasTrabalhada(expediente));
            return Convert.ToInt32(etr.DayOfWeek) + 1;
        }
        public bool ValidaDados(Expediente ex)
        {
            bool validade = true;
            TimeSpan Entrada = Convert.ToDateTime(ex.Entrada).TimeOfDay;
            TimeSpan Saida = Convert.ToDateTime(ex.Saida).TimeOfDay; ;
            TimeSpan HorasTrabalhada = Entrada - Saida;

            if (Math.Abs(HorasTrabalhada.Hours) < 1)
                validade = false;

            else if (ex.DiaSemana == 0)
                validade = false;

            else if (ex.Funcionario_id <= 0)
                validade = false;

            return validade;
        }
        public Task AdicionaPontosExpediente(int expID,int func)
        {
            using (DataBase db = new DataBase())
            {
                var exp = GetExpedienteId(expID);
                var dta = UtilDate.GetDiasSemanas(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day);
                string dados = "";
                foreach (var dia in dta.Semanas[(DayOfWeek)exp.DiaSemana - 1])
                {
                    var dta_saida = dia.Add(TimeSpan.Parse(exp.Entrada)).Add(GetHorasTrabalhada(exp));
                    dados += String.Format("({0},{1},'{2}','{3}'),", func, exp.Id, dia.ToString("yyyy-MM-dd"), dta_saida.ToString("yyyy-MM-dd"));
                }
                if (!string.IsNullOrEmpty(dados))
                {
                    db.MySqlExecutaComando("INSERT INTO pontos(funcionario_id, expediente_id, dta_entrada,dta_saida) VALUES " + dados.Substring(0, dados.Length - 1), CommandType.Text);
                }
            }
            return Task.Factory.StartNew(() =>
            {
                using (DataBase db = new DataBase())
                {
                    var exp = GetExpedienteId(expID);
                    var dta = UtilDate.GetDiasSemanas(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day);
                    string dados = "";
                    foreach (var dia in dta.Semanas[(DayOfWeek)exp.DiaSemana + 1])
                    {
                        var dta_saida = dia.Add(TimeSpan.Parse(exp.Entrada)).Add(GetHorasTrabalhada(exp));
                        dados = String.Format("({0},{1},{2},{3}),", exp.Funcionario_id, exp.Id, dia.ToString("yyyy-MM-dd"), dta_saida.ToString("yyyy-MM-dd"));
                    }
                    if (!string.IsNullOrEmpty(dados))
                    {
                        db.MySqlExecutaComando("INSERT INTO pontos(funcionario_id, expediente_id, dta_entrada,dta_saida) VALUES " + dados.Substring(0, dados.Length - 1), CommandType.Text);
                    }
                }
            });
        }
    }
}

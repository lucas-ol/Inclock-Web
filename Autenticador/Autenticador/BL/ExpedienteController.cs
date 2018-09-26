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
    public class ExpedienteController : DataBase
    {
        public List<Expediente> GetExpediente(int semana, int funcionario_id)
        {
            MySqlAdicionaParametro("iSemana", semana);
            MySqlAdicionaParametro("iFuncionario", funcionario_id);
            List<Expediente> ExpedienteList = new List<Expediente>();
            DataTable tb = MySqlLeitura("prd_se_expediente_semana", CommandType.StoredProcedure);
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
                    var bt = GetHorasTrabalhada(expediente);
                    var vr = Convert.ToDateTime("00:00");
                   // var tts = vr.AddMinutes(bt);
                    expediente.HorasTrabalhada = Convert.ToDateTime("00:00").TimeOfDay.ToString("HH:mm");
                    ExpedienteList.Add(expediente);
                }
            }
            return ExpedienteList;
        }
        public Expediente GetExpediente(int funcionario, int semana, int periodo)
        {
            MySqlAdicionaParametro("_funcionario", funcionario);
            MySqlAdicionaParametro("_semana", semana);
            MySqlAdicionaParametro("_periodo", periodo);
            try
            {
                DataRow dr = MySqlLeitura("procedure a ser criada ", CommandType.Text).Rows[0];
                return new Expediente
                {
                    Id = Convert.ToInt32(dr["id"]),
                    Funcionario_id = Convert.ToInt32(dr["funcionario_id"]),
                    Entrada = dr["entrada"].ToString(),
                    Saida = dr["saida"].ToString(),
                    Periodo = Convert.ToInt32(dr["periodo"]),
                    DiaSemana = Convert.ToInt32(dr["diasemana"])
                };
            }
            catch
            {
                return new Expediente();
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
            MySqlAdicionaParametro("_funcionario", funcionario);
            MySqlAdicionaParametro("_semana", Convert.ToInt32(semana) + 1);
            MySqlAdicionaParametro("_periodo", periodo);
            MySqlAdicionaParametro("_type", tp);
            DataTable tb = MySqlLeitura("prd_se_expediente", CommandType.StoredProcedure);
            if (tb.Rows.Count > 0 && tb.TableName != "erro")
            {
                return new Expediente
                {
                    Id = Convert.ToInt32(tb.Rows[0]["id"]),
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

        public FeedBack SalvaExpediente(Expediente expediente)
        {
            if (!ValidaDados(expediente))
                return new FeedBack() { Mensagem = "Dados invalidos", Status = false };
            FeedBack feedBack = new FeedBack() { Status = false };
            MySqlAdicionaParametro("_saida", expediente.Saida);
            MySqlAdicionaParametro("_entrada", expediente.Entrada);
            MySqlAdicionaParametro("_semanaEntrada", expediente.DiaSemana);
            MySqlAdicionaParametro("_semanaSaida", CheckSaida(expediente));
            MySqlAdicionaParametro("_periodo", Data.ConvertePeriodo(expediente.Entrada));
            MySqlAdicionaParametro("_periodo_sda", Data.ConvertePeriodo(expediente.Saida));
            MySqlAdicionaParametro("_funcionario_id", expediente.Funcionario_id);
            feedBack = MySqlExecutaComando("prd_insert_expediente", CommandType.StoredProcedure);

            if (feedBack.Status)
            {
                if (feedBack.Mensagem.Contains("duplicate"))
                {
                    feedBack.Status = false;
                    feedBack.Mensagem = "Expediente ja cadastrado";
                }
                feedBack.Mensagem = "Expediente cadastrado com sucesso";
            }
            else
                feedBack.Mensagem = "Erro ao processar dados no DB";

            return feedBack;
        }

        public FeedBack AtualizaExpediente(Expediente expediente)
        {
            FeedBack feedBack = new FeedBack();
            if (!ValidaDados(expediente))
                return new FeedBack() { Mensagem = "Dados invalidos", Status = false };

            MySqlAdicionaParametro("_id", expediente.Id);
            MySqlAdicionaParametro("_saida", expediente.Saida);
            MySqlAdicionaParametro("_entrada", expediente.Entrada);
            MySqlAdicionaParametro("_semanaEntrada", expediente.DiaSemana);
            MySqlAdicionaParametro("_semanaSaida", CheckSaida(expediente));
            MySqlAdicionaParametro("_periodo", Data.ConvertePeriodo(expediente.Entrada));
            MySqlAdicionaParametro("_periodo_sda", Data.ConvertePeriodo(expediente.Saida));
            MySqlAdicionaParametro("_funcionario_id", expediente.Funcionario_id);
            feedBack = MySqlExecutaComando("prd_updade_expediente", CommandType.StoredProcedure);

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
        public FeedBack Excluir(int id)
        {
            MySqlAdicionaParametro("id", id);
            return MySqlExecutaComando("delete from expediente_id where id = @id", System.Data.CommandType.Text);
        }
        public TimeSpan GetHorasTrabalhada(Expediente expediente)
        {
            TimeSpan horasTrabalhada;
            try
            {
                var VinteQuatroHoras = TimeSpan.Parse("23:59:59");

                TimeSpan saida = TimeSpan.Parse(expediente.Saida);
                TimeSpan entrada = TimeSpan.Parse(expediente.Entrada);
                horasTrabalhada = ((entrada - saida) - VinteQuatroHoras).Duration();
                //se for mais que 24 indica que que ele entrou em um dia e saiu no outro
                return horasTrabalhada > VinteQuatroHoras ? (entrada - saida).Duration() : horasTrabalhada;
            }
            catch (Exception ex)
            {

                throw;
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

    }
}

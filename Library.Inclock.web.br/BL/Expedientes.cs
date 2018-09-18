using Classes.Common;
using Classes.VO;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Library.Inclock.web.br.BL
{
    public class Expedientes : DataBase
    {
        public FeedBack SalvaExpediente(Classes.VO.Expediente expediente)
        {

            FeedBack feedBack = new FeedBack() { Status = false };
            RecuperaPeriodo(ref expediente);
            MySqlAdicionaParametro("_saida", expediente.Saida);
            MySqlAdicionaParametro("_entrada", expediente.Entrada);
            MySqlAdicionaParametro("_semanaEntrada", expediente.DiaSemana);
            MySqlAdicionaParametro("_semanaSaida", CheckSaida(expediente));
            MySqlAdicionaParametro("_periodo", expediente.Periodo);
            MySqlAdicionaParametro("_periodo_sda", expediente.PeriodoSaida);
            MySqlAdicionaParametro("_funcionario_id", expediente.Funcionario_id);
            feedBack = MySqlExecutaComando("prd_insert_expediente", System.Data.CommandType.StoredProcedure);
            if (feedBack.Mensagem.Contains("integral"))
            {
                feedBack.Mensagem = "Nesse expediente tem um periodo integral";
                feedBack.Status = false;
            }
            else if (feedBack.Mensagem.Contains("duplicate"))
            {
                feedBack.Status = false;
                feedBack.Mensagem = "Expediente ja cadastrado";
            }
            else if (feedBack.Mensagem.Contains("expediente"))
            {
                feedBack.Status = false;
                feedBack.Mensagem = "Você não pode cadastrar um expediente integral no dia que ja tem outros expedientes cadastrados";
            }

            return feedBack; ;
        }
        public List<Expediente> ListaExpediente(int funcionario_Id)
        {
            return ListaExpediente(funcionario_Id, 0);
        }
        public List<Expediente> ListaExpediente(int funcionario_Id, int semana)
        {
            List<Expediente> expediente = new List<Expediente>();

            if (funcionario_Id <= 0)
            {
                return expediente;
            }
            var responce = new Autenticador.ServiceClient().GetExpediente(semana.ToString(), funcionario_Id.ToString());
            expediente.AddRange(responce);
            return expediente;
        }

        public FeedBack AtualizaExpediente(Expediente expediente)
        {
            FeedBack feedBack = new FeedBack();
            RecuperaPeriodo(ref expediente);
            MySqlAdicionaParametro("_id", expediente.Id);
            MySqlAdicionaParametro("_saida", expediente.Saida);
            MySqlAdicionaParametro("_entrada", expediente.Entrada);
            MySqlAdicionaParametro("_semanaEntrada", expediente.DiaSemana);
            MySqlAdicionaParametro("_semanaSaida", CheckSaida(expediente));
            MySqlAdicionaParametro("_periodo", expediente.Periodo);
            MySqlAdicionaParametro("_periodo_sda", expediente.PeriodoSaida);
            MySqlAdicionaParametro("_funcionario_id", expediente.Funcionario_id);
            feedBack = MySqlExecutaComando("prd_updade_expediente", System.Data.CommandType.StoredProcedure);

            if (feedBack.Mensagem.Contains("integral"))
            {
                feedBack.Mensagem = "Nesse expediente tem um periodo integral";
                feedBack.Status = false;
            }
            else if (feedBack.Mensagem.Contains("duplicate"))
            {
                feedBack.Status = false;
                feedBack.Mensagem = "Expediente ja cadastrado";
            }
            else if (feedBack.Mensagem.Contains("expediente"))
            {
                feedBack.Status = false;
                feedBack.Mensagem = "Você não pode cadastrar um expediente integral no dia que ja tem outros expedientes cadastrados";
            }
            return feedBack;
        }
        public bool Excluir(int id)
        {
            MySqlAdicionaParametro("id", id);
            return MySqlExecutaComando("delete from expediente_id where id = @id", System.Data.CommandType.Text).Status;
        }
        public double GetHorasTrabalhada(Expediente expediente)
        {
            double entrada;
            double horasTrabalhada;
            double saida = Convert.ToDouble(expediente.Saida.Replace(":", ","));
            entrada = Convert.ToDouble(expediente.Entrada.Replace(":", ","));
            horasTrabalhada = (Math.Abs((entrada - saida) - 24));
            //se for mais que 24 indica que que ele entrou em um dia e saiu no outro
            return horasTrabalhada > 24 ? Math.Abs(entrada - saida) : horasTrabalhada;
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="expediente"></param>
        /// <returns></returns>
        private int CheckSaida(Expediente expediente)
        {
            DateTime etr = Convert.ToDateTime(string.Format("2018/07/{0} {1}", expediente.DiaSemana, expediente.Entrada));

            decimal entrada;
            decimal horasTrabalhada;            
            decimal saida = Convert.ToDecimal(expediente.Saida.Replace(":", ","));
            entrada = Convert.ToDecimal(expediente.Entrada.Replace(":", ","));
            horasTrabalhada = (Math.Abs((entrada - saida) - 24));

            if (horasTrabalhada > 24)
                horasTrabalhada = Math.Abs(entrada - saida);      
            etr = etr.AddMilliseconds(Convert.ToDouble(GetHorasTrabalhada(expediente)) * 60 * 60 * 1000);  
            return Convert.ToInt32(etr.DayOfWeek) +1;
        }
        
        private void RecuperaPeriodo(ref Expediente exp)
        {
            using (Autenticador.ServiceClient client = new Autenticador.ServiceClient())
            {
                exp.Periodo = client.ConvertePeriodo(exp.Entrada);
                exp.PeriodoSaida = client.ConvertePeriodo(exp.Saida);
            }
        }

    }
}

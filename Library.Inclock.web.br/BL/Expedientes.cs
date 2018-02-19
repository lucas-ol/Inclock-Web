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
            FeedBack feedback = new FeedBack() { Status = false };

            MySqlAdicionaParametro("_saida", expediente.Saida);
            MySqlAdicionaParametro("_entrada", expediente.Entrada);
            MySqlAdicionaParametro("_tempo_pausa", expediente.Tempo_Pausa);
            MySqlAdicionaParametro("_diasemana", expediente.DiaSemana);
            MySqlAdicionaParametro("_periodo", expediente.Periodo);
            MySqlAdicionaParametro("_funcionario_id", expediente.Funcionario_id);
            feedback = MySqlExecutaComando("prd_insert_expediente", System.Data.CommandType.StoredProcedure);
            int retorno;
            int.TryParse(feedback.Mensagem, out retorno);
            feedback.Status = retorno > 0;
            return feedback; ;
        }
        public List<Expediente> ListaExpediente(int funcionario_Id)
        {
            return ListaExpediente(funcionario_Id, 0);
        }
        public List<Expediente> ListaExpediente(int funcionario_Id, int semana)
        {
            List<Expediente> expediente = new List<Expediente>();
            expediente = JsonConvert.DeserializeObject<List<Expediente>>(new Autenticador.AutenticadorClient().GetExpediente(semana, funcionario_Id));
            return expediente;
        }



    }
}

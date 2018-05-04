﻿using Classes.Common;
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
            MySqlAdicionaParametro("_semanaEntrada", expediente.DiaSemana);
            MySqlAdicionaParametro("_semanaSaida", CheckSaida(expediente));
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
            MySqlAdicionaParametro("_id", expediente.Id);
            MySqlAdicionaParametro("_saida", expediente.Saida);
            MySqlAdicionaParametro("_entrada", expediente.Entrada);
            MySqlAdicionaParametro("_semanaEntrada", expediente.DiaSemana);
            MySqlAdicionaParametro("_semanaSaida", CheckSaida(expediente));
            MySqlAdicionaParametro("_periodo", expediente.Periodo);
            MySqlAdicionaParametro("_funcionario_id", expediente.Funcionario_id);
            feedBack = MySqlExecutaComando("prd_updade_expediente", System.Data.CommandType.StoredProcedure);
            return feedBack;
        }
        public bool Excluir(int id)
        {
            MySqlAdicionaParametro("id", id);
            return MySqlExecutaComando("delete from expediente_id where id = @id", System.Data.CommandType.Text).Status;
        }
        TimeSpan saida;
        TimeSpan entrada;
        TimeSpan ht;
        DateTime hora;
        private int CheckSaida(Expediente expediente)
        {
            saida = Convert.ToDateTime(expediente.Saida).TimeOfDay;
            entrada = Convert.ToDateTime(expediente.Entrada).TimeOfDay;
            ht = entrada - saida;
            hora = DateTime.Now;
            hora = hora.Add(ht);
            if (hora.Day > DateTime.Now.Day)  // Se virar o dia, quer dizer que o func vai bater a saida no outro dia         
                expediente.DiaSemana++;

            return expediente.DiaSemana;
        }

    }
}

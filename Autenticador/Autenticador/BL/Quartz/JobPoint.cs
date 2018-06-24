using Classes;
using Classes.Common;
using Classes.VO;
using MySql.Data.MySqlClient;
using Quartz;
using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Autenticador.BL.Quartz
{
    public class JobPoint : DataBase, IJob
    {

        public Task Execute(IJobExecutionContext context)
        {
            Adiciona_Pontos();
            return Task.CompletedTask;
        }

        public void Adiciona_Pontos()
        {
            DateTime dtPrxMes;
            if (GetLastInsertPoint(out dtPrxMes))
            {
                var Datas = UtilDate.GetDiasSemanas(dtPrxMes.Year, dtPrxMes.Month);
                DataTable tb = MySqlLeitura("select id from funcionarios", System.Data.CommandType.Text);
                foreach (DataRow func in tb.Rows)
                {
                    int id = Convert.ToInt32(func["id"]);
                    foreach (var week in Datas.Semanas)
                    {
                        var exp = new ExpedienteController().GetExpediente(id, Convert.ToInt32(week.Key) + 1);
                        foreach (var dia in week.Value)
                        {
                            foreach (var item in exp)
                            {
                                var parameter = new MySqlCommand().Parameters;
                                parameter.AddWithValue("_funcionario", id);
                                parameter.AddWithValue("_entrada", item.Entrada);
                                parameter.AddWithValue("_dataEntrada", dia);
                                parameter.AddWithValue("_expEntrada", "");
                                parameter.AddWithValue("_saida", item.Saida);
                                parameter.AddWithValue("_dataSaida", );
                                parameter.AddWithValue("_expSaida", "");

                            }
                        }
                    }
                }

            }
        }
        private bool GetLastInsertPoint(out DateTime dateTime)
        {
            var tb = MySqlLeitura("SELECT data_ponto from pontos order by data_ponto desc limit 1", CommandType.Text);
            if (tb.Rows.Count == 0)
                dateTime = Convert.ToDateTime("01/" + DateTime.Now.Month + "/" + DateTime.Now.Year);
            else
                dateTime = Convert.ToDateTime("01/" + tb.Rows[0][0].ToString().Substring(3)).AddMonths(1);
            return
              dateTime.Month - DateTime.Now.Month <= 1;
        }
        private async void InsertNullPoit(MySqlParameterCollection parameters)
        {
            var command = new MySqlCommand();
            var connection = new MySqlConnection(SzConnexao);

            command.CommandTimeout = 1000 * 60 * 2; // Vai esperar ate 2 min para fazer a inserçao 
            command.Connection = connection;
            foreach (MySqlParameter param in parameters)
                command.Parameters.AddWithValue(param.ParameterName, param.Value);
            command.CommandText = "prd_in_point_null";
            command.CommandType = CommandType.StoredProcedure;
            try
            {
                await connection.OpenAsync();
                await command.ExecuteScalarAsync();
            }
            catch (Exception ex)
            {
                Classes.Common.UtilEmail.ErroMail(ex); //manda um email de erro 
            }


        }
    }
}

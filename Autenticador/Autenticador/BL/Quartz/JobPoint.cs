using Classes;
using Classes.Common;
using Classes.VO;
using MySql.Data.MySqlClient;
using Quartz;
using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Hosting;

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
            if (GetLastInsertPoint(out DateTime dtPrxMes))
            {
                var Arquivo = HostingEnvironment.MapPath(Config.Exports) + "\\" + dtPrxMes.ToString("yyyy_MM_dd") + ".csv";
                UtilFile.Delete(Arquivo);
                var Datas = UtilDate.GetDiasSemanas(dtPrxMes.Year, dtPrxMes.Month);
                DataTable tb = MySqlLeitura("select id from funcionarios", System.Data.CommandType.Text);
                foreach (DataRow func in tb.Rows)
                {
                    int funcionario_id = Convert.ToInt32(func["id"]);
                    foreach (var week in Datas.Semanas)
                    {
                        var exp = new ExpedienteController().GetExpediente(Convert.ToInt32(week.Key) + 1, funcionario_id);
                        foreach (var dia in week.Value)
                        {
                            foreach (var item in exp)
                            {
                                var dta_saida = dia.Add(TimeSpan.Parse(item.Entrada)).Add(ExpedienteController.GetHorasTrabalhada(item));
                                UtilFile.FileWrite(Arquivo, String.Format("{0};{1};{2};{3};{4};{5};{6}\r", null, funcionario_id, item.Id, null, null, dia.ToString("yyyy-MM-dd"), dta_saida.ToString("yyyy-MM-dd")));
                            }
                        }
                    }
                }
                InsertNullPoits(Arquivo);
            }
        }
        private bool GetLastInsertPoint(out DateTime dateTime)
        {
            var tb = MySqlLeitura("SELECT dta_entrada from pontos order by dta_entrada desc limit 1", CommandType.Text);
            if (tb.Rows.Count == 0 || tb.TableName =="erro")
                dateTime = Convert.ToDateTime("01/" + DateTime.Now.Month + "/" + DateTime.Now.Year);
            else
                dateTime = Convert.ToDateTime("01/" + tb.Rows[0][0].ToString().Substring(3)).AddMonths(1);
            return
              dateTime.Month - DateTime.Now.Month <= 1;
        }
        private void InsertNullPoits(string aquivo)
        {

            var connection = new MySqlConnection(SzConnexao);

            connection.Open();
        //    connection.Open();
            MySqlBulkLoader bulk = new MySqlBulkLoader(connection)
            {
                TableName = "pontos",
                FieldTerminator = ";",
                LineTerminator = "\r",
                FileName = aquivo,
                NumberOfLinesToSkip = 1,
                Priority = MySqlBulkLoaderPriority.Concurrent
            };
            try
            {

                var tb = bulk.Load();
            }
            catch (Exception ex)
            {

                throw ex;
            }


        }

        public int InsertID(int funcionario)
        {

            var command = new MySqlCommand();
            var connection = new MySqlConnection(SzConnexao);

            command.CommandTimeout = 1000 * 60 * 2; // Vai esperar ate 2 min para fazer a inserçao 
            command.Connection = connection;

            command.Parameters.AddWithValue("id", funcionario);
            command.CommandText = "prd_in_point_null";
            command.CommandType = CommandType.StoredProcedure;
            try
            {
                connection.Open();
                var rd = command.ExecuteReader();
                while (rd.Read())
                {
                    return rd.GetInt32(0);
                }
                return 0;
            }
            catch (Exception ex)
            {
                Classes.Common.UtilEmail.ErroMail(ex, "id - " + funcionario); //manda um email de erro 
                throw ex;
            }
        }
    }
}

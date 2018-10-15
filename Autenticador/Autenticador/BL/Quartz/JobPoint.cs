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
    public class JobPoint : IJob
    {

        public Task Execute(IJobExecutionContext context)
        {
            AdicionaPontos();
            return Task.CompletedTask;
        }

        public void AdicionaPontos()
        {
            if (GetLastInsertPoint(out DateTime dtPrxMes))
            {
                using (DataBase data = new DataBase())
                {

                    var Arquivo = HostingEnvironment.MapPath(Config.Exports) + "\\" + dtPrxMes.ToString("yyyy_MM_dd") + ".csv";
                    UtilFile.Delete(Arquivo);
                    var Datas = UtilDate.GetDiasSemanas(dtPrxMes.Year, dtPrxMes.Month);
                    var tb = new ExpedienteController().GetExpediente(0, 0);

                    foreach (var exp in tb)
                    {
                        foreach (var dia in Datas.Semanas[(DayOfWeek)exp.DiaSemana-1])
                        {
                            var dta_saida = dia.Add(TimeSpan.Parse(exp.Entrada)).Add(ExpedienteController.GetHorasTrabalhada(exp));
                            string dados = String.Format("{0};{1};{2};{3};{4};{5};{6}\r", null, exp.Funcionario_id, exp.Id, null, null, dia.ToString("yyyy-MM-dd"), dta_saida.ToString("yyyy-MM-dd"));
                           UtilFile.FileWrite(Arquivo,dados);

                        }
                    }                   
                    InsertNullPoits(Arquivo);
                }
            }
        }
        private bool GetLastInsertPoint(out DateTime dateTime)
        {
            DataBase data = new DataBase();
            var tb = data.MySqlLeitura("SELECT dta_entrada from pontos order by dta_entrada desc limit 1", CommandType.Text);
            if (tb.Rows.Count == 0 || tb.TableName == "erro")
                dateTime = Convert.ToDateTime("01/" + DateTime.Now.Month + "/" + DateTime.Now.Year);
            else
                dateTime = Convert.ToDateTime("01/" + tb.Rows[0][0].ToString().Substring(3)).AddMonths(1);
            return
              dateTime.Month - DateTime.Now.Month <= 1;
        }
        private void InsertNullPoits(string aquivo)
        {
            BulkConfig config = new BulkConfig
            {
                TableName = "pontos",
                FieldTerminator = ";",
                LineTerminator = "\r",
                File = aquivo,
                NumberOfLinesToSkip = 1
            };
            using (DataBase db = new DataBase())
            {
                db.MySqlGenericBulk(config);
            }

        }
    }
}

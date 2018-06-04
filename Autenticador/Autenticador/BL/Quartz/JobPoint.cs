using Classes;
using Classes.Common;
using Classes.VO;
using Quartz;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Autenticador.BL.Quartz
{
    public class JobPoint : DataBase, IJob
    {

        public Task Execute(IJobExecutionContext context)
        {
            var vrf = true;
            do
            {
                try
                {
                    Adiciona_Pontos();
                    vrf = false;
                }
                catch (Exception ex)
                {
                    Classes.Common.UtilEmail.ErroMail(ex); //manda um email de erro 
                    System.Threading.Thread.Sleep(1000 * 60 * 15);
                }
            } while (vrf);

            return Task.CompletedTask;
        }

        public void Adiciona_Pontos()
        {
            DateTime dtPrxMes;
            if (GetLastInsertPoint(out dtPrxMes))
            {
                var qtdeDiasMes = DateTime.DaysInMonth(dtPrxMes.Year, dtPrxMes.Month + 1);
                DataTable tb = MySqlLeitura("select id from funcionarios", System.Data.CommandType.Text);
                for (int i = 1; i < qtdeDiasMes; i++)
                {
                    foreach (DataRow func in tb.Rows)
                    {
                        List<Expediente> expedientes = new ExpedienteController().GetExpediente(Convert.ToInt32(dtPrxMes.DayOfWeek) + 1, Convert.ToInt32(func["id"]));
                        foreach (Expediente exp in expedientes)
                        {
                            MySqlAdicionaParametro("date", dtPrxMes.ToString("yyyy-MM-dd"));
                            MySqlAdicionaParametro("func", func["id"]);
                            MySqlAdicionaParametro("expId", exp.Id);
                            MySqlExecutaComando("INSERT INTO pontos(data_ponto,funcionario_id,expediente_id)VALUES(@date,@func,@expId);", CommandType.Text);
                        }
                    }
                    dtPrxMes = dtPrxMes.AddDays(1);
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

    }
}

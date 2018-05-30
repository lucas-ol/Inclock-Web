

using Classes.Common;
using Quartz;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Autenticador.BL.Quartz
{
    public class JobPoint : DataBase, IJob
    {
        public static void InitPoint()
        {
            var idd = DateTime.DaysInMonth(DateTime.Now.Year, DateTime.Now.Month);
        }

        public Task Execute(IJobExecutionContext context)
        {
            var vrf = true;
            do
            {
                try
                {
                    MySqlExecutaComando("insert into cargo(descricao) values('schandule')", System.Data.CommandType.Text);
                }
                catch (Exception ex)
                {
                    System.Threading.Thread.Sleep(1000 * 60 * 15);
                }
            } while (vrf);

            return Task.CompletedTask;
        }
    }
}

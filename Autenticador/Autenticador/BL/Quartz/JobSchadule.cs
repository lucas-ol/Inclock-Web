using Classes.Common;
using Hangfire;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Autenticador.BL.Quartz
{
    internal class JobSchadule
    {
        public static void InitPoint()
        {
            var idd = DateTime.DaysInMonth( DateTime.Now.Year,DateTime.Now.Month);
            BackgroundJob.Schedule(() => new Funcionarios().AdicionaLinhasPonto(), TimeSpan.FromMinutes(1000));

        }
        private class Funcionarios : DataBase
        {
            public void AdicionaLinhasPonto()
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
            }
        }
    }
}

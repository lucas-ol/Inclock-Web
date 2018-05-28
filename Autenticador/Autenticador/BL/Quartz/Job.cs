
using Hangfire;
using Hangfire.MySql;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Autenticador.BL.Quartz
{
    public class Job
    {
        public static Job Instancia = new Job();
        private BackgroundJobServer backgraundServer;
        private readonly object lockObject = new object();
        public Job()
        {
           
        }
        public void Start()
        {
            lock (lockObject)
            {
                GlobalConfiguration.Configuration.UseStorage(new MySqlStorage("sql"));
                backgraundServer = new BackgroundJobServer();
            }
            JobSchadule.InitPoint();
        }
        public void Stop()
        {
            if (backgraundServer != null)
            {
               
                backgraundServer.Dispose();
          }
        }

    }
}

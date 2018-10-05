using Quartz;
using Quartz.Impl;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Autenticador.BL.Quartz
{
    /// <summary>
    /// classe que vai programar os quartz 
    /// </summary>
   public class Schendule
    {
        public static readonly Schendule Instance = new Schendule();     
       
      
        private const string EXPRESSAO = "0 */2 * ? * *";// Cron Expressions para o Job          59 59 23 L * ? *
        public async void Start(Type Job)
        {
            IScheduler Servidor = await StdSchedulerFactory.GetDefaultScheduler();
            Servidor = await StdSchedulerFactory.GetDefaultScheduler();
            await Servidor.Start();

            JobDetailImpl job = new JobDetailImpl(nameof(Job), Job);

            ITrigger trigger = TriggerBuilder.Create().WithIdentity(nameof(Job)).StartNow()
              .WithSchedule(CronScheduleBuilder.CronSchedule(new CronExpression(EXPRESSAO))).ForJob(nameof(Job)).Build();
            try
            {
                await Servidor.ScheduleJob(job, trigger);
                await Servidor.Start();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public async void DeleteAll()
        {
            IScheduler Servidor = await StdSchedulerFactory.GetDefaultScheduler();
            var processos = await Servidor.GetCurrentlyExecutingJobs();
            foreach (var item in processos)
            {
                await Servidor.DeleteJob(item.JobDetail.Key);
            }
        }
    }
}

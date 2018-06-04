using Classes.Common;
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
    ///  Não esquecer de mudar a CronExpression para 
    ///  "0 0 0 L * ? *" ultimo dia do Mes as 00h
    ///  "0 */2 * ? * *" de minuto em minuto Irregular
    /// </summary>
    public class JobSchedule
    {
        public static readonly JobSchedule Instance = new JobSchedule();

        public JobSchedule()
        {
            StartInstance();
        }
        public async void StartInstance()
        {
            Servidor = await StdSchedulerFactory.GetDefaultScheduler();
        }
        private IScheduler Servidor { get; set; }
        private const string EXPRESSAO = "0 */2 * ? * *";// Cron Expressions para o Job
        public async void Start()
        {
            Servidor = await StdSchedulerFactory.GetDefaultScheduler();
            await Servidor.Start();

            JobDetailImpl job = new JobDetailImpl("JobPoint", typeof(JobPoint));

            ITrigger trigger = TriggerBuilder.Create().WithIdentity("Quartz Point").StartNow()
              .WithSchedule(CronScheduleBuilder.CronSchedule(new CronExpression(EXPRESSAO))).ForJob("JobPoint").Build();
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

            var processos = await Servidor.GetCurrentlyExecutingJobs();
            foreach (var item in processos)
            {
                await Servidor.DeleteJob(item.JobDetail.Key);
            }
        }
    }
}

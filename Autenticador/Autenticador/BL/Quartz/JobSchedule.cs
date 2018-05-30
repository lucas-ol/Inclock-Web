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
            Schenduler = await StdSchedulerFactory.GetDefaultScheduler();
        }
        private IScheduler Schenduler { get; set; }
        private const string EXPRESSAO = "0 */2 * ? * *";// Cron Expressions para o Job
        public async void Start()
        {
            Schenduler = await StdSchedulerFactory.GetDefaultScheduler();
            await Schenduler.Start();

            IJobDetail job = JobBuilder.Create<JobPoint>().Build();

            ITrigger trigger = TriggerBuilder.Create().WithIdentity("Quartz Point").StartNow()
                .WithSchedule(CronScheduleBuilder.CronSchedule(EXPRESSAO)).ForJob("UltimoDiaDoMes").Build();
            Schenduler.ScheduleJob(job, trigger).Wait();


        }
        public async void DeleteAll()
        {

            var processos = await Schenduler.GetCurrentlyExecutingJobs();
            foreach (var item in processos)
            {
                await Schenduler.DeleteJob(item.JobDetail.Key);
            }
        }
    }
}

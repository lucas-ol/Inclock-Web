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
    public class JobPointExpedientes : IJob
    {
        public Task Execute(IJobExecutionContext context)
        {
            Adiciona_Pontos();
            return Task.CompletedTask;
        }
        private void Adiciona_Pontos()
        {
            var exps = GetExpedientes();
            if (exps.Any())
            {
                var dtas = UtilDate.GetDiasSemanas(DateTime.Now.Year, DateTime.Now.Month);
                var arquivo = "";
                foreach (var exp in exps)
                {
                    foreach (var dia in dtas.Semanas[(DayOfWeek)exp.DiaSemana])
                    {
                        var dta_saida = dia.Add(TimeSpan.Parse(exp.Entrada)).Add(ExpedienteController.GetHorasTrabalhada(exp));
                        UtilFile.FileWrite(arquivo, String.Format("{0};{1};{2};{3};{4};{5};{6}\r", null, exp.Funcionario_id, exp.Id, null, null, dia.ToString("yyyy-MM-dd"), dta_saida.ToString("yyyy-MM-dd")));
                    }
                }
            }
        }
        /// <summary>
        /// Metodo que vai Pegar os expediente que não foram inseridos
        /// </summary>
        /// <returns></returns>
        private IEnumerable<Expediente> GetExpedientes()
        {
            IEnumerable<Expediente> exp = new List<Expediente>();
            using (DataBase db = new DataBase())
            {
                db.MySqlAdicionaParametro("", "");
                db.MySqlLeitura("", CommandType.StoredProcedure);
                return exp;
            }
        }
    }
}

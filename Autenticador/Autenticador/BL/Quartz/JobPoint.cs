﻿using Classes;
using Classes.Common;
using Classes.VO;
using MySql.Data.MySqlClient;
using Quartz;
using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

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
                            // int ponto_id = InsertID(funcionario_id);
                                /* var parameter = new MySqlCommand().Parameters;
                                 parameter.AddWithValue("_funcionario", id);
                                 parameter.AddWithValue("_entrada", item.Entrada);
                                 parameter.AddWithValue("_dataEntrada", dia);
                                 parameter.AddWithValue("_expediente", item.Id);
                                 parameter.AddWithValue("_saida", item.Saida);
                                 parameter.AddWithValue("_dataSaida", dia.AddDays(CheckSaida(item)).Date);*/
                                RealizaExportacao("");
                            }
                        }
                    }
                }

            }
        }
        private bool RealizaExportacao(string linha)
        {
            return true;
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
        private void InsertNullPoits(string aquivo)
        {
            var command = new MySqlCommand();
            var connection = new MySqlConnection(SzConnexao);

            command.CommandTimeout = 1000 * 60 * 2; // Vai esperar ate 2 min para fazer a inserçao 
            command.Connection = connection;
            MySqlBulkLoader bulk = new MySqlBulkLoader(connection)
            {
                TableName = "",
                FieldTerminator = ";",
                LineTerminator = "\n\r",
                FileName = aquivo,
                NumberOfLinesToSkip = 0
            };
            bulk.Load();

        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="expediente"></param>
        /// <returns></returns>
        private int CheckSaida(Expediente expediente)
        {
            TimeSpan saida;
            TimeSpan entrada;
            TimeSpan ht;
            DateTime hora;
            saida = Convert.ToDateTime(expediente.Saida).TimeOfDay;
            entrada = Convert.ToDateTime(expediente.Entrada).TimeOfDay;
            ht = entrada - saida;
            hora = DateTime.Now;
            hora = hora.Add(ht);
            if (hora.Day > DateTime.Now.Day)  // Se virar o dia, quer dizer que o func vai bater a saida no outro dia         
                expediente.DiaSemana++;
            return expediente.DiaSemana;
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

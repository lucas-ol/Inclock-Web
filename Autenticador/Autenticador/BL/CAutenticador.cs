using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using Classes.Common;
using Classes.VO;
using Newtonsoft.Json;

namespace Autenticador.BL
{
    public class CAutenticador : DataBase
    {
        public string Logar(string password, string login)
        {
            MySqlAdicionaParametro("login", login);
            MySqlAdicionaParametro("senha", password);
            return JsonConvert.SerializeObject(MySqlLeitura("select * from funcionarios where login = @login and senha = @senha", System.Data.CommandType.Text));
        }

        public string GetLogin(string Email)
        {
            MySqlAdicionaParametro("email", Email);
            return JsonConvert.SerializeObject(MySqlLeitura("select nome, email from funcionarios where email = @email", System.Data.CommandType.Text));
        }

        public string GetPassword(string Login)
        {
            MySqlAdicionaParametro("login", Login);
            return JsonConvert.SerializeObject(MySqlLeitura("select nome, email from funcionarios where login = @login", System.Data.CommandType.Text));
        }

        public string GetListUsers()
        {
            int totlinhas;
            MySqlAdicionaParametro("@_TotalLinhas", 0);
            MySqlAdicionaParametro("_nome", "");
            MySqlAdicionaParametro("_pagina", 0);
            MySqlAdicionaParametro("_quantidade", 0);
            return JsonConvert.SerializeObject(MySqlLeitura("prd_se_pessoas", System.Data.CommandType.StoredProcedure, out totlinhas));
        }
        public string GetCheckPointById(int id)
        {
            MySqlAdicionaParametro("id", id);
            return JsonConvert.SerializeObject(MySqlLeitura("select * from registro_pontos", System.Data.CommandType.Text));
        }

        public string GetCheckPoint(string InitialDate, string FinalDate)
        {
            MySqlAdicionaParametro("Inicial", InitialDate);
            MySqlAdicionaParametro("Final", FinalDate);
            return JsonConvert.SerializeObject(MySqlLeitura("", System.Data.CommandType.Text));
        }

        public string GetReportDateInterval(string InitialDate, string FinalDate)
        {
            MySqlAdicionaParametro("Inicial", InitialDate);
            MySqlAdicionaParametro("Final", FinalDate);
            return JsonConvert.SerializeObject(MySqlLeitura("", System.Data.CommandType.Text));
        }

        public string GetUserById(int id)
        {
            MySqlAdicionaParametro("_id", id);
            return JsonConvert.SerializeObject(MySqlLeitura("prd_se_pessoa_id", System.Data.CommandType.StoredProcedure), new JsonSerializerSettings() { Formatting = Formatting.None, DateFormatString = "dd/MM/yyyy" });

        }

        public string CheckPoint(Ponto ponto)
        {
            MySqlAdicionaParametro("ID", ponto.Id);
            MySqlAdicionaParametro("ID", ponto.Data);
            MySqlAdicionaParametro("ID", ponto.Funcionario);
            MySqlAdicionaParametro("ID", ponto.Hora);
            return JsonConvert.SerializeObject(MySqlLeitura("", System.Data.CommandType.Text), new JsonSerializerSettings() { Formatting = Formatting.Indented, DateFormatString = "dd/MM/yyyy", Culture = System.Globalization.CultureInfo.CurrentCulture });

        }
        public string GetExpediente(int semana,int funcionario_id)
        {
            MySqlAdicionaParametro("iSemana", semana);
            MySqlAdicionaParametro("iFuncionario", funcionario_id);
           
            return JsonConvert.SerializeObject(MySqlLeitura("prd_se_expediente_semana", System.Data.CommandType.StoredProcedure), new JsonSerializerSettings() { Formatting = Formatting.Indented, DateTimeZoneHandling = DateTimeZoneHandling.Local, Culture = System.Globalization.CultureInfo.CurrentCulture });
        }
    }
}

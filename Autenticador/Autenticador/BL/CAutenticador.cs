using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using Classes.Common;
using Classes.VO;
using Newtonsoft.Json;
using System.Data;

namespace Autenticador.BL
{
    public class CAutenticador : DataBase
    {
        public string Logar(string password, string login)
        {
            MySqlAdicionaParametro("_login", login);
            MySqlAdicionaParametro("_senha", password);
            DataRow tb = MySqlLeitura("prd_se_login", System.Data.CommandType.StoredProcedure).Select().FirstOrDefault();
            Funcionario func = null;
            if (tb != null)
            {
                if (tb[0].ToString() != "erro")
                    func = new Funcionario()
                    {
                        Id = Convert.ToInt32(tb["id"]),
                        Nome = tb["nome"].ToString(),
                        CPF = tb["cpf"].ToString(),
                        RG = tb["rg"].ToString(),
                        Telefone = tb["telefone"].ToString(),
                        Celular = tb["celular"].ToString(),
                        Email = tb["email"].ToString(),
                        Endereco = tb["enderece"].ToString(),
                        Numero = tb["numero"].ToString(),
                        cargo_id = Convert.ToInt32(tb["cargo_id"]),
                        Cargo = tb["cargo"].ToString(),
                        Nascimento = tb["nascimento"].ToString(),
                        Sexo = tb["sexo"].ToString(),
                        Cidade = tb["cidade"].ToString(),
                        Estado = tb["estado"].ToString(),
                        CEP = tb["cep"].ToString(),
                        Bairro = tb["bairro"].ToString(),
                        Roles = tb["role"].ToString()
                    };

                return JsonConvert.SerializeObject(func, Formatting.Indented);
            }
            else
            {
                return "erro:true";
            }

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
            return JsonConvert.SerializeObject(MySqlLeitura("", System.Data.CommandType.Text), new JsonSerializerSettings() { Formatting = Formatting.Indented, DateFormatString = "dd/MM/yyyy" });

        }
        public string GetExpediente(int semana, int funcionario_id)
        {
            MySqlAdicionaParametro("iSemana", semana);
            MySqlAdicionaParametro("iFuncionario", funcionario_id);
            return JsonConvert.SerializeObject(MySqlLeitura("prd_se_expediente_semana", System.Data.CommandType.StoredProcedure), new JsonSerializerSettings() { Formatting = Formatting.Indented, DateTimeZoneHandling = DateTimeZoneHandling.Local });
        }
    }
}

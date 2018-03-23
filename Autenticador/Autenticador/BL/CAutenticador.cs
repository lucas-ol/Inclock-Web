using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using Classes.Common;
using Classes.VO;
using Newtonsoft.Json;
using System.Data;
using System.Collections;

namespace Autenticador.BL
{
    public class CAutenticador : DataBase
    {
        public Classes.VO.Funcionario Logar(string password, string login)
        {
            MySqlAdicionaParametro("_login", login);
            MySqlAdicionaParametro("_senha", password);
            DataRow tb = MySqlLeitura("prd_se_login", System.Data.CommandType.StoredProcedure).Select().FirstOrDefault();
            Funcionario func = new Funcionario();
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
                        Endereco = tb["endereco"].ToString(),
                        Numero = tb["numero"].ToString(),
                        cargo_id = Convert.ToInt32(tb["cargo_id"]),
                        Cargo = tb["cargo"].ToString(),
                        Nascimento = Convert.ToDateTime(tb["nascimento"]).ToString("dd/MM/yyyy"),
                        Sexo = tb["sexo"].ToString(),
                        Cidade = tb["cidade"].ToString(),
                        Estado = tb["estado"].ToString(),
                        CEP = tb["cep"].ToString(),
                        Bairro = tb["bairro"].ToString(),
                        Senha ="123"
                    };
                foreach (var item in tb["role"].ToString().Split(new char[] { ';' }))
                    func.Roles.Add(item);
            }
            else
            {
                //   return "erro:true";
            }
            return func;
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

        public Funcionario GetUserById(int id)
        {
            MySqlAdicionaParametro("_id", id);
            DataRow tr = MySqlLeitura("prd_se_pessoa_id", System.Data.CommandType.StoredProcedure).Rows[0];
            Funcionario funcionario = null;
            if (tr != null)
            {
                if (tr[0].ToString() != "erro")
                {
                    funcionario = new Funcionario
                    {
                        Id = Convert.ToInt32(tr["id"]),
                        Nome = tr["nome"].ToString(),
                        CPF = tr["cpf"].ToString(),
                        RG = tr["rg"].ToString(),
                        Telefone = tr["telefone"].ToString(),
                        Celular = tr["celular"].ToString(),
                        Email = tr["email"].ToString(),
                        Endereco = tr["endereco"].ToString(),
                        Numero = tr["numero"].ToString(),
                        cargo_id = Convert.ToInt32(tr["cargo_id"]),
                        Cargo = tr["cargo"].ToString(),
                        Nascimento = Convert.ToDateTime(tr["nascimento"]).ToString("dd/MM/yyyy"),
                        Sexo = tr["sexo"].ToString(),
                        Cidade = tr["cidade"].ToString(),
                        Estado = tr["estado"].ToString(),
                        CEP = tr["cep"].ToString(),
                        Bairro = tr["bairro"].ToString(),
                        Login = tr["login"].ToString(),
                        Senha = tr["senha"].ToString(),
                    };
                    foreach (var item in tr["role"].ToString().Split(new char[] { ';' }))
                        funcionario.Roles.Add(item);
                }
            }

            return funcionario;

        }

        public string CheckPoint(Ponto ponto)
        {
            MySqlAdicionaParametro("ID", ponto.Id);
            MySqlAdicionaParametro("ID", ponto.Data);
            MySqlAdicionaParametro("ID", ponto.Funcionario);
            MySqlAdicionaParametro("ID", ponto.Hora);
            return JsonConvert.SerializeObject(MySqlLeitura("", System.Data.CommandType.Text), new JsonSerializerSettings() { Formatting = Formatting.Indented, DateFormatString = "dd/MM/yyyy" });

        }
        public List<Expediente> GetExpediente(int semana, int funcionario_id)
        {
            MySqlAdicionaParametro("iSemana", semana);
            MySqlAdicionaParametro("iFuncionario", funcionario_id);
            List<Expediente> ExpedienteList = new List<Expediente>();
            DataTable tb = MySqlLeitura("prd_se_expediente_semana", System.Data.CommandType.StoredProcedure);
            if (tb.TableName != "erro")
            {
                foreach (DataRow linha in tb.Rows)
                {
                    Expediente expediente = new Expediente
                    {
                        Id = Convert.ToInt32(linha["id"]),
                        Entrada = ((TimeSpan)linha["entrada"]).ToString(),
                        Saida = ((TimeSpan)linha["saida"]).ToString(),
                        Horas_Trabalho = ((TimeSpan)linha["horas_trabalho"]).ToString(),
                        Tempo_Pausa = ((TimeSpan)linha["tempo_pausa"]).ToString(),
                        DiaSemana = Convert.ToInt32(linha["diasemana"]),
                        Funcionario_id = Convert.ToInt32(linha["funcionario_id"]),
                        Periodo = Convert.ToInt32(linha["periodo"])
                    };
                    ExpedienteList.Add(expediente);
                }

            }
            return ExpedienteList;
        }
    }
}

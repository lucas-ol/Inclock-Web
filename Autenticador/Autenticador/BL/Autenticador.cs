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
using Classes.Enumeradores;

namespace Autenticador.BL
{
    public class Autenticador : DataBase
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
                        Senha = "123"
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
            DataTable tr = MySqlLeitura("prd_se_pessoa_id", System.Data.CommandType.StoredProcedure);
            Funcionario funcionario = null;
            if (tr.TableName != "erro" && tr.Rows.Count > 0)
            {
                funcionario = new Funcionario
                {
                    Id = Convert.ToInt32(tr.Rows[0]["id"]),
                    Nome = tr.Rows[0]["nome"].ToString(),
                    CPF = tr.Rows[0]["cpf"].ToString(),
                    RG = tr.Rows[0]["rg"].ToString(),
                    Telefone = tr.Rows[0]["telefone"].ToString(),
                    Celular = tr.Rows[0]["celular"].ToString(),
                    Email = tr.Rows[0]["email"].ToString(),
                    Endereco = tr.Rows[0]["endereco"].ToString(),
                    Numero = tr.Rows[0]["numero"].ToString(),
                    cargo_id = Convert.ToInt32(tr.Rows[0]["cargo_id"]),
                    Cargo = tr.Rows[0]["cargo"].ToString(),
                    Nascimento = Convert.ToDateTime(tr.Rows[0]["nascimento"]).ToString("dd/MM/yyyy"),
                    Sexo = tr.Rows[0]["sexo"].ToString(),
                    Cidade = tr.Rows[0]["cidade"].ToString(),
                    Estado = tr.Rows[0]["estado"].ToString(),
                    CEP = tr.Rows[0]["cep"].ToString(),
                    Bairro = tr.Rows[0]["bairro"].ToString(),
                    Login = tr.Rows[0]["login"].ToString(),
                    Senha = tr.Rows[0]["senha"].ToString(),
                };
                foreach (var item in tr.Rows[0]["role"].ToString().Split(new char[] { ';' }))
                    funcionario.Roles.Add(item);

            }

            return funcionario;

        }
        public List<Aviso> getAvisos(string qted)
        {
            List<Aviso> avisos = new List<Aviso>();
            string command = "select * from avisos order by data_noticia desc limit " + qted;
            var obj = MySqlLeitura(command, CommandType.Text);
            try
            {
                foreach (DataRow tr in obj.Rows)
                {
                    string str = tr["id"].ToString();
                    avisos.Add(new Aviso
                    {
                        ID = Convert.ToInt32(tr["id"]),
                        Titulo = tr["titulo"].ToString(),
                        Conteudo = tr["conteudo"].ToString(),
                        Imagem = tr["imagem"].ToString(),
                        DataNoticia = Convert.ToDateTime(tr["data_noticia"]).ToString("dd/MM/yyyy hh:mm")
                    });
                }
            }
            catch (Exception ex)
            {

                throw;
            }
            return avisos;
        }
    }
}

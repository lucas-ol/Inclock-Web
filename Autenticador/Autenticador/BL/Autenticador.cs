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
    public class Autenticador
    {
        public static Funcionario Logar(string password, string login, string dispositivo = "")
        {
            using (var db = new DataBase())
            {
                db.MySqlAdicionaParametro("_login", login);
                db.MySqlAdicionaParametro("_senha", password);
                var tbl = db.MySqlLeitura("prd_se_login", System.Data.CommandType.StoredProcedure);
                Funcionario func = new Funcionario();
                if (tbl.TableName != "erro")
                {
                    func = tbl.Select().Select(tb => new Funcionario()
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
                        Senha = "123",
                        Roles = tb["role"].ToString().Split(new char[] { ';' }).ToList()
                    }).FirstOrDefault();
                    if (ObeterSessao(func.Id, dispositivo).Id == 0)
                        SalvarSessao(func.Id, dispositivo);
                    else
                        func.Id = -1; // vai informar que o usuario ja esta logado 
                }
                else
                    throw new Exception("erro ao connectar com o banco" + tbl.Rows[0][0]);
                return func;
            }
        }

        public static string GetLogin(string Email)
        {
            using (var db = new DataBase())
            {
                db.MySqlAdicionaParametro("email", Email);
                return JsonConvert.SerializeObject(db.MySqlLeitura("select nome, email from funcionarios where email = @email", System.Data.CommandType.Text));
            }
        }

        public static string GetPassword(string Login)
        {
            using (var db = new DataBase())
            {
                db.MySqlAdicionaParametro("login", Login);
                return JsonConvert.SerializeObject(db.MySqlLeitura("select nome, email from funcionarios where login = @login", System.Data.CommandType.Text));
            }
        }
        public static Funcionario GetUserById(int id)
        {
            using (var db = new DataBase())
            {

                db.MySqlAdicionaParametro("_id", id);
                DataTable tr = db.MySqlLeitura("prd_se_pessoa_id", System.Data.CommandType.StoredProcedure);
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
        }
        public static List<Aviso> getAvisos(string qted, int index = 0)
        {
            using (var db = new DataBase())
            {
                List<Aviso> avisos = new List<Aviso>();
                string command = "select * from avisos where ativo order by data_noticia desc limit " + index + "," + qted;
                var obj = db.MySqlLeitura(command, CommandType.Text);
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
                catch
                {
                    return new List<Aviso>() { new Aviso() { Conteudo = "Estamos passando por problemas tecnicos", ID = 0, Imagem = "generic-erro.jpg" } };
                }
                return avisos;
            }
        }
        public static void SalvarSessao(int func, string dispositivo = "web")
        {
            using (var ctx = new DataBase())
            {
                ctx.MySqlAdicionaParametro("func", func);
                ctx.MySqlAdicionaParametro("disp", dispositivo);
                ctx.MySqlExecutaComando("insert into acessos(funcionario_id,logado,dispositivo) values (@func,1,@disp)", CommandType.Text);
            }
        }
        public static Acesso ObeterSessao(int func, string dispositivo = "web")
        {
            Acesso acesso = new Acesso();
            using (var ctx = new DataBase())
            {
                ctx.MySqlAdicionaParametro("func", func);
                ctx.MySqlAdicionaParametro("disp", dispositivo);
                var tb = ctx.MySqlLeitura("select * from acessos where funcionario_id = @func and dispositivo = @disp and logado order by data_login desc  limit 1", CommandType.Text);
                if (tb.TableName == "erro" && tb.Rows.Count > 0)
                {
                    acesso = tb.Select().Select(x => new Acesso
                    {
                        Id = Convert.ToInt32(x["id"]),
                        Logado = Convert.ToBoolean(x["logado"]),
                        Funcionario_id = Convert.ToInt32(x["funcionario_id"]),
                        DataLogin = Convert.ToDateTime(x["data_login"]),
                        Dispositivo = x["dispositivo"].ToString()
                    }).FirstOrDefault();
                }
                return acesso;
            }
        }
        public static void ApagarSessao(int func, string dispositivo = "web")
        {
            var session = ObeterSessao(func, dispositivo);
            if (session.Id != 0)
            {
                using (var ctx = new DataBase())
                {
                    ctx.MySqlAdicionaParametro("id", session.Id);
                    var tb = ctx.MySqlExecutaComando("update acessos set logado = 0 where id = @id", CommandType.Text);
                }
            }
        }
    }
}


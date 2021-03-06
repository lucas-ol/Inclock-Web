﻿
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;
using Classes;
using Classes.Common;
using Classes.VO;
using System.ServiceModel;

namespace Library.Inclock.web.br.BL
{
    public class Funcionarios
    {
        /// <summary>
        /// Metodo que vai buscar todos os cargos, ele vai retornar uma tabela com o id 1 caso de algum erro 
        /// </summary>
        /// <returns>DataTable</returns>
        public DataTable BuscaCargos()
        {
            using (var db = new DataBase())
            {
                DataTable TabelaCargos = new DataTable();
                TabelaCargos = db.MySqlLeitura("SELECT * FROM inclock.cargo order by descricao", CommandType.Text);
                //Verifica se o banco retornou alguma linha e verificar se não teve nem um tipo de erro 
                if (TabelaCargos.Rows.Count > 0 && TabelaCargos.TableName != "erro")
                    return TabelaCargos;
                else
                {
                    TabelaCargos = new DataTable();
                    TabelaCargos.Columns.Add("id");
                    TabelaCargos.Columns.Add("descricao");
                    TabelaCargos.NewRow();
                    TabelaCargos.Rows.Add(new object[] { 1, "cargo não adicionado" });
                    return TabelaCargos;
                }
            }
            throw new Exception("erro " + new Exception().Message); // lança uma excessao na pilha caso de algum erro, para nao  parar a execução do programa 
        }

        /// <summary>
        /// Metodo que vai inserir um funcionario novo e retorna um valor boleano e uma mensagem html
        /// </summary>
        /// <param name="funcionario">Classe funcionario</param>
        /// <returns></returns>
        public FeedBack Cadastrar_Funcionario(Funcionario funcionario)
        {
            using (var db = new DataBase())
            {
                FeedBack feedBack = new FeedBack();
                feedBack.Status = false;
                db.MySqlAdicionaParametro("_nome", funcionario.Nome);
                db.MySqlAdicionaParametro("_telefone", funcionario.Telefone);
                db.MySqlAdicionaParametro("_celular", funcionario.Celular);
                db.MySqlAdicionaParametro("_email", funcionario.Email);
                db.MySqlAdicionaParametro("_endereco", funcionario.Endereco);
                db.MySqlAdicionaParametro("_cpf", funcionario.CPF);
                db.MySqlAdicionaParametro("_fk_cargo", funcionario.cargo_id);
                db.MySqlAdicionaParametro("_nascimento", funcionario.Nascimento);
                db.MySqlAdicionaParametro("_sexo", funcionario.Sexo);
                db.MySqlAdicionaParametro("_cidade", funcionario.Cidade);
                db.MySqlAdicionaParametro("_estado", funcionario.Estado);
                db.MySqlAdicionaParametro("_cep", funcionario.CEP);
                db.MySqlAdicionaParametro("_numero", funcionario.Numero);
                db.MySqlAdicionaParametro("_bairro", funcionario.Bairro);
                db.MySqlAdicionaParametro("_rg", funcionario.RG);
                db.MySqlAdicionaParametro("_senha", funcionario.Senha);
                db.MySqlAdicionaParametro("_login", funcionario.Login);
                db.MySqlAdicionaParametro("_role", User.ConvertToRoleStr(funcionario.Roles));
                feedBack = db.MySqlExecutaComando("prd_insere_func", CommandType.StoredProcedure);

                string mensagem = "";
                if (feedBack.Mensagem.ToLower().Contains("cpf"))
                {
                    mensagem += "<strong>CPF</strong> ";
                }
                else if (feedBack.Mensagem.ToLower().Contains("rg"))
                {
                    mensagem += "<strong>RG</strong> ";
                }
                else if (feedBack.Mensagem.ToLower().Contains("login"))
                {
                    mensagem += "<strong>login</strong> ";
                }
                else if (feedBack.Mensagem.ToLower().Contains("email"))
                {
                    mensagem += "<strong>email</strong>";
                }
                feedBack.Mensagem = String.Format("Os campo {0} a já existe no banco ", mensagem);
                return feedBack;
            }
        }
        public FeedBack Altera_Funcionario(Funcionario funcionario)
        {
            using (var db = new DataBase())
            {
                FeedBack feedBack = new FeedBack();
                feedBack.Status = false;
                db.MySqlAdicionaParametro("_id", funcionario.Id);
                db.MySqlAdicionaParametro("_nome", funcionario.Nome);
                db.MySqlAdicionaParametro("_telefone", funcionario.Telefone);
                db.MySqlAdicionaParametro("_celular", funcionario.Celular);
                db.MySqlAdicionaParametro("_email", funcionario.Email);
                db.MySqlAdicionaParametro("_endereco", funcionario.Endereco);
                db.MySqlAdicionaParametro("_cpf", funcionario.CPF);
                db.MySqlAdicionaParametro("_fk_cargo", funcionario.cargo_id);
                db.MySqlAdicionaParametro("_nascimento", funcionario.Nascimento);
                db.MySqlAdicionaParametro("_sexo", funcionario.Sexo);
                db.MySqlAdicionaParametro("_cidade", funcionario.Cidade);
                db.MySqlAdicionaParametro("_estado", funcionario.Estado);
                db.MySqlAdicionaParametro("_cep", funcionario.CEP);
                db.MySqlAdicionaParametro("_numero", funcionario.Numero);
                db.MySqlAdicionaParametro("_bairro", funcionario.Bairro);
                db.MySqlAdicionaParametro("_rg", funcionario.RG);
                db.MySqlAdicionaParametro("_senha", funcionario.Senha);
                db.MySqlAdicionaParametro("_login", funcionario.Login);
                db.MySqlAdicionaParametro("_role", User.ConvertToRoleStr(funcionario.Roles));
                feedBack = db.MySqlExecutaComando("prd_update_func", CommandType.StoredProcedure);

                string mensagem = "";
                if (feedBack.Mensagem.ToLower().Contains("cpf"))
                {
                    mensagem += "<strong>CPF</strong> ";
                }
                else if (feedBack.Mensagem.ToLower().Contains("rg"))
                {
                    mensagem += "<strong>RG</strong> ";
                }
                else if (feedBack.Mensagem.ToLower().Contains("login"))
                {
                    mensagem += "<strong>login</strong> ";
                }
                else if (feedBack.Mensagem.ToLower().Contains("email"))
                {
                    mensagem += "<strong>email</strong>";
                }
                feedBack.Mensagem = String.Format("Os campo {0} a já existe no banco ", mensagem);
                return feedBack;
            }
        }
        /// <summary>
        /// Metodo que busca as pessoas pelo nome
        /// </summary>
        /// <param name="Nome">Nome a ser pesquisado</param>
        /// <param name="pagina">Numero da pagina</param>
        /// <param name="qtdeitens">Quantidade de itens a ser puxada</param>
        /// <param name="qtdeTotalItens">Quantidade toral de itens encontrado no banco</param>
        /// <returns></returns>
        public List<Funcionario> ListarPessoasPorNome(string Nome, int pagina, int qtdeitens, out int qtdeTotalItens)
        {
            using (var db = new DataBase())
            {
                qtdeTotalItens = 0;
                List<Funcionario> ListaFuncionario = new List<Funcionario>();
                db.MySqlAdicionaParametro("_nome", Nome);
                db.MySqlAdicionaParametro("_pagina", pagina);
                db.MySqlAdicionaParametro("_quantidade", qtdeitens);
                db.MySqlAdicionaParametro("@_TotalLinhas", 0);
                DataTable tb = db.MySqlLeitura("prd_se_pessoas", CommandType.StoredProcedure, out qtdeTotalItens);

                if (tb.TableName == "erro")
                    return ListaFuncionario;
                foreach (DataRow item in tb.Rows)
                {
                    Funcionario funcionario = new Funcionario();
                    ListaFuncionario.Add(new Funcionario()
                    {
                        Id = Convert.ToInt32(item["id"]),
                        Nome = Convert.ToString(item["nome"]),
                        Telefone = Convert.ToString(item["telefone"]),
                        Celular = Convert.ToString(item["celular"]),
                        Email = Convert.ToString(item["email"]),
                        CPF = Convert.ToString(item["cpf"]),
                        Cargo = Convert.ToString(item["cargo"]),
                        Nascimento = Convert.ToDateTime(item["nascimento"]).ToString("dd-MM-yyyy"),
                        Sexo = Convert.ToString(item["sexo"]).ToLower() == "m" ? "Masculino" : "Feminino",
                        RG = Convert.ToString(item["rg"])
                    });
                }
                return ListaFuncionario;
            }
        }
        /// <summary>
        /// lista todas as pesoas 
        /// </summary>
        /// <param name="strNome"></param>
        /// <returns></returns>
        public List<Funcionario> ListaPessoasNome(String strNome)
        {
            using (var db = new DataBase())
            {
                db.MySqlAdicionaParametro("_nome", strNome);
                DataTable dt = db.MySqlLeitura("prd_se_pessoas_expediente_nome", CommandType.StoredProcedure);
                List<Funcionario> user = new List<Funcionario>();
                if (dt.TableName == "erro")
                    return user;
                foreach (DataRow item in dt.Rows)
                {
                    user.Add(new Funcionario()
                    {
                        Id = Convert.ToInt32(item["id"]),
                        Nome = Convert.ToString(item["nome"]),
                        Cargo = Convert.ToString(item["cargo"]),
                        cargo_id = Convert.ToInt32(item["expediente"]),
                        CPF = Convert.ToString(item["cpf"]),
                        RG = Convert.ToString(item["rg"])
                    });
                }
                return user;
            }
        }
        public Funcionario Pesquisa_Funcionario_ID(int ID)
        {
            var func = new Funcionario();
            try
            {
                using (var client = new Client())
                {
                    func = client.Service.GetUserById(ID.ToString());
                }
                return func;
            }
            catch (Exception ex)
            {
                return func;
            }
        }
        public User GetUser(int id)
        {
            return Pesquisa_Funcionario_ID(id);
        }
        public static List<User> GetUserLogadosMobile()
        {
            List<User> us = new List<User>();
            using (var db = new DataBase())
            {
                DataTable dt = db.MySqlLeitura("select * from acessos a inner join funcionarios f  on f.id = a.funcionario_id where a.dispositivo = 'mob' and a.logado", CommandType.Text);
                if (dt.TableName != "erro" && dt.Rows.Count > 0)
                {
                    us.AddRange(dt.Select().Select(x => new User
                    {
                        Id = Convert.ToInt32(x["funcionario_id"]),
                        Nome = x["nome"].ToString()
                    }));
                }
            }
            return us;
        }
        public static void DesonnectarUsuarioMobile(int id)
        {
            using (var db = new DataBase())
            {
                DataTable dt = db.MySqlLeitura("update acessos set logado = 0 where funcionario_id = " + id, CommandType.Text);
            }
        }
    }
}

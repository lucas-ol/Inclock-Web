
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
    public class Funcionarios : DataBase
    {
        /// <summary>
        /// Metodo que vai buscar todos os cargos, ele vai retornar uma tabela com o id 1 caso de algum erro 
        /// </summary>
        /// <returns>DataTable</returns>
        public DataTable BuscaCargos()
        {
            DataTable TabelaCargos = new DataTable();
            TabelaCargos = MySqlLeitura("SELECT * FROM inclock.cargo order by descricao", CommandType.Text);
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
            throw new Exception("erro " + new Exception().Message); // lança uma excessao na pilha caso de algum erro, para nao  parar a execução do programa 
        }

        /// <summary>
        /// Metodo que vai inserir um funcionario novo e retorna um valor boleano e uma mensagem html
        /// </summary>
        /// <param name="funcionario">Classe funcionario</param>
        /// <returns></returns>
        public FeedBack Cadastrar_Funcionario(Funcionario funcionario)
        {
            FeedBack feedBack = new FeedBack();
            feedBack.Status = false;

            MySqlAdicionaParametro("_nome", funcionario.Nome);
            MySqlAdicionaParametro("_telefone", funcionario.Telefone);
            MySqlAdicionaParametro("_celular", funcionario.Celular);
            MySqlAdicionaParametro("_email", funcionario.Email);
            MySqlAdicionaParametro("_endereco", funcionario.Endereco);
            MySqlAdicionaParametro("_cpf", funcionario.CPF);
            MySqlAdicionaParametro("_fk_cargo", funcionario.cargo_id);
            MySqlAdicionaParametro("_nascimento", funcionario.Nascimento);
            MySqlAdicionaParametro("_sexo", funcionario.Sexo);
            MySqlAdicionaParametro("_cidade", funcionario.Cidade);
            MySqlAdicionaParametro("_estado", funcionario.Estado);
            MySqlAdicionaParametro("_cep", funcionario.CEP);
            MySqlAdicionaParametro("_numero", funcionario.Numero);
            MySqlAdicionaParametro("_bairro", funcionario.Bairro);
            MySqlAdicionaParametro("_rg", funcionario.RG);
            MySqlAdicionaParametro("_senha", funcionario.Senha);
            MySqlAdicionaParametro("_login", funcionario.Login);
            MySqlAdicionaParametro("_role", funcionario.Roles);
            feedBack = MySqlExecutaComando("prd_insere_func", CommandType.StoredProcedure);

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
            List<Funcionario> ListaFuncionario = new List<Funcionario>();
            MySqlAdicionaParametro("_nome", Nome);
            MySqlAdicionaParametro("_pagina", pagina);
            MySqlAdicionaParametro("_quantidade", qtdeitens);
            MySqlAdicionaParametro("@_TotalLinhas", 0);
            DataTable tb = MySqlLeitura("prd_se_pessoas", CommandType.StoredProcedure, out qtdeTotalItens);

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
        /// <summary>
        /// lista todas as pesoas 
        /// </summary>
        /// <param name="strNome"></param>
        /// <returns></returns>
        public List<Funcionario> ListaPessoasNome(String strNome)
        {
            MySqlAdicionaParametro("_nome", strNome);
            DataTable dt = MySqlLeitura("prd_se_pessoas_expediente_nome", CommandType.StoredProcedure);
            List<Funcionario> user = new List<Funcionario>();

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
        public Funcionario Pesquisa_Funcionario_ID(int ID)
        {
            Funcionario func = new Funcionario();
            try
            {

                Autenticador.AutenticadorClient Client = new Autenticador.AutenticadorClient();
                func = Client.GetUserById(ID.ToString());
                return func;
            }
            catch (Exception ex)
            {
                return func;
            }
        }
        public List<Role> GetRoles()
        {
            List<Role> RoleGroup = new List<Role>();

            DataTable tb = MySqlLeitura("select * from roles", CommandType.Text);
            foreach (DataRow linha in tb.Rows)
            {
                Role role = new Role
                {
                    Valor = linha["role"].ToString(),
                    Texto = linha["texto"].ToString()
                };
                RoleGroup.Add(role);
            }
            return RoleGroup;
        }
    }
}

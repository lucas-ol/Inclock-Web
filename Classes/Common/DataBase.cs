﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Classes.VO;
using MySql.Data.MySqlClient;

namespace Classes.Common
{
    public class DataBase
    {
        #region Propriedades      
        private string szConnexao;
        /// <summary>
        /// string de conexão com o Banco
        /// </summary>
        public string SzConnexao
        {
            get
            {
                return System.Configuration.ConfigurationManager.ConnectionStrings["sql"].ConnectionString;
            }
            private set { szConnexao = value; }
        }// = "server=localhost;user=root;password=root;database=inclock;port=3306;";

        /// <summary>
        /// Coleção de parametro Generica
        /// </summary>
        private MySqlParameterCollection ParameterCollection = new MySqlCommand().Parameters;
        #endregion
        #region Construtor
        public DataBase()
        {

        }
        public DataBase(string Endereco)
        {
            SzConnexao = Endereco;
        }
        #endregion
        #region Metodos 
        /// <summary>
        /// Metodo que vai zerar todos os parametros 
        /// </summary>
        private void MySqlZeraParametro()
        {
            ParameterCollection.Clear();
        }
        /// <summary>
        /// Metodo que vai adicionar os parametros a Coleção de parametros
        /// </summary>
        /// <param name="NomeParametro">Nome do parametro</param>
        /// <param name="ValorParametro">Valor do parametro</param>
        protected virtual void MySqlAdicionaParametro(string NomeParametro, object ValorParametro)
        {
            ParameterCollection.AddWithValue(NomeParametro, ValorParametro).Direction = NomeParametro.Contains("@") ? ParameterDirection.Output : ParameterDirection.Input;
            //  ParameterCollection.AddWithValue(NomeParametro, ValorParametro);
        }
        /// <summary>
        /// Metodo que faz qualquer tipo de leitura
        /// </summary>
        /// <param name="szCommand">Commando que vai ser enviado ao banco de dados</param>
        /// <param name="TypeCommand">Tipo de comando que vai ser enviado </param>
        /// <returns>Retorna uma tabela </returns>
        protected virtual DataTable MySqlLeitura(string szCommand, CommandType TypeCommand)
        {
            DataTable TabelaDeRetorno = new DataTable();
            MySqlCommand Command = new MySqlCommand();// Objeto de Commando 
            MySqlConnection Connection = new MySqlConnection(SzConnexao); // Objeto de connexão
            MySqlDataAdapter Adapter;
            // Configuração do objeto Command
            Command.Connection = Connection;
            Command.CommandType = TypeCommand;
            Command.CommandText = szCommand;
            // Laço de repetição que vai adicionar todos o parametros no objeto command
            foreach (MySqlParameter Parameter in ParameterCollection)
            {
                Command.Parameters.Add(Parameter);
            }
            // faz a conexão e executa o comando
            try
            {
                Connection.Open();
                Command.ExecuteScalar();
                Connection.Close();
                Adapter = new MySqlDataAdapter(Command);
                Adapter.Fill(TabelaDeRetorno);
            }
            catch (Exception ex)
            {
                //Tratamento da exeçao que vai retornar uma tabela com o erro
                TabelaDeRetorno.Rows.Add();
                TabelaDeRetorno.TableName = "erro";
                TabelaDeRetorno.Columns.Add("erro");
                TabelaDeRetorno.Rows[0][0] = "Deu Erro: " + ex.Message;

            }
            MySqlZeraParametro();// vai zerar a coleção de parametros
            return TabelaDeRetorno;
            throw new NotImplementedException();
        }
        /// <summary>
        /// Metodo que vai enviar qualquer tipo de comando para o banco
        /// </summary>
        /// <param name="szCommand">Commando que vai ser enviado ao banco de dados</param>
        /// <param name="TypeCommand">Tipo de comando que vai ser enviado</param>
        /// <returns>Retorna o numero de linhas afetadas</returns>
        protected virtual FeedBack MySqlExecutaComando(string szCommand, CommandType TypeCommand)
        {
            FeedBack feedBack = new FeedBack();
            MySqlCommand Command = new MySqlCommand();// Objeto de Commando 
            MySqlConnection Connection = new MySqlConnection(SzConnexao); // Objeto de connexão

            Command.Connection = Connection;
            Command.CommandType = TypeCommand;
            Command.CommandText = szCommand;
            foreach (MySqlParameter Parametro in ParameterCollection)
                Command.Parameters.AddWithValue(Parametro.ParameterName, Parametro.Value);
            try
            {
                Connection.Open();
                object obj = Command.ExecuteScalar();
                feedBack.Mensagem = Convert.ToString(obj);
                feedBack.Status = true;
                Connection.Close();
            }
            catch (Exception ex)
            {
                feedBack.Mensagem = ex.Message;
                feedBack.Status = false;
            }
            MySqlZeraParametro();
            return feedBack;
        }
        /// <summary>
        /// Sobre carga de Metodo que vai fazer um select e vai retornar algum valor junto
        /// Deve ser usado junto com o MysqlAdiciona parametro
        /// </summary>
        /// <param name="szCommand">Comando a ser enviado</param>
        /// <param name="TypeCommand">Tipo do comando</param>
        /// <param name="retorno">Parametro out que vai</param>
        /// <returns></returns>
        protected virtual DataTable MySqlLeitura(string szCommand, CommandType TypeCommand, out int retorno, string collumname = "_TotalLinhas")
        {
            DataTable TabelaDeRetorno = new DataTable();
            MySqlCommand Command = new MySqlCommand();// Objeto de Commando 
            MySqlConnection Connection = new MySqlConnection(SzConnexao); // Objeto de connexão
            MySqlDataAdapter Adapter;
            // Configuração do objeto Command
            Command.Connection = Connection;
            Command.CommandType = TypeCommand;
            Command.CommandText = szCommand;
            // Laço de repetição que vai adicionar todos o parametros no objeto command
            foreach (MySqlParameter Parameter in ParameterCollection)
            {
                Command.Parameters.Add(Parameter);
            }
            // faz a conexão e executa o comando
            try
            {
                Connection.Open();
                MySqlDataReader reader = Command.ExecuteReader();
                Connection.Close();
                Adapter = new MySqlDataAdapter(Command);
                Adapter.Fill(TabelaDeRetorno);
                retorno = reader.GetInt32(0);
            }
            catch (Exception ex)
            {
                //Tratamento da exeçao que vai retornar uma tabela com o erro
                TabelaDeRetorno.Rows.Add();
                TabelaDeRetorno.TableName = "erro";
                TabelaDeRetorno.Columns.Add("Mensagem");
                TabelaDeRetorno.Rows[0]["Mensagem"] = "Deu Erro: " + ex.Message;
                retorno = 0;
            }
            finally
            {
                Command.Dispose();
                Connection.Dispose();
            }
            MySqlZeraParametro();// vai zerar a coleção de parametros
            return TabelaDeRetorno;
            throw new NotImplementedException();
        }
        #endregion
    }

}

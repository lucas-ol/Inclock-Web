using Classes.Common;
using Classes.VO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;
namespace Library.Inclock.web.br.BL
{
    public class Login
    {
        /// <summary>
        /// Metodo que faz um login com senha e 
        /// </summary>
        /// <param name="user">Objeto User </param>
        /// <returns>Retorna um Json do usuario</returns>
        public string Logar(User user)
        {
            string FuncionarioJson;
            Autenticador.AutenticadorClient cliente = new Autenticador.AutenticadorClient();
            FuncionarioJson = cliente.Logar(user.Senha, user.Login);
            return FuncionarioJson;
        }
    }
}

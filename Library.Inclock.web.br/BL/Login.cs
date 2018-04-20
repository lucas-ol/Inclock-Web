using Classes.Common;
using Classes.VO;
using Classes.Common;
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
        public Funcionario Logar(User user)
        {
            Funcionario funcionario;
            var cliente = new Autenticador.ServiceClient();
            try
            {
                funcionario = cliente.Logar(user.Senha, user.Login);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return funcionario;
        }
        public Funcionario LoginForms(User user, string configPath)
        {
            try
            {
                var dici = Newtonsoft.Json.JsonConvert.DeserializeObject<List<Funcionario>>(UtilFile.FileStringReader(configPath));               
                return dici.Find(x => x.Senha == user.Senha && x.Login == user.Login);
            }
            catch (Exception)
            {
                return null;
            }

        }
    }
}

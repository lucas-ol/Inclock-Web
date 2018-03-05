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
        public Funcionario Logar(User user)
        {
            Funcionario funcionario = new Funcionario();



            Autenticador.AutenticadorClient cliente = new Autenticador.AutenticadorClient();
            string str = cliente.Logar(user.Senha, user.Login);
            if (!str.Contains("erro"))
            {
                 funcionario = JsonConvert.DeserializeObject<List<Funcionario>>(str).FirstOrDefault();
               
            }
            else
                funcionario = null;

            return funcionario;
        }
    }
}

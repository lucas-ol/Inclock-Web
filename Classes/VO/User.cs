using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Classes.VO
{
    public class User
    {
        public string Nome { get; set; }

        private string login;
        /// <summary>
        /// Encapsulamento do login
        /// </summary>
        public string Login
        {
            get { return login; }
            set { login = value; }
        }
        private string senha;
        //Encapsulamento da senha 
        public string Senha
        {
            get { return senha; }
            set { senha = value; }
        }
    }
}

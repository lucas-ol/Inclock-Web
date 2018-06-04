using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Classes.VO
{
    /// <summary>
    /// 17 Propriedades
    /// </summary>
    public class Funcionario : User
    {
        public string CPF { get; set; }
        public string RG { get; set; }
        public string Telefone { get; set; }
        public string Celular { get; set; }
        public string Email { get; set; }
        public string Endereco { get; set; }
        public string Numero { get; set; }
        public int cargo_id { get; set; }
        public string Cargo { get; set; }
        public string Nascimento { get; set; }
        public string Sexo { get; set; }
        public string Cidade { get; set; }
        public string Estado { get; set; }
        public string CEP { get; set; }
        public string Bairro { get; set; }
        
        public Funcionario()
        {
            //Preenchimento dos campos opicionais
            Bairro = "";
        }

    }
}
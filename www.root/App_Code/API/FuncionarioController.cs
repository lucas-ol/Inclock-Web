using Classes.VO;
using Library.Inclock.web.br.BL;
using Library.Inclock.web.br.BL.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

public class FuncionarioController : ApiController
{
    // GET api/<controller>
    [HttpGet()]
    [AcceptVerbs("GET")]
    public int GetUsuarioLogado()
    {
        return Autenticador.CurrentUser.Id;
    }
    [HttpGet()]
    [AcceptVerbs("GET")]
    [Authorize(Roles = "*")]
    [AllowAnonymous]
    public IEnumerable<User> Get(string nome)
    {
        return new Funcionarios().ListaPessoasNome(nome).Take(5);
    }

}

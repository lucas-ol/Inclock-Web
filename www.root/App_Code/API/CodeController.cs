using Library.Inclock.web.br.BL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
[Authorize]
public class CodeController : ApiController
{
    [HttpGet]
    [AllowAnonymous]
    [Authorize(Users = "*", Roles = "*")]
    public string Get()
    {
        return QrCode.GetNewCode();
    }
    
    [AllowAnonymous]
    [Authorize(Users = "*", Roles = "*")]
    public bool Get(string code)
    {
        if (string.IsNullOrEmpty(code))
            return false;

        return QrCode.CheckCode(code);
    }

    // POST api/<controller>

}

using Library.Inclock.web.br.BL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

public class CodeController : ApiController
{
    [HttpGet]
    public string Get()
    {
        return QrCode.GetNewCode();
    }
   
    // GET api/<controller>/5
    public string Get(string code)
    {
        if (string.IsNullOrEmpty(code))
            return code;

        return QrCode.CheckCode(code) ? QrCode.GetNewCode() : code;
    }

    // POST api/<controller>
   
}

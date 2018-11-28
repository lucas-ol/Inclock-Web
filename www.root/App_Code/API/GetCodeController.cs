using Library.Inclock.web.br.BL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

public class GetCodeController : ApiController
{
    // GET api/<controller>/5
    public string Get()
    {
        return QrCode.GetNewCode();
    }
    public string CheckCode(string code)
    {
        return QrCode.CheckCode(code)?  QrCode.GetNewCode(): code;
    }
}

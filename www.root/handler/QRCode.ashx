<%@ WebHandler Language="C#" Class="QRCode" %>

using System;
using System.Web;
using Classes.Common;
public class QRCode : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        string rr = context.Request.QueryString[0];
        CriaQr QrCode = new CriaQr();
        context.Response.BinaryWrite(QrCode.ConverteImagemByte(QrCode.GeraImagem(rr)));
        context.Response.End();
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}
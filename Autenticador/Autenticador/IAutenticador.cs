﻿using Classes.VO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace Autenticador
{
    [ServiceContract]
    public interface IAutenticador
    {
        [OperationContract]
        [WebGet(ResponseFormat = WebMessageFormat.Json, RequestFormat = WebMessageFormat.Json
            , UriTemplate = "logar/{password}/{login}")]
        Funcionario Logar(string password, string login);

        [OperationContract]
        [WebGet(ResponseFormat = WebMessageFormat.Json, RequestFormat = WebMessageFormat.Json)]
        string GetLogin(string Email);

        [OperationContract]
        [WebInvoke(ResponseFormat = WebMessageFormat.Json, RequestFormat = WebMessageFormat.Json,
            Method = "GET",
            UriTemplate = "GetPassword/{Login}"
            )]
        string GetPassword(string Login);

        [OperationContract]
        [WebGet(ResponseFormat = WebMessageFormat.Json, RequestFormat = WebMessageFormat.Json)]
        string GetCheckPointDateInterval(string InitialDate, string FinalDate);

        [OperationContract]
        [WebGet(ResponseFormat = WebMessageFormat.Json, RequestFormat = WebMessageFormat.Json)]
        string GetCheckPointByDate(string InitialDate, string FinalDate, string id_funcionario);

        [OperationContract]
        [WebGet(ResponseFormat = WebMessageFormat.Json, RequestFormat = WebMessageFormat.Json)]
        string GetCheckPointById(int id);

        [OperationContract]
        [WebGet(ResponseFormat = WebMessageFormat.Json, RequestFormat = WebMessageFormat.Json,
            BodyStyle = WebMessageBodyStyle.Bare,
            UriTemplate ="getuser/{id}")]
        Funcionario GetUserById(string id);       

        [OperationContract]
        [WebInvoke(ResponseFormat = WebMessageFormat.Json, RequestFormat = WebMessageFormat.Json ,Method ="POST")]
        string CheckPoint(Ponto ponto);

        [WebInvoke(ResponseFormat = WebMessageFormat.Json, RequestFormat = WebMessageFormat.Json, Method = "GET",
           UriTemplate = "getexpediente/{semana}/{funcionario_Id}")]
        List<Expediente> GetExpediente(string semana, string funcionario_Id);
    }
}

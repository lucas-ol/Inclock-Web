﻿using Classes.VO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using System.Threading.Tasks;

namespace Autenticador
{
    [ServiceContract]
    public interface IService
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
            UriTemplate = "GetPassword/{Login}")]
        string GetPassword(string Login);

        
        [OperationContract]
        [WebGet(ResponseFormat = WebMessageFormat.Json, RequestFormat = WebMessageFormat.Json,
            BodyStyle = WebMessageBodyStyle.Bare,
            UriTemplate = "getuser/{id}")]
        Funcionario GetUserById(string id);

        [OperationContract]
        [WebInvoke(ResponseFormat = WebMessageFormat.Json, RequestFormat = WebMessageFormat.Json, Method = "POST",UriTemplate = "checkin/{funcionario}/{type}")]
        FeedBack CheckPoint(string funcionario, string type);

        [OperationContract]
        [WebInvoke(ResponseFormat = WebMessageFormat.Json, RequestFormat = WebMessageFormat.Json, Method = "GET",
           UriTemplate = "getexpediente/{semana}/{funcionario_Id}")]
        List<Expediente> GetExpediente(string semana, string funcionario_Id);


        [OperationContract]
        [WebGet(ResponseFormat = WebMessageFormat.Json, RequestFormat = WebMessageFormat.Json, UriTemplate = "getaviso/{qtde}")]
        List<Aviso> GetAvisos(string qtde);

        [OperationContract]
        [WebGet(ResponseFormat = WebMessageFormat.Json, RequestFormat = WebMessageFormat.Json, UriTemplate = "getpoint/{month}/{funcionario}")]
        List<EspelhoPonto> GetCheckPoint(string month, string funcionario);

        [OperationContract]
        [WebGet(ResponseFormat = WebMessageFormat.Json, RequestFormat = WebMessageFormat.Json, UriTemplate = "getpoint/{InitialDate}/{FinalDate}/{id_funcionario}")]
        List<EspelhoPonto> GetCheckPointByDate(string InitialDate, string FinalDate, string id_funcionario);

        [OperationContract]
        [WebGet(ResponseFormat = WebMessageFormat.Json, RequestFormat = WebMessageFormat.Json)]
        List<EspelhoPonto> GetCheckPointDateInterval(string InitialDate, string FinalDate, string id_funcionario);

        [OperationContract]
        [WebGet(ResponseFormat = WebMessageFormat.Json, RequestFormat = WebMessageFormat.Json, UriTemplate = "getpoint/{id}")]
        Ponto GetCheckPointById(string id);

        
        [OperationContract]
        [WebGet(ResponseFormat = WebMessageFormat.Json, RequestFormat = WebMessageFormat.Json, UriTemplate = "periodo/{hora}")]
        int ConvertePeriodo(string hora);

        /*Expediente*/
        [OperationContract]
        [WebInvoke(Method = "DELETE", ResponseFormat = WebMessageFormat.Json, RequestFormat = WebMessageFormat.Json)]
        FeedBack ExcluitExpediente(int id);

        [OperationContract]
        [WebInvoke(Method = "PUT", ResponseFormat = WebMessageFormat.Json, RequestFormat = WebMessageFormat.Json)]
        FeedBack AlteraExpediente(Expediente exp);

    }
}

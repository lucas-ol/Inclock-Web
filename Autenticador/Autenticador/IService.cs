using Classes.VO;
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
        [WebInvoke(Method = "OPTIONS", UriTemplate = "*")]
        void GetOptions();

        [WebGet(ResponseFormat = WebMessageFormat.Json, RequestFormat = WebMessageFormat.Json
            , UriTemplate = "logar/{password}/{login}/{dispositivo}")]
        [OperationContract]
        Funcionario Logar(string password, string login, string dispositivo);

        [OperationContract]
        [WebInvoke(ResponseFormat = WebMessageFormat.Json, RequestFormat = WebMessageFormat.Json, Method = "PUT", BodyStyle = WebMessageBodyStyle.Wrapped)]
        void ApagarSessao(int func, string dispositivo);

        [OperationContract]
        [WebGet(ResponseFormat = WebMessageFormat.Json, RequestFormat = WebMessageFormat.Json ,UriTemplate = "sendaccount/{Email}")]
        FeedBack SendAccount(string Email);

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
        [WebInvoke(ResponseFormat = WebMessageFormat.Json, RequestFormat = WebMessageFormat.Json, Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped)]
        FeedBack CheckPoint(string funcionario, string type, string code);

        [OperationContract]
        [WebGet(ResponseFormat = WebMessageFormat.Json, RequestFormat = WebMessageFormat.Json,
           UriTemplate = "getexpediente/{semana}/{funcionario_Id}",BodyStyle = WebMessageBodyStyle.Bare)]
        List<Expediente> GetExpediente(string semana, string funcionario_Id);

        [OperationContract]
        [WebInvoke(Method ="GET", RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json,UriTemplate = "getavisos/{qtde}/{index}",BodyStyle = WebMessageBodyStyle.Wrapped)]
        List<Aviso> GetAvisos(string qtde, string index);

        [OperationContract]
        [WebGet(ResponseFormat = WebMessageFormat.Json, RequestFormat = WebMessageFormat.Json, UriTemplate = "getpoint/{InitialDate}/{FinalDate}/{funcionario}")]
        List<Ponto> GetCheckPointDateInterval(string InitialDate, string FinalDate, string funcionario);              

        [OperationContract]
        [WebGet(ResponseFormat = WebMessageFormat.Json, RequestFormat = WebMessageFormat.Json, UriTemplate = "basicinformation/{InitialDate}/{FinalDate}/{funcionario}")]
        BL.CheckPoint.BasicInformations GetBasicInformations(string InitialDate, string FinalDate, string funcionario);

        [OperationContract]
        [WebGet(ResponseFormat = WebMessageFormat.Json, RequestFormat = WebMessageFormat.Json, UriTemplate = "getpoint/{id}")]
        Ponto GetCheckPointById(string id);

        [OperationContract]
        [WebGet(ResponseFormat = WebMessageFormat.Json, RequestFormat = WebMessageFormat.Json, UriTemplate = "periodo/{hora}")]
        int ConvertePeriodo(string hora);

        /*Expediente*/
        [OperationContract]
        [WebInvoke(Method = "DELETE", ResponseFormat = WebMessageFormat.Json, RequestFormat = WebMessageFormat.Json)]
        FeedBack ExcluirExpediente(int id);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json, RequestFormat = WebMessageFormat.Json)]
        FeedBack CadastrarExpediente(Expediente exp);

    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.ServiceModel;
using System.ServiceModel.Channels;
using System.ServiceModel.Description;
using System.ServiceModel.Dispatcher;
using System.ServiceModel.Web;
using System.Text;
using System.Threading.Tasks;

namespace Library.Inclock.web.br.BL
{
    class CustomEndpoint : IEndpointBehavior
    {
        public IEnumerable<KeyValuePair<string, string>> Headers { get; set; } = new List<KeyValuePair<string, string>>();
        public void AddBindingParameters(ServiceEndpoint endpoint, BindingParameterCollection bindingParameters)
        {

        }

        public void ApplyClientBehavior(ServiceEndpoint endpoint, ClientRuntime clientRuntime)
        {
            clientRuntime.ClientMessageInspectors.Add(new ClientInspector(Headers));
        }

        public void ApplyDispatchBehavior(ServiceEndpoint endpoint, EndpointDispatcher endpointDispatcher)
        {
           
        }

        public void Validate(ServiceEndpoint endpoint)
        {

        }
        class ClientInspector : IClientMessageInspector
        {
            public IEnumerable<KeyValuePair<string, string>> Headers { get; set; } = new List<KeyValuePair<string, string>>();
            public ClientInspector(IEnumerable<KeyValuePair<string, string>> header)
            {
                Headers = header;
            }
            public void AfterReceiveReply(ref Message reply, object correlationState)
            {

            }

            public object BeforeSendRequest(ref Message request, IClientChannel channel)
            {
                HttpRequestMessageProperty httpRequestMessage;
                if (request.Properties.TryGetValue(HttpRequestMessageProperty.Name, out object httpRequestMessageObject))
                {
                    httpRequestMessage = httpRequestMessageObject as HttpRequestMessageProperty;
                    foreach (var item in Headers)
                        if (string.IsNullOrEmpty(httpRequestMessage.Headers[item.Key]))
                            httpRequestMessage.Headers[item.Key] = item.Value;
                }
                return null;
            }
        }
    }

}

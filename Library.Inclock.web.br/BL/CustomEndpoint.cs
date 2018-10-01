using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel;
using System.ServiceModel.Channels;
using System.ServiceModel.Description;
using System.ServiceModel.Dispatcher;
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
            throw new NotImplementedException();
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
                HttpRequestMessageProperty property = new HttpRequestMessageProperty();
                property.Headers.Add("integra", "kiko");
                request.Properties.Add("header", property);

                foreach (var item in Headers)
                    request.Headers.Add(MessageHeader.CreateHeader(item.Key, "urn:thejoyofcode-com:services:activity-header:2006-11", item.Value)); //     property.Headers[item.Key] = item.Value;
                 
            //    request.Properties.Add(HttpRequestMessageProperty.Name, property);
                return null;
            }
        }
    }

}

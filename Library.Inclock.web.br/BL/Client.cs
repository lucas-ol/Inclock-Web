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
    public class Client : IDisposable
    {
        public Autenticador.ServiceClient Service { get; private set; }
        private bool disposed = false;
        public bool Disposed
        {
            get { return disposed; }
            set
            {
                if (!disposed)
                    disposed = value;
            }
        }

        public Client()
        {
            Service = new Autenticador.ServiceClient();
            Service.OnSendingRequest 
        }
        public Client(IEnumerable<KeyValuePair<string, string>> headers)
        {
            Service = new Autenticador.ServiceClient();
            Service.Endpoint.EndpointBehaviors.Add(new CustomEndpoint { Headers = headers });

        }
        public void Dispose()
        {
            GC.SuppressFinalize(Service);
            GC.SuppressFinalize(this);
            disposed = true;
        }
    }
}

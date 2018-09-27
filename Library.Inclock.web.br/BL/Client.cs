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
    public class Client : IDisposable, IClientMessageInspector
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
        private void Create()
        {
            Service = new Autenticador.ServiceClient();
        }
        private void Create(string aut)
        {
            Create();
            EndpointAddressBuilder addressBuilder = new EndpointAddressBuilder(Service.Endpoint.Address);
            addressBuilder.Headers.Add(AddressHeader.CreateAddressHeader("integracao", "", aut));
            var header = MessageHeader.CreateHeader("integracao", "integracao", aut);
            Service.Endpoint.Address = addressBuilder.ToEndpointAddress();
        }
        public Client()
        {
            Create();
        }
        public Client(string chave)
        {
            Create(chave);
        }
        public void Dispose()
        {
            GC.SuppressFinalize(Service);
            GC.SuppressFinalize(this);
            disposed = true;
        }

        public object BeforeSendRequest(ref Message request, IClientChannel channel)
        {
            throw new NotImplementedException();
        }

        public void AfterReceiveReply(ref Message reply, object correlationState)
        {
            throw new NotImplementedException();
        }
    }
}

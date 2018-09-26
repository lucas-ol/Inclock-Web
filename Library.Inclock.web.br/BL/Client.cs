using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel;
using System.ServiceModel.Channels;
using System.ServiceModel.Description;
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
        private void Create()
        {
            Service = new Autenticador.ServiceClient();
        }
        private void Create(string aut)
        {
            EndpointAddressBuilder addressBuilder = new EndpointAddressBuilder(Service.Endpoint.Address);
            addressBuilder.Headers.Add(AddressHeader.CreateAddressHeader("integracao", string.Empty, aut));
            Service.Endpoint.Address = addressBuilder.ToEndpointAddress();
            Service = new Autenticador.ServiceClient();
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

    }
}

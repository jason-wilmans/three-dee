using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PortabilityLayer.ServiceRegistry
{
    class ServiceLocator : IServiceLocator
    {
        public T GetServiceInstance<T>()
        {
            throw new NotImplementedException();
        }
    }
}

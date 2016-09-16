using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PortabilityLayer.IO;

namespace PortabilityLayer.ServiceRegistry
{
    class ServiceLocator : IServiceLocator
    {
        public T GetServiceInstance<T>() where T : class

        {
            var typeName = typeof (T).Name;
            switch (typeName)
            {
                case nameof(IFileAccess):
                    return new FileAccess() as T;
                    
                default:
                    throw new ArgumentException($"No service compatible to '{typeName}' registered.", nameof(T));
            }
        }
    }
}

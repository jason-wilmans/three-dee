using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PortabilityLayer.ServiceRegistry
{
    public interface IServiceLocator
    {
        /// <summary>
        /// 
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <returns></returns>
        /// <exception cref="UnknownServiceException"></exception>
        T GetServiceInstance<T>() where T : class;
    }
}

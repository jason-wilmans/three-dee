namespace PortabilityLayer.ServiceRegistry
{
    public interface IServiceLocator
    {
        void RegisterImplementation<TInterfaceType, TImplementorType>
            (ServiceLocator.InstantiationStrategy strategy = ServiceLocator.InstantiationStrategy.InstancePerRequest)
            where TImplementorType : TInterfaceType;

        void RegisterInstance<T>(T serviceInstance);

        /// <summary>
        /// 
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <returns></returns>
        /// <exception cref="UnknownServiceException"></exception>
        T GetInstance<T>() where T : class;
    }
}
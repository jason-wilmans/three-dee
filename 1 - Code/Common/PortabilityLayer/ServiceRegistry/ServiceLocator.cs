using System;
using Microsoft.Practices.Unity;

namespace PortabilityLayer.ServiceRegistry
{
    public class ServiceLocator : IServiceLocator
    {
        public enum InstantiationStrategy
        {
            Singleton,
            InstancePerRequest
        }

        private readonly UnityContainer Container = new UnityContainer();

        public T GetInstance<T>() where T : class

        {
            return Container.Resolve<T>();
        }

        public void RegisterImplementation<TInterfaceType, TImplementorType>
            (InstantiationStrategy strategy = InstantiationStrategy.InstancePerRequest)
            where TImplementorType : TInterfaceType
        {
            LifetimeManager lifetimeManager;
            switch (strategy)
            {
                case InstantiationStrategy.Singleton:
                    lifetimeManager = new ContainerControlledLifetimeManager();
                    break;
                case InstantiationStrategy.InstancePerRequest:
                    lifetimeManager = new TransientLifetimeManager();
                    break;
                default:
                    throw new ArgumentException($"Unknown strategy: {strategy}", nameof(strategy));
            }

            Container.RegisterType<TInterfaceType, TImplementorType>(lifetimeManager);
        }

        public void RegisterInstance<T>(T serviceInstance)
        {
            Container.RegisterInstance(serviceInstance, new ContainerControlledLifetimeManager());
        }
    }
}

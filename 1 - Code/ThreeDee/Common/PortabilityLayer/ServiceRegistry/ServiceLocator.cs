using System;
using Microsoft.Practices.Unity;

namespace PortabilityLayer.ServiceRegistry
{
    public static class ServiceLocator
    {
        public enum InstantiationStrategy
        {
            Singleton,
            InstancePerRequest
        }

        private static readonly UnityContainer Container = new UnityContainer();

        public static T GetServiceInstance<T>() where T : class

        {
            return Container.Resolve<T>();
        }

        public static void RegisterServiceImplementation<TInterfaceType, TImplementorType>
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

        public static void RegisterInstance(object serviceInstance)
        {
            Container.RegisterInstance(serviceInstance);
        }
    }
}

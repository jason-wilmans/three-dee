using Autofac;
using CoreFacade.Implementation;
using DiagramLogic.Implementation;
using DiagramLogic.Interface;

namespace CoreFacade.Interface
{
    /// <summary>
    /// The only retrieval point for instances of the application core and related services.
    /// </summary>
    public static class ThreeDeeCoreFactory
    {
        private static IContainer _container;

        public static IThreeDeeCore GetProductionCore()
        {
            BuildContainer();
            return _container.Resolve<IThreeDeeCore>();
        }

        private static void BuildContainer()
        {
            if (_container == null)
            {
                var builder = new ContainerBuilder();

                builder.RegisterType<DiagramComponent>().As<IDiagramComponent>()
                    .InstancePerLifetimeScope();

                builder.RegisterType<ThreeDeeCoreFacade>().As<IThreeDeeCore>()
                    .InstancePerLifetimeScope();

                _container = builder.Build();
            }
        }
    }
}

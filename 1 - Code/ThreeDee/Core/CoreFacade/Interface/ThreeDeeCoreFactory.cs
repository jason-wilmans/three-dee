using CoreFacade.Implementation;
using DiagramLogic.Implementation;
using PortabilityLayer.IO;
using PortabilityLayer.ServiceRegistry;

namespace CoreFacade.Interface
{
    /// <summary>
    /// The only retrieval point for instances of the application core and related services.
    /// </summary>
    public static class ThreeDeeCoreFactory
    {
        private static bool Initialized;

        public static IThreeDeeCore GetProductionCore()
        {
            if (!Initialized)
            {
                ServiceLocator.RegisterServiceImplementation<IFileAccess, FileAccess>();
                Initialized = true;
            }

            return new ThreeDeeCoreFacade(new DiagramComponent(ServiceLocator.GetServiceInstance<IFileAccess>()));
        }
    }
}

using CoreFacade.Implementation;
using DiagramLogic.Implementation;
using DiagramLogic.Interface;
using PortabilityLayer.ServiceRegistry;

namespace CoreFacade.Interface
{
    /// <summary>
    /// The only retrieval point for instances of the application core and related services.
    /// </summary>
    public static class ThreeDeeCoreFactory
    {
        private static IServiceLocator _serviceLocator;

        public static IThreeDeeCore GetProductionCore()
        {
            if (_serviceLocator == null)
            {
                _serviceLocator = new ServiceLocator();
            }

            return new ThreeDeeCoreFacade(new DiagramComponent(_serviceLocator));
        }
    }
}

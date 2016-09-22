using PortabilityLayer.ServiceRegistry;
using UI.Resources;

namespace UI.Utilities
{
    public static class UIServices
    {
        public static IServiceLocator Locator => GetLocator();

        private static IServiceLocator _locator;

        private static IServiceLocator GetLocator()
        {
            if (_locator == null)
            {
                InitializeServices();
            }

            return _locator;
        }

        private static void InitializeServices()
        {
            _locator = new ServiceLocator();
            _locator.RegisterImplementation<IResourceProvider, ResourceProvider>();
        }
    }
}

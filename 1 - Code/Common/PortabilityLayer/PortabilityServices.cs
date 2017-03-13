using PortabilityLayer.IO;
using PortabilityLayer.ServiceRegistry;

namespace PortabilityLayer
{
    public static class PortabilityServices
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
            _locator.RegisterImplementation<IFileAccess, FileAccess>();
        }
    }
}

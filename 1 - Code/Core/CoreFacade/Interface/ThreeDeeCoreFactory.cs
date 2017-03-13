using CoreFacade.Implementation;
using DiagramLogic.Implementation;
using PortabilityLayer;
using PortabilityLayer.IO;

namespace CoreFacade.Interface
{
    /// <summary>
    /// The only retrieval point for instances of the application core and related services.
    /// </summary>
    public static class ThreeDeeCoreFactory
    {
        private static IThreeDeeCore _singleton;

        public static IThreeDeeCore GetProductionCore()
        {
            if (_singleton == null)
            {
                _singleton = new ThreeDeeCoreFacade(new DiagramComponent(PortabilityServices.Locator.GetInstance<IFileAccess>()));
            }

            return _singleton;
        }
    }
}

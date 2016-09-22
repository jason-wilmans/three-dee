using PortabilityLayer.ServiceRegistry;
using SiliconStudio.Core;
using SiliconStudio.Xenko.Engine;
using UI.Resources;

namespace UI.Utilities
{
    [DataContract]
    public class GUISystemInitializer : StartupScript
    {
        private Entity _uiEntity;

        public override void Start()
        {
            base.Start();

            ServiceLocator.RegisterServiceImplementation<IResourceProvider, ResourceProvider>();

            IResourceProvider resources = ServiceLocator.GetServiceInstance<IResourceProvider>();
            _uiEntity = resources.GetUiEntity();
        }
    }
}

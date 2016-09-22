using PortabilityLayer.ServiceRegistry;
using SiliconStudio.Core;
using SiliconStudio.Core.Mathematics;
using SiliconStudio.Xenko.Engine;
using SiliconStudio.Xenko.Physics;
using ThreeDeeUi.UI.Screens;
using UI.Resources;
using UI3D;

namespace UI.Utilities
{
    [DataContract]
    public class GUISystemInitializer : StartupScript
    {
        public override void Start()
        {
            base.Start();

            InitializeServiceLocator();
            InitializeEventSystem();
            InitializeUiComponents();
        }

        private static void InitializeServiceLocator()
        {
            ServiceLocator.RegisterServiceImplementation<IResourceProvider, ResourceProvider>();
        }

        private void InitializeEventSystem()
        {
            /* The event system needs a rigidbody to execute raycasts.
             * So we create one, ensuring that it doesn't interfere with the scene's actual physics in any way. */
            var rigidBody = Entity.GetOrCreate<RigidbodyComponent>();
            rigidBody.IsKinematic = true;
            rigidBody.OverrideGravity = true;
            rigidBody.Mass = 0;
            rigidBody.ProcessCollisions = false;
            rigidBody.ColliderShape = new BoxColliderShape(Vector3.Zero);

            Entity.GetOrCreate<Ui3DEventSystemComponent>();
        }

        private void InitializeUiComponents()
        {
            Entity.GetOrCreate<ScreenManagerComponent>();
        }
    }
}

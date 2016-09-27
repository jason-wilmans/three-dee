using System;
using CoreFacade.Interface;
using DiagramLogic.Interface;
using SiliconStudio.Core;
using SiliconStudio.Core.Mathematics;
using SiliconStudio.Xenko.Engine;
using SiliconStudio.Xenko.Physics;
using UI.Diagrams;
using UI.Screens;
using UI.Ui3D;

namespace UI.Utilities
{
    [DataContract]
    public class GUISystemInitializer : StartupScript
    {
        private Entity _diagramView;

        public override void Start()
        {
            base.Start();

            ThreeDeeCoreFactory.GetProductionCore().DiagramChanged += OnDiagramChanged;

            InitializeServiceLocator();
            InitializeEventSystem();
            InitializeUiComponents();
        }

        private void OnDiagramChanged(IDiagram diagram)
        {
            if (_diagramView != null)
            {
                SceneSystem.SceneInstance.Scene.Entities.Remove(_diagramView);
            }

            if (diagram != null)
            {
                _diagramView = new Entity("DiagramView");
                _diagramView.GetOrCreate<DiagramView3D>();
                SceneSystem.SceneInstance.Scene.Entities.Add(_diagramView);
            }
        }

        private void InitializeServiceLocator()
        {
            UIServices.Locator.RegisterInstance(Content);
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

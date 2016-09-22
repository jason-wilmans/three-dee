using System.Linq;
using CoreFacade.Interface;
using DiagramLogic.Interface;
using DiagramLogic.Interface.Elements;
using PortabilityLayer.ServiceRegistry;
using SiliconStudio.Core;
using SiliconStudio.Xenko.Engine;
using UI.Resources;

namespace UI.Diagrams
{
    [DataContract]
    public class DiagramView3D : StartupScript
    {
        private readonly IThreeDeeCore _core;
        private IResourceProvider _resources;

        public DiagramView3D()
        {
            _core = ThreeDeeCoreFactory.GetProductionCore();

            _core.DiagramChanged += OnDiagramChanged;
        }

        public override void Start()
        {
            base.Start();

            _resources = ServiceLocator.GetServiceInstance<IResourceProvider>();

            if (_core.CurrentDiagram != null) InitializeVisualScene(_core.CurrentDiagram);
        }

        private void OnDiagramChanged(IDiagram diagram)
        {
            diagram.ElementAdded += AddVisualElement;
            InitializeVisualScene(diagram);
        }

        private void AddVisualElement(IDiagramElement diagramElement)
        {
            Entity entity = _resources.GetDiagramNewElement();
            entity.Get<DiagramElementView3D>().CurrentElement = diagramElement;
        }

        private void InitializeVisualScene(IDiagram diagram)
        {
            Clear();

            foreach (var element in diagram.Elements)
            {
                AddVisualElement(element);
            }
        }

        public void Clear()
        {
            foreach (var child in Entity.Transform.Children.Select(transform => transform.Entity))
            {
                SceneSystem.SceneInstance.Scene.Entities.Remove(child);
            }
        }
    }
}

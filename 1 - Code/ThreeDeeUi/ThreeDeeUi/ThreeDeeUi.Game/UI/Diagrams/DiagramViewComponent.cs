using System.Linq;
using CoreFacade.Interface;
using DiagramLogic.Interface;
using DiagramLogic.Interface.Elements;
using SiliconStudio.Xenko.Engine;

namespace ThreeDeeUi.UI.Diagrams
{
    public class DiagramViewComponent : StartupScript
    {
        private readonly IThreeDeeCore _core;

        public DiagramViewComponent()
        {
            _core = ThreeDeeCoreFactory.GetProductionCore();
            
            _core.DiagramChanged += OnDiagramChanged;
        }

        public override void Start()
        {
            base.Start();

            if (_core.CurrentDiagram != null) InitializeVisualScene(_core.CurrentDiagram);
        }

        private void OnDiagramChanged(IDiagram diagram)
        {
            diagram.ElementAdded += AddVisualElement;
            InitializeVisualScene(diagram);
        }

        private void AddVisualElement(IDiagramElement diagramElement)
        {
            DiagramVertexComponent vertex = new DiagramVertexComponent(diagramElement);
            Entity entity = new Entity { vertex };
            //entity.Transform.Parent = Entity.Transform;
            SceneSystem.SceneInstance.Scene.Entities.Add(entity);
        }

        private void InitializeVisualScene(IDiagram diagram)
        {
            foreach (var child in Entity.Transform.Children.Select(transform => transform.Entity))
            {
                SceneSystem.SceneInstance.Scene.Entities.Remove(child);
            }

            foreach (var element in diagram.Elements)
            {
                AddVisualElement(element);
            }
        }
    }
}

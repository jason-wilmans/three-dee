using System.Linq;
using CoreFacade.Interface;
using DiagramLogic.Interface;
using DiagramLogic.Interface.Elements;
using SiliconStudio.Core.Collections;
using SiliconStudio.Xenko.Engine;

namespace ThreeDeeUi.UI.Diagrams
{
    public class DiagramViewComponent : StartupScript
    {
        private readonly IThreeDeeCore _core;
        private const string Url = "prefabs/Vertex";

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
            if (!Content.IsLoaded(Url))
            {
                Content.Load<Prefab>(Url);
            }

            Prefab vertexPrefab = Content.Get<Prefab>(Url);
            FastCollection<Entity> entities = vertexPrefab.Instantiate();
            SceneSystem.SceneInstance.Scene.Entities.AddRange(entities);
            //entities[0].Get<DiagramVertexComponent>().CurrentElement = diagramElement;
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

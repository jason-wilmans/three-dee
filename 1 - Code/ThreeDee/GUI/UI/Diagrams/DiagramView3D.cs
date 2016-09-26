using System.Linq;
using CoreFacade.Interface;
using DiagramLogic.Interface;
using DiagramLogic.Interface.Elements;
using SiliconStudio.Core;
using SiliconStudio.Xenko.Engine;
using UI.Resources;
using UI.Utilities;
using UI3D;

namespace UI.Diagrams
{
    [DataContract]
    public class DiagramView3D : AContainerViewElement3D
    {
        private IThreeDeeCore _core;
        private IResourceProvider _resources;
        private IDiagram _diagramModel;

        public override void Start()
        {
            base.Start();

            _core = ThreeDeeCoreFactory.GetProductionCore();
            _diagramModel = _core.CurrentDiagram;
            if (_diagramModel == null) return;

            _resources = UIServices.Locator.GetInstance<IResourceProvider>();
            InitializeVisualScene();
            _diagramModel.ElementAdded += AddVisualElement;
        }

        private void AddVisualElement(IDiagramElement diagramElement)
        {
            Entity entity = _resources.GetNewDiagramElement();
            DiagramElementView3D elementView = entity.Get<DiagramElementView3D>();
            AddChild(elementView);
        }

        private void InitializeVisualScene()
        {
            Clear();

            foreach (var element in _diagramModel.Elements)
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

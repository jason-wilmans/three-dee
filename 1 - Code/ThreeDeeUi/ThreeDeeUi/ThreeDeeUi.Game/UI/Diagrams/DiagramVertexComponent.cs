using DiagramLogic.Interface.Elements;
using SiliconStudio.Xenko.Engine;
using SiliconStudio.Xenko.Rendering;

namespace ThreeDeeUi.UI.Diagrams
{
    internal class DiagramVertexComponent : StartupScript
    {
        private IDiagramElement _element;
        private ModelComponent _modelComponent;
        private const string Url = "models/sphere/Sphere";

        public DiagramVertexComponent(IDiagramElement element = null)
        {
            if (element != null)
            {
                _element = element;
            }
        }

        public override void Start()
        {
            base.Start();
            
            if (!Content.IsLoaded(Url))
            {
                Content.Load<Model>(Url);
            }

            _modelComponent = Entity.GetOrCreate<ModelComponent>();
            _modelComponent.Model = Content.Get<Model>(Url);
        }
    }
}
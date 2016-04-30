using System;
using DiagramLogic.Interface.Elements;
using SiliconStudio.Xenko.Engine;
using SiliconStudio.Xenko.Rendering;
using XenkoUtilities;

namespace ThreeDeeUi.UI.Diagrams
{
    internal class DiagramVertexComponent : StartupScript
    {
        private IDiagramElement _element;
        private ModelComponent _modelComponent;
        private TransformComponent _transform;
        private const string Url = "models/sphere/Sphere";

        public DiagramVertexComponent(IDiagramElement element = null)
        {
            if (element != null)
            {
                _element = element;
            }
            else
            {
                throw new ArgumentNullException(nameof(element));
            }
        }

        public override void Start()
        {
            base.Start();
            
            if (!Content.IsLoaded(Url))
            {
                Content.Load<Model>(Url);
            }

            _transform = Entity.Transform;
            _transform.Position = ConversionTools.ToXenko(_element.Position);
            _modelComponent = Entity.GetOrCreate<ModelComponent>();
            _modelComponent.Model = Content.Get<Model>(Url);
        }
    }
}
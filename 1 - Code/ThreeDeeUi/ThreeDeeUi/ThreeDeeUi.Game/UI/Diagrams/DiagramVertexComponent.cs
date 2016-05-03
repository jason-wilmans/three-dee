using System;
using DiagramLogic.Interface.Elements;
using SiliconStudio.Xenko.Engine;
using XenkoUtilities;

namespace ThreeDeeUi.UI.Diagrams
{
    public class DiagramVertexComponent : StartupScript
    {
        private readonly IDiagramElement _element;
        private ModelComponent _modelComponent;
        private TransformComponent _transform;
        private IDiagramElement _currentElement;

        public IDiagramElement CurrentElement
        {
            get { return _currentElement; }
            set
            {
                _currentElement = value;
                UpdateVisuals();
            }
        }
        
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
            _modelComponent = Entity.Get<ModelComponent>();
            _transform = Entity.Transform;
        }
        
        private void UpdateVisuals()
        {
            _transform.Position = ConversionTools.ToXenko(_element.Position);
        }
    }
}
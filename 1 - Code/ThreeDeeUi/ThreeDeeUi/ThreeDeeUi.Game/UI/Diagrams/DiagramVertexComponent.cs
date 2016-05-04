using System;
using DiagramLogic.Interface.Elements;
using SiliconStudio.Xenko.Engine;
using SiliconStudio.Xenko.Rendering;
using XenkoUtilities;

namespace ThreeDeeUi.UI.Diagrams
{
    public class DiagramVertexComponent : StartupScript
    {
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

        public override void Start()
        {
            base.Start();

            _modelComponent = Entity.Get<ModelComponent>();
            _transform = Entity.Transform;
            UpdateVisuals();
        }

        private void UpdateVisuals()
        {
            if (_currentElement != null && _transform != null && _modelComponent != null)
            {
                _transform.Position = ConversionTools.ToXenko(_currentElement.Position);

                Model model = GetModelForType(_currentElement);
                _modelComponent.Model = model;
            }
        }

        private Model GetModelForType(IDiagramElement currentElement)
        {
            string url;
            switch (currentElement.GetType().Name)
            {
                case nameof(Ellipsoid):
                    url = "models/sphere/Sphere";
                    break;
                case nameof(Cuboid):
                    url = "models/cuboid/Cuboid";
                    break;
                default:
                    return null;
            }

            return !Content.IsLoaded(url) ? Content.Load<Model>(url) : Content.Get<Model>(url);
        }
    }
}

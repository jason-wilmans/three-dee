using DiagramLogic.Interface.Elements;
using SiliconStudio.Core.Mathematics;
using SiliconStudio.Xenko.Engine;
using SiliconStudio.Xenko.Rendering;
using SiliconStudio.Xenko.Rendering.Materials;
using XenkoUtilities;

namespace ThreeDeeUi.UI.Diagrams
{
    public class DiagramVertexComponent : StartupScript
    {
        private ModelComponent _modelComponent;
        private TransformComponent _transform;
        private IDiagramElement _currentElement;
        private bool _selected;
        private static readonly Color4 DarkColor = new Color4(new Color3(0.025f, 0.025f, 0.025f), 1.0f);

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

        public void ToggleColor()
        {
            Material material = _modelComponent.GetMaterial(0);

            if (_selected)
            {
                material.Parameters.Set(MaterialKeys.DiffuseValue, Color4.White);
            }
            else
            {
                material.Parameters.Set(MaterialKeys.DiffuseValue, DarkColor);
            }

            _selected = !_selected;
        }
    }
}

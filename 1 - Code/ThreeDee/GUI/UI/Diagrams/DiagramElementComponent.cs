using System;
using DiagramLogic.Interface.Elements;
using GameClient.GUI.Ui3D.EventArgs;
using SiliconStudio.Core.Mathematics;
using SiliconStudio.Xenko.Engine;
using SiliconStudio.Xenko.Rendering;
using SiliconStudio.Xenko.Rendering.Materials;
using UI.Utilities;
using UI3D;

namespace UI.Diagrams
{
    public class DiagramElementComponent : AViewElement3D
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

            _modelComponent = Entity.GetOrCreate<ModelComponent>();
            _transform = Entity.Transform;
            UpdateVisuals();
            Clicked += OnClicked;
        }

        private void OnClicked(MouseClickEventArgs mouseClickEventArgs)
        {
            ToggleColor();
        }

        public override void Update()
        {
            //TODO: What the fuck, why does position get overridden in first update?
            if (Game.GameSystems.IsFirstUpdateDone)
            {
                UpdateVisuals();
            }
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
                    throw new ArgumentException("Unknown element type", nameof(currentElement));
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

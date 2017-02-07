using System;
using DiagramLogic.Interface.Elements;
using SiliconStudio.Core.Mathematics;
using SiliconStudio.Xenko.Engine;
using SiliconStudio.Xenko.UI;
using SiliconStudio.Xenko.UI.Panels;
using UI.Ui3D;

namespace UI.Diagrams
{
    public class TranslationManipulatorView3D : AViewElement3D
    {
        public ADiagramElement SelectedElement { get; set; }

        private UIComponent _uiComponent;
        private Grid _inputRelayGrid;
        private const int Size = 10;
        private ManipulationHandle _activeHandle;
        private Color _oldHandleColor;

        public override void Start()
        {
            base.Start();

            _uiComponent = Entity.GetOrCreate<UIComponent>();
            _inputRelayGrid = new Grid
            {
                CanBeHitByUser = true
            };

            _inputRelayGrid.TouchMove += (sender, args) => _activeHandle?.OnTouchMove(sender, args);

            _uiComponent.Page = new UIPage
            {
                RootElement = _inputRelayGrid
            };

            CreateHandle(HandlePosition.TopLeft);
            CreateHandle(HandlePosition.TopRight);
            CreateHandle(HandlePosition.BottomRight);
            CreateHandle(HandlePosition.BottomLeft);
        }

        private void CreateHandle(HandlePosition handlePosition)
        {
            ManipulationHandle handle = new ManipulationHandle(handlePosition, Size, GraphicsDevice);
            handle.TouchDown += OnHandleTouchDown;
            handle.TouchUp += OnHandleTouchUp;
            handle.PositionChanged += OnHandlePositionChanged;
            _inputRelayGrid.Children.Add(handle);
        }

        private void OnHandlePositionChanged(float radius)
        {
            foreach (var handle in _inputRelayGrid.Children)
            {
                (handle as ManipulationHandle).SetRadius(radius);
            }
        }

        private void OnHandleTouchDown(object sender, TouchEventArgs touchEventArgs)
        {
            _activeHandle = sender as ManipulationHandle;
            _oldHandleColor = _activeHandle.BackgroundColor;
            _activeHandle.BackgroundColor = Color.Orange;
        }

        private void OnHandleTouchUp(object sender, TouchEventArgs touchEventArgs)
        {
            if (_activeHandle != null)
            {
                _activeHandle.BackgroundColor = _oldHandleColor;
                _activeHandle = null;
            }
        }
    }
}
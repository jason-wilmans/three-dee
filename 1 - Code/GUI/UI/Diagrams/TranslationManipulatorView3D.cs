using System;
using DiagramLogic.Interface.Elements;
using SiliconStudio.Core.Mathematics;
using SiliconStudio.Xenko.Engine;
using SiliconStudio.Xenko.Input;
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

            _uiComponent.Page = new UIPage
            {
                RootElement = _inputRelayGrid
            };

            foreach (HandlePosition position in HandlePosition.Values)
            {
                CreateHandle(position);
            }
        }

        public override void Update()
        {
            base.Update();

            if (_activeHandle == null) return;
            _activeHandle.MoveTo(Input.MousePosition);

            if (!Input.IsMouseButtonReleased(MouseButton.Left)) return;
            _activeHandle.BackgroundColor = _oldHandleColor;
            _activeHandle = null;
        }

        private void CreateHandle(HandlePosition handlePosition)
        {
            ManipulationHandle handle = new ManipulationHandle(handlePosition, Size, GraphicsDevice);
            handle.TouchDown += OnHandleTouchDown;
            _inputRelayGrid.Children.Add(handle);
        }

        private void OnHandleTouchDown(object sender, TouchEventArgs touchEventArgs)
        {
            _activeHandle = sender as ManipulationHandle;
            _oldHandleColor = _activeHandle.BackgroundColor;
            _activeHandle.BackgroundColor = Color.Orange;
            touchEventArgs.Handled = true;
        }
    }
}
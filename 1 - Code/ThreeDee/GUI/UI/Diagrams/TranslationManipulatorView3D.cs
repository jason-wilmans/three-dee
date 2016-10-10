using DiagramLogic.Interface.Elements;
using SiliconStudio.Xenko.Engine;
using SiliconStudio.Xenko.UI.Panels;
using UI.Ui3D;

namespace UI.Diagrams
{
    public class TranslationManipulatorView3D : AViewElement3D
    {
        public ADiagramElement SelectedElement { get; set; }

        private SelectedIndicator _upperLeftIndicator;
        private SelectedIndicator _upperRightIndicator;
        private SelectedIndicator _lowerRightIndicator;
        private SelectedIndicator _lowerLeftIndicator;
        private UIComponent _uiComponent;

        public override void Start()
        {
            base.Start();

            _uiComponent = Entity.GetOrCreate<UIComponent>();
            var grid = new Grid();
            _uiComponent.Page = new UIPage
            {
                RootElement = grid
            };

            var size = 5;
            _upperLeftIndicator = new SelectedIndicator(size);
            grid.Children.Add(_upperLeftIndicator);
            _upperRightIndicator = new SelectedIndicator(size);
            grid.Children.Add(_upperRightIndicator);
            _lowerRightIndicator = new SelectedIndicator(size);
            grid.Children.Add(_lowerRightIndicator);
            _lowerLeftIndicator = new SelectedIndicator(size);
            grid.Children.Add(_lowerLeftIndicator);
        }
    }
}
using SiliconStudio.Xenko.UI;

namespace ThreeDeeUi.UI.Screens
{
    internal class EditorScreen : UIElement
    {
        private IScreenManager _screenManager;

        public EditorScreen(IScreenManager screenManager)
        {
            _screenManager = screenManager;
        }
    }
}
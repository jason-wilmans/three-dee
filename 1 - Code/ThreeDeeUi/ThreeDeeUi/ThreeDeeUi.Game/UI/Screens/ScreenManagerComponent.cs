using System.Collections.Generic;
using SiliconStudio.Xenko.Engine;
using SiliconStudio.Xenko.UI;

namespace ThreeDeeUi.UI.Screens
{
    public class ScreenManagerComponent : StartupScript , IScreenManager
    {
        private IDictionary<Screen, UIElement> Screens;
        private UIComponent _ui;
        
        public override void Start()
        {
            base.Start();

            _ui = Entity.GetOrCreate<UIComponent>();
            _ui.Page = new UIPage();

            Screens = SetupScreens();
            ChangeTo(Screen.MainMenu);
        }
        
        private Dictionary<Screen, UIElement> SetupScreens()
        {
            return new Dictionary<Screen, UIElement>
            {
                {Screen.MainMenu, new MainMenuScreen(this, Content) },
                {Screen.FileLoading, new FileLoadingScreen(this) },
                {Screen.Editor, new EditorScreen(this, Content) }
            };
        }

        public void ChangeTo(Screen screen)
        {
            _ui.Page.RootElement = Screens[screen];
        }

        public void QuitProgram()
        {
            // ReSharper disable once PossibleNullReferenceException
            (Game as Game).Exit();
        }
    }
}

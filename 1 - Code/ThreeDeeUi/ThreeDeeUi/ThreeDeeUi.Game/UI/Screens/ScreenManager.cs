using System.Collections.Generic;
using SiliconStudio.Xenko.Engine;
using SiliconStudio.Xenko.UI;

namespace ThreeDeeUi.UI.Screens
{
    public class ScreenManager : StartupScript , IScreenManager
    {
        private IDictionary<Screen, UIElement> Screens;
        private UIComponent _ui;
        
        public override void Start()
        {
            base.Start();

            _ui = Entity.GetOrCreate<UIComponent>();

            Screens = SetupScreens();
            ChangeTo(Screen.MainMenu);
        }
        
        private Dictionary<Screen, UIElement> SetupScreens()
        {
            return new Dictionary<Screen, UIElement>
            {
                {Screen.MainMenu, new MainMenuScreen(this, Content) },
                {Screen.FileLoading, new FileLoadingScreen(this) },
                {Screen.Editor, new EditorScreen(this) }
            };
        }

        public void ChangeTo(Screen screen)
        {
            _ui.RootElement = Screens[screen];
        }

        public void QuitProgram()
        {
            // ReSharper disable once PossibleNullReferenceException
            (Game as Game).Exit();
        }
    }
}

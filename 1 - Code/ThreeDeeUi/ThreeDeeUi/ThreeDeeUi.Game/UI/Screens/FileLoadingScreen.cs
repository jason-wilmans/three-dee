﻿using SiliconStudio.Xenko.UI;

namespace ThreeDeeUi.UI.Screens
{
    internal class FileLoadingScreen : UIElement
    {
        private readonly IScreenManager _screenManager;

        public FileLoadingScreen(IScreenManager screenManager)
        {
            _screenManager = screenManager;
        }
    }
}
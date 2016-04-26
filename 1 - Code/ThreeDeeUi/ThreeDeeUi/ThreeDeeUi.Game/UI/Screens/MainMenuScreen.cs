using System;
using SiliconStudio.Core.Mathematics;
using SiliconStudio.Core.Serialization.Assets;
using SiliconStudio.Xenko.Graphics;
using SiliconStudio.Xenko.UI;
using SiliconStudio.Xenko.UI.Controls;
using SiliconStudio.Xenko.UI.Events;
using SiliconStudio.Xenko.UI.Panels;

namespace ThreeDeeUi.UI.Screens
{
    internal class MainMenuScreen : Canvas
    {
        private IScreenManager _screenManager;
        private readonly SpriteFont _titleFont;

        public MainMenuScreen(IScreenManager screenManager, ContentManager contentManager)
        {
            _screenManager = screenManager;
            _titleFont = contentManager.Load<SpriteFont>("fonts/title");

            SetupTitle();
            SetupMenu();
        }
        
        private void SetupTitle()
        {
            var textBlock = new TextBlock
            {
                Font = _titleFont,
                TextSize = 72,
                Text = "ThreeDee",
                TextColor = Color.White
            };
            textBlock.SetCanvasRelativePosition(new Vector3(0.3f, 0.3f, 0));
            Children.Add(textBlock);
        }

        private void SetupMenu()
        {
            StackPanel menu = new StackPanel
            {
                Orientation = Orientation.Horizontal
            };
            menu.SetCanvasRelativePosition(new Vector3(0.5f, 0.65f, 0));

            Children.Add(menu);

            SetupMenuItems(menu);
        }

        private void SetupMenuItems(StackPanel menu)
        {
            UIElement newDiagram = CreateMenuItem("New Diagram", OnNewDiagramClicked);
            menu.Children.Add(newDiagram);

            UIElement loadDiagram = CreateMenuItem("Load Diagram", OnLoadDiagramClicked);
            menu.Children.Add(loadDiagram);

            UIElement exit = CreateMenuItem("Exit", OnExitClicked);
            menu.Children.Add(exit);
        }

        private UIElement CreateMenuItem(string text, EventHandler<RoutedEventArgs> onDiagramLoadClicked)
        {
            Button button = new Button
            {
                Content = new TextBlock
                {
                    Text = text,
                    Font = _titleFont,
                    TextSize = 24
                }
            };
            button.Click += onDiagramLoadClicked;
            return button;
        }

        private void OnNewDiagramClicked(object sender, RoutedEventArgs e)
        {
            _screenManager.ChangeTo(Screen.Editor);
        }

        private void OnLoadDiagramClicked(object sender, RoutedEventArgs e)
        {
            _screenManager.ChangeTo(Screen.FileLoading);
        }

        private void OnExitClicked(object sender, RoutedEventArgs e)
        {
            _screenManager.QuitProgram();
        }
    }
}
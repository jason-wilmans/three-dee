using System.Collections.Generic;
using CoreFacade.Interface;
using DiagramLogic.Interface;
using DiagramLogic.Interface.Elements;
using SiliconStudio.Core.Mathematics;
using SiliconStudio.Core.Serialization.Assets;
using SiliconStudio.Xenko.Graphics;
using SiliconStudio.Xenko.UI;
using SiliconStudio.Xenko.UI.Controls;
using SiliconStudio.Xenko.UI.Panels;

namespace ThreeDeeUi.UI.Screens
{
    internal class EditorScreen : Canvas
    {
        private const float RelativeWidth = 0.125f;

        private readonly IThreeDeeCore _core;
        private IScreenManager _screenManager;
        private readonly SpriteFont _elementsFont;

        public EditorScreen(IScreenManager screenManager, ContentManager content)
        {
            _screenManager = screenManager;
            _core = ThreeDeeCoreFactory.GetProductionCore();
            _elementsFont = content.Load<SpriteFont>("fonts/elements");

            UniformGrid elementsMenu = SetupElementsMenu();
            Children.Add(elementsMenu);

            SetupElements(elementsMenu);
        }
        
        private UniformGrid SetupElementsMenu()
        {
            UniformGrid menu = new UniformGrid
            {
                Columns = 2
            };

            menu.SetCanvasRelativePosition(new Vector3(1.0f-RelativeWidth, 0, 0));
            menu.SetCanvasRelativeSize(new Vector3(RelativeWidth, 1.0f, 0));

            return menu;
        }

        private void SetupElements(UniformGrid elementsMenu)
        {
            IEnumerable<DiagramElementType> elementTypes = _core.GetAvailableElementTypes();

            foreach (var diagramElementType in elementTypes)
            {
                CreateElementButton(diagramElementType, elementsMenu);
            }
        }

        private void CreateElementButton(DiagramElementType elementType, UniformGrid elementsMenu)
        {
            Button button = new Button
            {
                Content = new TextBlock
                {
                    Text = elementType.DisplayName,
                    Font = _elementsFont
                }
            };

            button.Click += (sender, args) => AddElement(elementType);

            elementsMenu.Children.Add(button);
        }

        private void AddElement(DiagramElementType elementType)
        {
            // TODO: Get IDiagramElement from DiagramElementType
            _core.CurrentDiagram.Add(new Ellipsoid());
        }
    }
}
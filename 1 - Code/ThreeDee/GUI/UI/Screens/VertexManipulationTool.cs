using SiliconStudio.Core.Mathematics;
using SiliconStudio.Xenko.UI.Panels;

namespace ThreeDeeUi.UI.Screens
{
    internal class VertexManipulationTool : Panel
    {
        public VertexManipulationTool()
        {
            BackgroundColor = Color.Transparent;
        }

        public void ToggleVisibility()
        {
            if (BackgroundColor == Color.Transparent)
            {
                BackgroundColor = Color.AliceBlue;
            }
            else
            {
                BackgroundColor = Color.Transparent;
            }
        }
    }
}
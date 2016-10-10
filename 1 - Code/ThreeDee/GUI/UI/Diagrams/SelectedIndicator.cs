using SiliconStudio.Core.Mathematics;
using SiliconStudio.Xenko.UI;
using SiliconStudio.Xenko.UI.Controls;

namespace UI.Diagrams
{
    public class SelectedIndicator : Button
    {
        public SelectedIndicator(float size)
        {
            BackgroundColor = Color.Black;
            Width = size;
            Height = size;
            Depth = size;

            MouseOverStateChanged += OnMouseOverstateChanged;
        }

        private void OnMouseOverstateChanged(object sender, PropertyChangedArgs<MouseOverState> propertyChangedArgs)
        {
                BackgroundColor = propertyChangedArgs.NewValue == MouseOverState.MouseOverNone ? Color.Black : Color.Orange;
        }
    }
}

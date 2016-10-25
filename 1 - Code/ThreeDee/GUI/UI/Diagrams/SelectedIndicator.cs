// // <copyright file="SelectedIndicator.cs" year="2016" owner="Fritz Oscar S. Berngruber & Jason Wilmans" email="fw.project@gmx.de">
// // All rights are reserved. Reproduction or transmission in whole or in part, in
// // any form or by any means, electronic, mechanical or otherwise, is prohibited
// // without the prior written consent of the copyright owner.
// // </copyright>

using System;
using SiliconStudio.Core.Mathematics;
using SiliconStudio.Xenko.Graphics;
using SiliconStudio.Xenko.UI;
using SiliconStudio.Xenko.UI.Controls;
using SiliconStudio.Xenko.UI.Panels;

namespace UI.Diagrams
{
    public class SelectedIndicator : Border
    {
        private readonly GraphicsDevice _graphicsDevice;
        private bool _moving;

        public SelectedIndicator(float size, GraphicsDevice graphicsDevice)
        {
            CanBeHitByUser = true;
            _graphicsDevice = graphicsDevice;
            BackgroundColor = Color.Black;
            Width = size;
            Height = size;
            Depth = size;

            HorizontalAlignment = HorizontalAlignment.Left;
            VerticalAlignment = VerticalAlignment.Top;

            Vector2 screenSize = new Vector2(
                _graphicsDevice.Presenter.BackBuffer.Width,
                _graphicsDevice.Presenter.BackBuffer.Height
                );

            Margin = new Thickness(0.5f * screenSize.X, 0.5f * screenSize.Y, 0, 0);

            MouseOverStateChanged += OnMouseOverstateChanged;
            TouchMove += OnTouchMove;
        }

        private void OnTouchMove(object sender, TouchEventArgs touchEventArgs)
        {
            Vector2 screenSize = new Vector2(
                _graphicsDevice.Presenter.BackBuffer.Width,
                _graphicsDevice.Presenter.BackBuffer.Height
                );

            var widthOffset = Width / 2;
            var heightOffset = Height / 2;

            Margin = new Thickness(touchEventArgs.ScreenPosition.X * screenSize.X- widthOffset,
                touchEventArgs.ScreenPosition.Y * screenSize.Y - heightOffset, 0, 0);
        }

        private void OnMouseOverstateChanged(object sender, PropertyChangedArgs<MouseOverState> propertyChangedArgs)
        {
            BackgroundColor = propertyChangedArgs.NewValue == MouseOverState.MouseOverNone ? Color.Black : Color.Orange;
        }
    }
}
// // <copyright file="ManipulationHandle.cs" year="2016" owner="Fritz Oscar S. Berngruber & Jason Wilmans" email="fw.project@gmx.de">
// // All rights are reserved. Reproduction or transmission in whole or in part, in
// // any form or by any means, electronic, mechanical or otherwise, is prohibited
// // without the prior written consent of the copyright owner.
// // </copyright>

using System;
using SiliconStudio.Core.Mathematics;
using SiliconStudio.Xenko.Graphics;
using SiliconStudio.Xenko.UI;
using SiliconStudio.Xenko.UI.Controls;

namespace UI.Diagrams
{
    public class ManipulationHandle : Border
    {
        public event Action<float> PositionChanged;

        public HandleState State { get; set; }

        private readonly HandlePosition _handlePosition;
        private readonly GraphicsDevice _graphicsDevice;

        public ManipulationHandle(HandlePosition handlePosition, float size, GraphicsDevice graphicsDevice)
        {
            CanBeHitByUser = true;
            _handlePosition = handlePosition;
            _graphicsDevice = graphicsDevice;
            BackgroundColor = Color.Black;
            Width = size;
            Height = size;
            Depth = size;

            HorizontalAlignment = HorizontalAlignment.Left;
            VerticalAlignment = VerticalAlignment.Top;
            
            SetRadius(30);
        }

        public void SetRadius(float radius)
        {
            Vector2 screenSize = new Vector2(
                _graphicsDevice.Presenter.BackBuffer.Width,
                _graphicsDevice.Presenter.BackBuffer.Height
                );

            Vector2 middle = new Vector2(0.5f * screenSize.X, 0.5f * screenSize.Y);

            var leftOffset = (float)Math.Sin(_handlePosition.Angle * 2 * Math.PI) * radius;
            var topOffset = (float)Math.Cos(_handlePosition.Angle * 2 * Math.PI) * radius;
            Margin = new Thickness(middle.X + leftOffset, middle.Y + topOffset, 0, 0);
        }

        public void MoveTo(Vector2 position)
        {
            Vector2 screenSize = new Vector2(
                _graphicsDevice.Presenter.BackBuffer.Width,
                _graphicsDevice.Presenter.BackBuffer.Height
                );

            var widthOffset = Width / 2;
            var heightOffset = Height / 2;

            var x = position.X * screenSize.X - widthOffset;
            var y = position.Y * screenSize.Y - heightOffset;
            Margin = new Thickness(x, y, 0, 0);
        }
    }

    public enum HandleState
    {
        Normal,
        MouseOver,
        Active
    }
}
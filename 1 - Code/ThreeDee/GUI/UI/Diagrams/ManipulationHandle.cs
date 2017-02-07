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
            
            SetRadius(20);
        }

        public void SetRadius(float radius)
        {
            Vector2 screenSize = new Vector2(
                _graphicsDevice.Presenter.BackBuffer.Width,
                _graphicsDevice.Presenter.BackBuffer.Height
                );

            Vector2 middle = new Vector2(0.5f * screenSize.X, 0.5f * screenSize.Y);

            float angle;

            switch (_handlePosition)
            {
                case HandlePosition.TopLeft:
                    angle = 7 / 8.0f;
                    BackgroundColor = Color.Magenta;
                    break;

                case HandlePosition.TopRight:
                    angle = 1 / 8.0f;
                    BackgroundColor = Color.Blue;
                    break;

                case HandlePosition.BottomRight:
                    angle = 3 / 8.0f;
                    BackgroundColor = Color.Green;
                    break;

                case HandlePosition.BottomLeft:
                    angle = 5 / 8.0f;
                    BackgroundColor = Color.Yellow;
                    break;

                default:
                    throw new ArgumentException("Unknown position:", nameof(_handlePosition));
            }

            angle += 0.5f; // at library starts 0 at the bottom O_o

            var leftOffset = (float)Math.Sin(angle * 2 * Math.PI) * radius;
            var topOffset = (float)Math.Cos(angle * 2 * Math.PI) * radius;
            Margin = new Thickness(middle.X + leftOffset, middle.Y + topOffset, 0, 0);
        }

        public void OnTouchMove(object sender, TouchEventArgs touchEventArgs)
        {
            Vector2 screenSize = new Vector2(
                _graphicsDevice.Presenter.BackBuffer.Width,
                _graphicsDevice.Presenter.BackBuffer.Height
                );

            var widthOffset = Width / 2;
            var heightOffset = Height / 2;

            var x = touchEventArgs.ScreenPosition.X * screenSize.X - widthOffset;
            var y = touchEventArgs.ScreenPosition.Y * screenSize.Y - heightOffset;
            Margin = new Thickness(x, y, 0, 0);

            var length = new Vector2(-screenSize.X/2 + x, -screenSize.Y/2 + y).Length();
            PositionChanged?.Invoke(length);
        }
    }

    public enum HandleState
    {
        Normal,
        MouseOver,
        Active
    }
}
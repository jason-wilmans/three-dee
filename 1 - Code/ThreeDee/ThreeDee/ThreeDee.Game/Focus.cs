using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SiliconStudio.Core.Mathematics;
using SiliconStudio.Xenko.Animations;
using SiliconStudio.Xenko.Engine;
using SiliconStudio.Xenko.Graphics;
using SiliconStudio.Xenko.Graphics.Font;
using SiliconStudio.Xenko.UI;
using SiliconStudio.Xenko.UI.Controls;
using SiliconStudio.Xenko.UI.Panels;

namespace ThreeDee
{
    public class Focus : SyncScript
    {
        public SpriteFont Font { get; set; }
        public TransformComponent Target;
        private UIComponent _ui;
        private TextBlock _angle;
        private TextBlock _dot;
        private TextBlock _over;

        public override void Start()
        {
            base.Start();

            //StackPanel panel = new StackPanel
            //{
            //    Orientation = Orientation.Horizontal
            //};

            //_ui.RootElement = panel;

            //SetupLabels(panel);
        }

        public override void Update()
        {
            Vector3 lookDirection = Target.Position - Entity.Transform.Position;
            double horizontalAngle = Math.Atan2(lookDirection.Z, lookDirection.X);
            double verticalAngle = Math.Atan2(lookDirection.Y, lookDirection.X);

            Quaternion combined = Quaternion.RotationY((float) -horizontalAngle - MathUtil.PiOverTwo);

            Entity.Transform.Rotation = combined;
        }

        private double Clamp(double f)
        {
            return Math.Min(1f, Math.Max(-1, f));
        }

        private void SetupLabels(StackPanel panel)
        {
            _dot = new TextBlock
            {
                Font = Font,
                TextColor = Color.Magenta,
                Margin = new Thickness(20, 20, 0, 0)
            };
            panel.Children.Add(_dot);

            _over = new TextBlock
            {
                Font = Font,
                TextColor = Color.Magenta,
                Margin = new Thickness(20, 20, 0, 0)
            };
            panel.Children.Add(_over);

            _angle = new TextBlock
            {
                Font = Font,
                TextColor = Color.Magenta,
                Margin = new Thickness(20, 20, 0, 0)
            };
            panel.Children.Add(_angle);
        }
    }
}

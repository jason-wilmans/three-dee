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

        public override void Update()
        {
            Vector3 lookDirection = Target.Position - Entity.Transform.Position;
            double horizontalAngle = Math.Atan2(lookDirection.Z, lookDirection.X);
            double verticalAngle = Math.Atan2(lookDirection.Y, lookDirection.Z);

            Quaternion combined = Quaternion.RotationYawPitchRoll((float)-horizontalAngle - MathUtil.PiOverTwo, (float) (-verticalAngle + Math.PI), 0);

            Entity.Transform.Rotation = combined;
        }
    }
}

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

namespace ThreeDee
{
    public class Focus : SyncScript
    {
        public SpriteFont Font { get; set; }
        public TransformComponent Target;
        private UIComponent _ui;
        private TextBlock _label;

        public override void Start()
        {
            base.Start();

            _ui = Entity.GetOrCreate<UIComponent>();
            _label = new TextBlock
            {
                Font = Font,
                TextColor = Color.Magenta,
                Margin = new Thickness(20, 20, 0, 0)
            };
            _ui.RootElement = _label;
        }
        
        public override void Update()
        {
            Vector3 lookDirection = Target.Position - Entity.Transform.Position;
            var a = Entity.Transform.LocalMatrix.Forward / Entity.Transform.LocalMatrix.Forward.Length();
            var b = lookDirection / lookDirection.Length();
            float angle = (float) Math.Acos(Vector3.Dot(a, b));
            _label.Text = angle.ToString();
        }
    }
}

using System;
using SiliconStudio.Xenko.Engine;

namespace ThreeDee
{
    public class MovingBox : SyncScript
    {
        public override void Update()
        {
            Entity.Transform.Position.X = (float)Math.Sin(Game.PlayTime.TotalTime.Ticks / 100000000f) * 3.5f;
            Entity.Transform.Position.Y = (float) Math.Cos(Game.PlayTime.TotalTime.Ticks / 100000000f);
        }
    }
}

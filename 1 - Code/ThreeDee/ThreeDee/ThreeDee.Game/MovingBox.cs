using System;
using SiliconStudio.Xenko.Engine;

namespace ThreeDee
{
    public class MovingBox : SyncScript
    {
        public override void Update()
        {
            Entity.Transform.Position.X = (float) Math.Sin(Game.PlayTime.TotalTime.Ticks / 10000000f) * 5.0f;
        }
    }
}

using SiliconStudio.Xenko.Engine;
using XenkoUtilities;

namespace ThreeDee
{
    public class Focus : SyncScript
    {
        public TransformComponent Target;

        public override void Update()
        {
            Entity.Transform.LookAt(Target.Position);
        }
    }
}

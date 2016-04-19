using System;
using SiliconStudio.Core.Mathematics;
using SiliconStudio.Xenko.Engine;

namespace XenkoUtilities
{
    public static class TransformComponentExtensions
    {
        public static void LookAt(this TransformComponent transform, Vector3 target)
        {
            Vector3 lookDirection = target - transform.Position;
            double horizontalAngle = Math.Atan2(lookDirection.Z, lookDirection.X);
            double verticalAngle = Math.Atan2(lookDirection.Y, lookDirection.Z);
            
            transform.Rotation = Quaternion.RotationYawPitchRoll(
                (float)-horizontalAngle - MathUtil.PiOverTwo,
                (float)(-verticalAngle + Math.PI),
                0
            );
        }
    }
}

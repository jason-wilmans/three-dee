using System;
using SiliconStudio.Core.Mathematics;
using SiliconStudio.Xenko.Engine;

namespace XenkoUtilities
{
    public static class TransformComponentExtensions
    {
        private const double Epsilon = 0.000001;

        public static void LookAt(this TransformComponent transform, Vector3 target)
        {
            Vector3 lookDirection = target - transform.Position;
            double horizontalAngle = Math.Atan2(lookDirection.Z, lookDirection.X);
            double verticalAngle = Math.Atan2(lookDirection.Y, lookDirection.Z);

            //Clean(-verticalAngle + Math.PI)

            transform.Rotation = Quaternion.RotationYawPitchRoll(
                Clean(-horizontalAngle - MathUtil.PiOverTwo),
                0,
                0
            );
        }

        private static float Clean(double d)
        {
            //if (1 - Math.Abs(d) < Epsilon) return 1.0f;
            //if (Math.Abs(d) < Epsilon) return 0.0f;
            return (float) d;
        }
    }
}

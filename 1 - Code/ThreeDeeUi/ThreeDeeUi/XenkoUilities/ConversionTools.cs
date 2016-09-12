using SiliconStudio.Core.Mathematics;
using ZeroTypes;

namespace XenkoUtilities
{
    public static class ConversionTools
    {
        public static Vector3 ToXenko(Tuple3 tuple)
        {
            return new Vector3((float) tuple.X, (float) tuple.Y, (float) tuple.Z);
        }

        public static Vector4 ToXenko(Tuple4 tuple)
        {
            return new Vector4((float) tuple.X, (float) tuple.Y, (float) tuple.Z, (float) tuple.W);
        }

        public static Tuple3 ToModel(Vector3 xenko)
        {
            return new Tuple3(xenko.X, xenko.Y, xenko.Z);
        }

        public static Tuple4 ToModel(Vector4 xenko)
        {
            return new Tuple4(xenko.X, xenko.Y, xenko.Z, xenko.W);
        }
    }
}

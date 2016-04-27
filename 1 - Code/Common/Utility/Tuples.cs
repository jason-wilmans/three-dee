using UnityEngine;
using ZeroTypes;

namespace Utility
{
    /// <summary>
    /// Utility class for tuples.
    /// </summary>
    public static class Tuples
    {
        /// <summary>
        /// Converts from <see cref="Tuple3"/> to unity <see cref="Vector3"/>.
        /// </summary>
        /// <param name="tuple"></param>
        /// <returns></returns>
        public static Vector3 ToVector3(Tuple3 tuple)
        {
            return new Vector3((float) tuple.X, (float)tuple.Y, (float)tuple.Z);
        }

        /// <summary>
        /// Converts from unity <see cref="Vector3"/> to <see cref="Tuple3"/>.
        /// </summary>
        /// <param name="vector"></param>
        /// <returns></returns>
        public static Vector3 ToTuple3(Vector3 vector)
        {
            return new Vector3(vector.x, vector.y, vector.z);
        }
    }
}

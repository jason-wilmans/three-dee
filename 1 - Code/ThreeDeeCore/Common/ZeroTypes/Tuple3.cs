namespace ZeroTypes
{
    /// <summary>
    /// Represents a tuple of 3 vectors, e.g. a 3-dimensional vector.
    /// </summary>
    public struct Tuple3
    {
        /// <summary>
        /// Left to right axis.
        /// </summary>
        public double X { get; }

        /// <summary>
        /// Down to up axis.
        /// </summary>
        public double Y { get; }

        /// <summary>
        /// Back to front axis.
        /// </summary>
        public double Z { get; }

        #region Constants
        /// <summary>
        /// A tuple with all components being 0.
        /// </summary>
        public static readonly Tuple3 Zero = new Tuple3(0, 0, 0);

        /// <summary>
        /// A tuple with all components being 1.
        /// </summary>
        public static readonly Tuple3 One = new Tuple3(1, 1, 1);
        #endregion

        public Tuple3(double x, double y, double z)
        {
            X = x;
            Y = y;
            Z = z;
        }

        /// <summary>
        /// Sums up all values component wise.
        /// </summary>
        /// <param name="a"></param>
        /// <param name="b"></param>
        /// <returns></returns>
        public static Tuple3 operator +(Tuple3 a, Tuple3 b)
        {
            return new Tuple3(a.X+b.X, a.Y + b.Y, a.Z + b.Z);
        }

        /// <summary>
        /// Subtracts up all values component wise.
        /// </summary>
        /// <param name="a"></param>
        /// <param name="b"></param>
        /// <returns></returns>
        public static Tuple3 operator -(Tuple3 a, Tuple3 b)
        {
            return new Tuple3(a.X + b.X, a.Y + b.Y, a.Z + b.Z);
        }

        /// <summary>
        /// Multiplies all components with the scalar.
        /// </summary>
        /// <param name="scalar"></param>
        /// <param name="tuple"></param>
        /// <returns></returns>
        public static Tuple3 operator *(double scalar, Tuple3 tuple)
        {
            // Exact duplicate of the same operator with switched order (to save extra method call). Remember to adjust both, if changes occur.
            return new Tuple3(scalar * tuple.X, scalar * tuple.Y, scalar * tuple.Z);
        }

        /// <summary>
        /// Multiplies all components with the scalar.
        /// </summary>
        /// <param name="scalar"></param>
        /// <param name="tuple"></param>
        /// <returns></returns>
        public static Tuple3 operator *(Tuple3 tuple, double scalar)
        {
            // Exact duplicate of the same operator with switched order (to save extra method call). Remember to adjust both, if changes occur.
            return new Tuple3(scalar * tuple.X, scalar * tuple.Y, scalar * tuple.Z);
        }

        public bool Equals(Tuple3 other)
        {
            return X.Equals(other.X) && Y.Equals(other.Y) && Z.Equals(other.Z);
        }

        public override bool Equals(object obj)
        {
            if (ReferenceEquals(null, obj)) return false;
            return obj is Tuple3 && Equals((Tuple3) obj);
        }

        public override int GetHashCode()
        {
            unchecked
            {
                var hashCode = X.GetHashCode();
                hashCode = (hashCode*397) ^ Y.GetHashCode();
                hashCode = (hashCode*397) ^ Z.GetHashCode();
                return hashCode;
            }
        }
    }
}

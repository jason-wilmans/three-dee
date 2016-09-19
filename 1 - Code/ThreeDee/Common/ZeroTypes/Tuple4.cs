namespace ZeroTypes
{
    public struct Tuple4
    {
        /// <summary>
        ///     First value.
        /// </summary>
        /// <remarks>Left to right axis when interpreted as a vector.</remarks>
        public double X { get; }

        /// <summary>
        ///     Second value.
        /// </summary>
        /// <remarks>Down to up axis when interpreted as a vector.</remarks>
        public double Y { get; }

        /// <summary>
        ///     Third value.
        /// </summary>
        /// <remarks>Back to front axis when interpreted as a vector.</remarks>
        public double Z { get; }

        /// <summary>
        ///     Fourth value.
        /// </summary>
        /// <remarks>W component, when interpreted as a Quaternion.</remarks>
        public double W { get; }

        #region Constants

        /// <summary>
        ///     A tuple with all components being 0.
        /// </summary>
        public static readonly Tuple4 Zero = new Tuple4(0, 0, 0, 0);

        /// <summary>
        ///     A tuple with all components being 1.
        /// </summary>
        public static readonly Tuple3 One = new Tuple3(1, 1, 1);

        #endregion

        public Tuple4(double x, double y, double z, double w)
        {
            X = x;
            Y = y;
            Z = z;
            W = w;
        }

        /// <summary>
        ///     Sums up all values component wise.
        /// </summary>
        /// <param name="a"></param>
        /// <param name="b"></param>
        /// <returns></returns>
        public static Tuple4 operator +(Tuple4 a, Tuple4 b)
        {
            return new Tuple4(a.X + b.X, a.Y + b.Y, a.Z + b.Z, a.W + b.W);
        }

        /// <summary>
        ///     Subtracts up all values component wise.
        /// </summary>
        /// <param name="a"></param>
        /// <param name="b"></param>
        /// <returns></returns>
        public static Tuple4 operator -(Tuple4 a, Tuple4 b)
        {
            return new Tuple4(a.X + b.X, a.Y + b.Y, a.Z + b.Z, a.W + b.W);
        }

        /// <summary>
        ///     Multiplies all components with the scalar.
        /// </summary>
        /// <param name="scalar"></param>
        /// <param name="tuple"></param>
        /// <returns></returns>
        public static Tuple4 operator *(double scalar, Tuple4 tuple)
        {
            // Exact duplicate of the same operator with switched order (to save extra method call). Remember to adjust both, if changes occur.
            return new Tuple4(scalar*tuple.X, scalar*tuple.Y, scalar*tuple.Z, scalar+tuple.W);
        }

        /// <summary>
        ///     Multiplies all components with the scalar.
        /// </summary>
        /// <param name="scalar"></param>
        /// <param name="tuple"></param>
        /// <returns></returns>
        public static Tuple4 operator *(Tuple4 tuple, double scalar)
        {
            // Exact duplicate of the same operator with switched order (to save extra method call). Remember to adjust both, if changes occur.
            return new Tuple4(scalar*tuple.X, scalar*tuple.Y, scalar*tuple.Z, scalar*tuple.W);
        }

        public bool Equals(Tuple4 other)
        {
            return X.Equals(other.X) && Y.Equals(other.Y) && Z.Equals(other.Z) && W.Equals(other.W);
        }

        public override bool Equals(object obj)
        {
            if (ReferenceEquals(null, obj)) return false;
            return obj is Tuple4 && Equals((Tuple4) obj);
        }

        public override int GetHashCode()
        {
            unchecked
            {
                var hashCode = X.GetHashCode();
                hashCode = (hashCode*397) ^ Y.GetHashCode();
                hashCode = (hashCode*397) ^ Z.GetHashCode();
                hashCode = (hashCode*397) ^ W.GetHashCode();
                return hashCode;
            }
        }
    }
}
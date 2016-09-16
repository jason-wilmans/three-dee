using ZeroTypes;

namespace DiagramLogic.Interface.Elements
{
    public class Ellipsoid : IDiagramElement
    {
        /// <summary>
        /// <inheritdoc />
        /// </summary>
        public int Id { get; set; }

        /// <summary>
        /// <inheritdoc />
        /// </summary>
        public Tuple3 Position { get; set; }

        /// <summary>
        /// <inheritdoc />
        /// </summary>
        public Tuple3 Rotation { get; set; }

        /// <summary>
        /// <inheritdoc />
        /// </summary>
        public Tuple3 Scale { get; set; }

        /// <summary>
        /// <inheritdoc />
        /// </summary>
        public IDiagramElement Parent { get; set; }

        /// <summary>
        /// <inheritdoc />
        /// </summary>
        /// <returns></returns>
        public IDiagramElement CreateCopy()
        {
            return new Ellipsoid
            {
                Id = Id,
                Position = Position,
                Rotation = Rotation,
                Scale = Scale,
                Parent = Parent
            };
        }

        protected bool Equals(IDiagramElement other)
        {
            return Id == other.Id;
        }

        public override bool Equals(object obj)
        {
            if (object.ReferenceEquals(null, obj)) return false;
            if (object.ReferenceEquals(this, obj)) return true;
            if (!(obj is IDiagramElement)) return false;
            return Equals((IDiagramElement) obj);
        }

        public override int GetHashCode()
        {
            return Id;
        }
    }
}

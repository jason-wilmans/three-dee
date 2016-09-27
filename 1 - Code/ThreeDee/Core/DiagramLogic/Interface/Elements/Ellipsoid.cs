using ZeroTypes;

namespace DiagramLogic.Interface.Elements
{
    public class Ellipsoid : ADiagramElement
    {
        /// <summary>
        /// <inheritdoc />
        /// </summary>
        /// <returns></returns>
        public override ADiagramElement CreateCopy()
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

        protected bool Equals(ADiagramElement other)
        {
            return Id == other.Id;
        }

        public override bool Equals(object obj)
        {
            if (ReferenceEquals(null, obj)) return false;
            if (ReferenceEquals(this, obj)) return true;
            if (!(obj is ADiagramElement)) return false;
            return Equals((ADiagramElement) obj);
        }

        public override int GetHashCode()
        {
            return Id;
        }
    }
}

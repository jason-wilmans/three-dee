using System;
using System.Collections.Generic;
using DiagramLogic.Interface;
using DiagramLogic.Interface.Elements;
using ZeroTypes;

namespace DiagramLogic.Implementation
{
    /// <summary>
    /// This class represents a single diagram.
    /// </summary>
    public class Diagram : IDiagram
    {
        private readonly IDiagramElementInstanceFactory _instanceFactory;

        /// <summary>
        /// A name to identify this diagram.
        /// </summary>
        public string Name { get; set; }

        public ICollection<ADiagramElement> Elements { get; }

        public event Action<ADiagramElement> ElementAdded;

        private int _nextElementId;

        /// <summary>
        /// Diagram constructor. A name is needed.
        /// </summary>
        /// <param name="name">Not null, not only whitespaces</param>
        /// <param name="instanceFactory">!= null</param>
        internal Diagram(string name, IDiagramElementInstanceFactory instanceFactory)
        {
            _instanceFactory = instanceFactory;
            if (string.IsNullOrEmpty(name))
            {
                throw new ArgumentException("A diagram must have a meaningful name, but the argument was: '" + name + "'", nameof(name));
            }
            Name = name;
            Elements = new List<ADiagramElement>();
        }

        public ADiagramElement Add(DiagramElementType elementType, Tuple3? position = null)
        {
            ADiagramElement element = _instanceFactory.GetInstanceForType(elementType);
            Add(element, position);
            return element;
        }

        /// <summary>
        /// Adds the element to this diagram.
        /// </summary>
        /// <param name="element">Not null</param>
        /// <param name="position">Optional starting position. <br/>
        /// If null, the diagram's geometric center is used.</param>
        internal void Add(ADiagramElement element, Tuple3? position = null)
        {
            element.Parent = null;
            element.Id = _nextElementId;
            Elements.Add(element);

            element.Position = position ?? CalculateGeometricCenter();

            _nextElementId++;
            ElementAdded?.Invoke(element);
        }

        /// <summary>
        /// Copies the element and places it in this diagram (with a slightly offsetted position).
        /// </summary>
        /// <param name="element">Not null, already contained.</param>
        public ADiagramElement Copy(ADiagramElement element)
        {
            if (!Elements.Contains(element))
            {
                throw new ArgumentException("The given element can't be copied, because it is not part of this diagram.", nameof(element));
            }

            Tuple3 offset = new Tuple3(
                Math.Abs(element.Position.X * 0.1 * -1),
                Math.Abs(element.Position.Y * 0.1 * -1),
                Math.Abs(element.Position.Z * 0.1 * -1)
                );

            ADiagramElement copy = element.CreateCopy();
            copy.Position = copy.Position - offset;

            Add(copy);

            return copy;
        }

        public Tuple3 CalculateGeometricCenter()
        {
            if(Elements.Count < 1) return new Tuple3();

            double x = 0;
            double y = 0;
            double z = 0;
            
            foreach (ADiagramElement diagramElement in Elements)
            {
                x += diagramElement.Position.X;
                y += diagramElement.Position.Y;
                z += diagramElement.Position.Z;
            }

            Tuple3 center = new Tuple3(x / Elements.Count, y / Elements.Count, z / Elements.Count);
            return center;
        }

        /// <summary>
        /// If the element was part of the diagram, removes it.
        /// </summary>
        /// <param name="element">Not null.</param>
        public void Delete(ADiagramElement element)
        {
            Elements.Remove(element);
        }

        #region Equality Members

        protected bool Equals(Diagram other)
        {
            return Equals(Elements, other.Elements) && string.Equals(Name, other.Name);
        }

        public override bool Equals(object obj)
        {
            if (ReferenceEquals(null, obj)) return false;
            if (ReferenceEquals(this, obj)) return true;
            var other = obj as Diagram;
            return other != null && Equals(other);
        }

        public override int GetHashCode()
        {
            unchecked
            {
                return ((Elements != null ? Elements.GetHashCode() : 0)*397) ^ (Name != null ? Name.GetHashCode() : 0);
            }
        }

        #endregion

    }
}

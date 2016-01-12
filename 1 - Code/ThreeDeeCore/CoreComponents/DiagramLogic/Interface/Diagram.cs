using System;
using System.Collections;
using System.Collections.Generic;
using DiagramLogic.Interface.Elements;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using ZeroTypes;

namespace DiagramLogic.Interface
{
    /// <summary>
    /// This class represents a single diagram.
    /// </summary>
    [JsonObject(MemberSerialization.OptIn)]
    public class Diagram : IEnumerable<IDiagramElement>
    {
        /// <summary>
        /// A name to identify this diagram.
        /// </summary>
        [JsonProperty]
        public string Name { get; set; }

        [JsonProperty("Elements")]
        private readonly ICollection<IDiagramElement> _topLevelElements;

        private int _nextElementId;

        /// <summary>
        /// Diagram constructor. A name is needed.
        /// </summary>
        /// <param name="name"></param>
        public Diagram(string name)
        {
            if (string.IsNullOrEmpty(name))
            {
                throw new ArgumentException("A diagram must have a meaningful name, but the argument was: '" + name + "'", "name");
            }
            Name = name;
            _topLevelElements = new List<IDiagramElement>();
        }

        /// <summary>
        /// Adds the element to this diagram.
        /// </summary>
        /// <param name="element">Not null</param>
        public void Add(IDiagramElement element)
        {
            element.Parent = null;
            element.Id = _nextElementId;
            _topLevelElements.Add(element);

            _nextElementId++;
        }

        /// <summary>
        /// Copies the element and places it i this diagram (with a slightly offsetted position).
        /// </summary>
        /// <param name="element">Not null, already contained.</param>
        public void Copy(IDiagramElement element)
        {
            if (!_topLevelElements.Contains(element))
            {
                throw new ArgumentException("The given element can't be copied, because it is not part of this diagram.", "element");
            }

            Tuple3 offset = new Tuple3(
                Math.Abs(element.Position.X * 0.1 * -1),
                Math.Abs(element.Position.Y * 0.1 * -1),
                Math.Abs(element.Position.Z * 0.1 * -1)
                );

            IDiagramElement copy = element.CreateCopy();
            copy.Position = copy.Position - offset;

            Add(copy);
        }

        /// <summary>
        /// If the element was part of the diagram, removes it.
        /// </summary>
        /// <param name="element">Not null.</param>
        public void Delete(IDiagramElement element)
        {
            _topLevelElements.Remove(element);
        }

        public IEnumerator<IDiagramElement> GetEnumerator()
        {
            return _topLevelElements.GetEnumerator();
        }

        IEnumerator IEnumerable.GetEnumerator()
        {
            return GetEnumerator();
        }
    }
}

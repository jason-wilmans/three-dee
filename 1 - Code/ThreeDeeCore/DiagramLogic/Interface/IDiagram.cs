using System;
using System.Collections.Generic;
using DiagramLogic.Interface.Elements;
using ZeroTypes;

namespace DiagramLogic.Interface
{
    public interface IDiagram
    {
        /// <summary>
        /// A name to identify this diagram.
        /// </summary>
        string Name { get; set; }

        ICollection<IDiagramElement> Elements { get; }

        event Action<IDiagramElement> ElementAdded;

        /// <summary>
        /// Adds the element to this diagram.
        /// </summary>
        /// <param name="element">Not null</param>
        /// <param name="recommendedSpawnPosition">see other overload</param>
        void Add(IDiagramElement element, Tuple3? recommendedSpawnPosition = null);

        void Add(DiagramElementType elementType, Tuple3? recommendedSpawnPosition = null);

        /// <summary>
        /// Copies the element and places it i this diagram (with a slightly offsetted position).
        /// </summary>
        /// <param name="element">Not null, already contained.</param>
        void Copy(IDiagramElement element);

        Tuple3 CalculateGeometricCenter();

        /// <summary>
        /// If the element was part of the diagram, removes it.
        /// </summary>
        /// <param name="element">Not null.</param>
        void Delete(IDiagramElement element);
    }
}
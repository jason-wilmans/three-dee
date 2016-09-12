using System.Xml;
using ZeroTypes;

namespace DiagramLogic.Interface.Elements
{
    /// <summary>
    /// Any visual element that can be part of a diagram.
    /// </summary>
    public interface IDiagramElement
    {
        /// <summary>
        /// The elements id within the diagram
        /// </summary>
        int Id { get; set; }

        /// <summary>
        /// The geometric center of the diagram element relative to it's parent position.
        /// </summary>
        Tuple3 Position { get; set; }

        /// <summary>
        /// Rotation along the axis in euler angles.
        /// </summary>
        Tuple3 Rotation { get; set; }

        /// <summary>
        /// This elements scale, relative to it's parent element.
        /// </summary>
        Tuple3 Scale { get; set; }

        /// <summary>
        /// The reference to this element's parent in the diagram. All position options are relative to this parent.
        /// </summary>
        /// <remarks>If the element is at the top level in the diagram, Parent is null and all position options are absolute.</remarks>
        IDiagramElement Parent { get; set; }

        /// <summary>
        /// Returns a deep copy of this diagram element.
        /// </summary>
        /// <returns></returns>
        IDiagramElement CreateCopy();
    }
}
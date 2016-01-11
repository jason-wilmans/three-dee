using ZeroTypes;

namespace DiagramLogic.Interface
{
    /// <summary>
    /// Any visual element that can be part of a diagram.
    /// </summary>
    public interface IDiagramElement
    {
        /// <summary>
        /// 
        /// </summary>
        IDiagramElement Parent { get; set; }

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
    }
}
using System;
using System.Collections.Generic;
using System.Diagnostics.Contracts;
using System.Runtime.CompilerServices;
using DiagramLogic.Interface.Elements;
using DiagramLogic.Interface.Exceptions;
using ZeroTypes;
using ZeroTypes.Exceptions;

[assembly: InternalsVisibleTo("CoreFacade")]
[assembly: InternalsVisibleTo("TestDiagramLogic")]

namespace DiagramLogic.Interface
{
    /// <summary>
    /// 
    /// </summary>
    public interface IDiagramComponent
    {
        /// <summary>
        /// Returns descriptions for all available element types.
        /// </summary>
        /// <returns></returns>
        IEnumerable<DiagramElementType> GetAvailableElementTypes();

        /// <summary>
        /// The diagram currently worked with.
        /// </summary>
        IDiagram CurrentDiagram { get; }

        /// <summary>
        /// The position, the GUI recommends the model to spawn new elements at.
        /// </summary> 
        /// <remarks>It is based on the current camera position. It may not be followed 100%.</remarks>
        Tuple3 RecommendedSpawnPosition { get; set; }

        /// <summary>
        /// Called, if the currently loaded diagram is changed. Can be null.
        /// </summary>
        event Action<IDiagram> DiagramChanged;

        /// <summary>
        /// Creates a new diagram 
        /// </summary>
        /// <param name="diagramName"></param>
        /// <exception cref="UnsavedChangesException"></exception>
        void CreateNewDiagram(string diagramName);

        /// <summary>
        /// Saves a JSON serialized representation of the diagram in the file with the given info.
        /// </summary>
        /// <param name="diagram">Not null.</param>
        /// <param name="file">Target file.</param>
        /// <param name="overWrite">If true, file will be overwritten.</param>
        /// <exception cref="FileAlreadyExistsException">If the gven file already xists and overwriting is not enabled.</exception>
        /// <exception cref="TechnicalException">If any technical error occurs.</exception>
        void Save(string file, bool overWrite);

        /// <summary>
        /// Returns a deserialized instance of a JSON serialized representation of a diagram.
        /// </summary>
        /// <param name="file">Not null.</param>
        /// <returns></returns>
        /// <exception cref="TechnicalException">If any technical error occurs.</exception>
        void Load(string file);
    }
}

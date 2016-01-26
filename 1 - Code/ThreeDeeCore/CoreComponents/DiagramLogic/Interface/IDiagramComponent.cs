using System.IO;
using System.Runtime.CompilerServices;
using DiagramLogic.Interface.Exceptions;
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
        /// The diagram currently worked with.
        /// </summary>
        Diagram CurrentDiagram { get; }

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
        void Save(FileInfo file, bool overWrite);

        /// <summary>
        /// Returns a deserialized instance of a JSON serialized representation of a diagram.
        /// </summary>
        /// <param name="file">Not null.</param>
        /// <returns></returns>
        /// <exception cref="TechnicalException">If any technical error occurs.</exception>
        void Load(FileInfo file);
    }
}

using DiagramLogic.Interface;
using SiliconStudio.Xenko.Engine;
using SiliconStudio.Xenko.Rendering;

namespace UI.Resources
{
    public interface IResourceProvider
    {
        /// <summary>
        /// Returns an instantiated entity
        /// </summary>
        /// <returns></returns>
        /// <exception cref="MalformedPrefabException"></exception>
        Entity GetNewDiagramElement();

        /// <summary>
        /// Returns a model instance for the given element type.
        /// </summary>
        /// <param name="type"></param>
        /// <returns></returns>
        Model GetModelForElementType(DiagramElementType type);
    }
}
using DiagramLogic.Interface;
using SiliconStudio.Xenko.Engine;

namespace UI.Resources
{
    public interface IResourceProvider
    {
        /// <summary>
        /// Returns an instantiated entity
        /// </summary>
        /// <param name="elementType"></param>
        /// <returns></returns>
        /// <exception cref="MalformedPrefabException"></exception>
        Entity GetDiagramElement(DiagramElementType elementType);

        Entity GetUiEntity();
    }
}
using DiagramLogic.Interface;
using SiliconStudio.Xenko.Engine;

namespace UI.Resources
{
    public interface IResourceProvider
    {
        /// <summary>
        /// Returns an instantiated entity
        /// </summary>
        /// <returns></returns>
        /// <exception cref="MalformedPrefabException"></exception>
        Entity GetDiagramNewElement();
    }
}
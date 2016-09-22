using System.Linq;
using DiagramLogic.Interface;
using SiliconStudio.Core.Collections;
using SiliconStudio.Core.Serialization.Assets;
using SiliconStudio.Xenko.Engine;

namespace UI.Resources
{
    public class ResourceProvider : IResourceProvider
    {
        private readonly ContentManager _assetManager;
        private const string DiagramElementPrefix = "Diagrams/Elements/";

        public ResourceProvider(ContentManager assetManager)
        {
            _assetManager = assetManager;
        }

        public Entity GetDiagramElement(DiagramElementType elementType)
        {
            string url = $"{DiagramElementPrefix}{elementType.TechnicalName}/{elementType.TechnicalName}";
            return SingleEntityPrefab(url);
        }

        public Entity GetUiEntity()
        {
            return SingleEntityPrefab("UI");
        }

        private Entity SingleEntityPrefab(string url)
        {
            Prefab prefab = _assetManager.IsLoaded(url) ? _assetManager.Get<Prefab>(url) : _assetManager.Load<Prefab>(url);
            FastCollection<Entity> entities = prefab.Instantiate();

            if (entities.Count != 1) throw new MalformedPrefabException(url, entities.Count);

            return entities.First();
        }
    }
}

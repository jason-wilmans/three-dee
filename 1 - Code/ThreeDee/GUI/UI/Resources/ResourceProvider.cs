using System.Linq;
using SiliconStudio.Core.Collections;
using SiliconStudio.Core.Serialization.Assets;
using SiliconStudio.Xenko.Engine;

namespace UI.Resources
{
    public class ResourceProvider : IResourceProvider
    {
        private readonly ContentManager _assetManager;
        private const string DiagramElementUrl = "Diagrams/Elements/DiagramElement";

        public ResourceProvider(ContentManager assetManager)
        {
            _assetManager = assetManager;
        }

        public Entity GetNewDiagramElement()
        {
            return SingleEntityPrefab(DiagramElementUrl);
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

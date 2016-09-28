using System.Linq;
using DiagramLogic.Interface;
using SiliconStudio.Core.Collections;
using SiliconStudio.Core.Serialization.Assets;
using SiliconStudio.Xenko.Engine;
using SiliconStudio.Xenko.Rendering;

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

        public Entity GetNewDiagramElement()
        {
            return SingleEntityPrefab($"{DiagramElementPrefix}DiagramElement");
        }

        public Model GetModelForElementType(DiagramElementType type)
        {
            string url = $"{DiagramElementPrefix}Models/{type.TechnicalName}";
            if (!_assetManager.IsLoaded(url))
            {
                return _assetManager.Load<Model>(url);
            }

            return _assetManager.Get<Model>(url).Instantiate();
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

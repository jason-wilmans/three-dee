using System;

namespace UI.Resources
{
    /// <summary>
    /// Thrown, if a prefab has not exactly one entity on the top level, where it was expected to have exactly one.
    /// </summary>
    public class MalformedPrefabException : Exception
    {
        public MalformedPrefabException(string url, int nrOfEntities)
            : base($"The prefab '{url}' was expected to have exactly one child entity, but had {nrOfEntities}.")
        {
        }
    }
}

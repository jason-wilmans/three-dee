using System.Collections.Generic;
using SiliconStudio.Core;
using SiliconStudio.Xenko.Engine;

namespace UI3D
{
    [DataContract]
    public abstract class AContainerViewElement3D : AViewElement3D
    {
        public IEnumerable<AViewElement3D> Children => _children;

        private readonly IList<AViewElement3D> _children;

        protected AContainerViewElement3D()
        {
            _children = new List<AViewElement3D>();
        }

        public void AddChild(AViewElement3D element)
        {
            Entity.AddChild(element.Entity);
            _children.Add(element);
        }

        public void RemoveChild(AViewElement3D element)
        {
            Entity.RemoveChild(element.Entity);
            _children.Remove(element);
        }
    }
}

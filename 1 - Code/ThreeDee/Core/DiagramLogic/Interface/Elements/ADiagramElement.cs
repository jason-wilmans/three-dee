using ZeroTypes;

namespace DiagramLogic.Interface.Elements
{
    public abstract class ADiagramElement
    {
        public virtual int Id { get; internal set; }
        public virtual DiagramElementType Type { get; }
        public virtual Tuple3 Position { get; internal set; }
        public virtual Tuple3 Rotation { get; internal set; }
        public virtual Tuple3 Scale { get; internal set; }
        public virtual ADiagramElement Parent { get; internal set; }

        public abstract ADiagramElement CreateCopy();
    }
}

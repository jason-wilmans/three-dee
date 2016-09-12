using System;
using ZeroTypes;

namespace DiagramLogic.Interface.Elements
{
    public class Cuboid : IDiagramElement
    {
        public int Id { get; set; }
        public Tuple3 Position { get; set; }
        public Tuple3 Rotation { get; set; }
        public Tuple3 Scale { get; set; }
        public IDiagramElement Parent { get; set; }
        public IDiagramElement CreateCopy()
        {
            throw new NotImplementedException();
        }
    }
}

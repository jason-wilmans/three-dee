﻿namespace DiagramLogic.Interface.Elements
{
    public class Cuboid : ADiagramElement
    {
        /// <summary>
        /// Gets or sets.
        /// </summary>
        public override DiagramElementType Type { get; }
        
        public Cuboid()
        {
            Type = new DiagramElementType(nameof(Cuboid), GetType());
        }
        
        public override ADiagramElement CreateCopy()
        {
            return new Cuboid
            {
                Id = Id, //TODO: Is there a good way to control this via e.g. the diagram?
                Parent = Parent,
                Position = Position,
                Rotation = Rotation,
                Scale = Scale
            };
        }
    }
}

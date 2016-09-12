using System;
using System.Reflection;
using DiagramLogic.Interface;
using DiagramLogic.Interface.Elements;

namespace DiagramLogic.Implementation
{
    internal class DiagramElementInstanceFactory : IDiagramElementInstanceFactory
    {
        public IDiagramElement GetInstanceForType(DiagramElementType elementType)
        {
            ConstructorInfo ctor = elementType.Type.GetConstructor(new Type[0]);
            return ctor.Invoke(new object[0]) as IDiagramElement;
        }
    }
}
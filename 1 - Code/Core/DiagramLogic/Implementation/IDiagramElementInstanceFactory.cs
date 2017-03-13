using DiagramLogic.Interface;
using DiagramLogic.Interface.Elements;

namespace DiagramLogic.Implementation
{
    internal interface IDiagramElementInstanceFactory
    {
        ADiagramElement GetInstanceForType(DiagramElementType elementType);
    }
}
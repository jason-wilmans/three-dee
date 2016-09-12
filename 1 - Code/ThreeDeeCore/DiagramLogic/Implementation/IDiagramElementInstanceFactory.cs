using DiagramLogic.Interface;
using DiagramLogic.Interface.Elements;

namespace DiagramLogic.Implementation
{
    public interface IDiagramElementInstanceFactory
    {
        IDiagramElement GetInstanceForType(DiagramElementType elementType);
    }
}
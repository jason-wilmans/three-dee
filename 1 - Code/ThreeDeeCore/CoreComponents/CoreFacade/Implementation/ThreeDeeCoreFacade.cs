using System.IO;
using CoreFacade.Interface;
using DiagramLogic.Interface;

namespace CoreFacade.Implementation
{
    class ThreeDeeCoreFacade : IThreeDeeCore
    {
        private readonly IDiagramComponent _diagramComponent;

        public ThreeDeeCoreFacade(IDiagramComponent diagramComponent)
        {
            _diagramComponent = diagramComponent;
        }

        public void Save(Diagram diagram, FileInfo file, bool overWrite)
        {
            _diagramComponent.Save(diagram, file, overWrite);
        }

        public Diagram Load(FileInfo file)
        {
            return _diagramComponent.Load(file);
        }
    }
}

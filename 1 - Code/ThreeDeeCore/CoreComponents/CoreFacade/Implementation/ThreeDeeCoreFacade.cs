using System.IO;
using CoreFacade.Interface;
using DiagramLogic.Interface;

namespace CoreFacade.Implementation
{
    internal class ThreeDeeCoreFacade : IThreeDeeCore
    {
        private readonly IDiagramComponent _diagramComponent;

        public ThreeDeeCoreFacade(IDiagramComponent diagramComponent)
        {
            _diagramComponent = diagramComponent;
        }

        public Diagram CurrentDiagram => _diagramComponent.CurrentDiagram;

        public void CreateNewDiagram(string diagramName)
        {
            _diagramComponent.CreateNewDiagram(diagramName);
        }

        public void Save(FileInfo file, bool overWrite)
        {
            _diagramComponent.Save(file, overWrite);
        }

        public void Load(FileInfo file)
        {
            _diagramComponent.Load(file);
        }
    }
}

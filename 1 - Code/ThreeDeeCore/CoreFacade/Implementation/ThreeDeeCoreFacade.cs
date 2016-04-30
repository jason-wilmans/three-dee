using System;
using System.Collections.Generic;
using System.IO;
using CoreFacade.Interface;
using DiagramLogic.Implementation;
using DiagramLogic.Interface;

namespace CoreFacade.Implementation
{
    internal class ThreeDeeCoreFacade : IThreeDeeCore
    {
        private readonly IDiagramComponent _diagramComponent;

        public ThreeDeeCoreFacade(IDiagramComponent diagramComponent)
        {
            _diagramComponent = diagramComponent;
            _diagramComponent.DiagramChanged += diagram => DiagramChanged?.Invoke(diagram);
        }

        public IEnumerable<DiagramElementType> GetAvailableElementTypes()
        {
            return _diagramComponent.GetAvailableElementTypes();
        }

        public IDiagram CurrentDiagram => _diagramComponent.CurrentDiagram;
        public event Action<IDiagram> DiagramChanged;

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

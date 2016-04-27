using System;
using CoreFacade.Interface;
using DiagramLogic.Interface;
using DiagramLogic.Interface.Elements;
using SiliconStudio.Xenko.Engine;

namespace ThreeDeeUi.UI.Diagrams
{
    public class DiagramViewComponent : StartupScript
    {
        private IThreeDeeCore _core;

        public DiagramViewComponent()
        {
            _core = ThreeDeeCoreFactory.GetProductionCore();
            
            _core.DiagramChanged += OnDiagramChanged;
        }

        public override void Start()
        {
            base.Start();

            if (_core.CurrentDiagram != null) InitializeVisualScene(_core.CurrentDiagram);
        }

        private void OnDiagramChanged(IDiagram diagram)
        {
            InitializeVisualScene(diagram);
            diagram.ElementAdded += AddVisualElement;
        }

        private void AddVisualElement(IDiagramElement diagramElement)
        {
            throw new NotImplementedException();
        }

        private void InitializeVisualScene(IDiagram diagram)
        {
            throw new NotImplementedException();
        }
    }
}

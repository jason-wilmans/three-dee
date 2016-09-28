using System.Linq;
using DiagramLogic.Implementation;
using DiagramLogic.Interface;
using DiagramLogic.Interface.Elements;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using ZeroTypes;

namespace Tests.TestDiagramLogic
{
    [TestClass]
    public class TestDiagramComponent
    {
        /// <summary>
        /// Create an (empty) diagram, save it, load it back and expect everything to be equal.
        /// </summary>
        [TestMethod]
        public void SimpleSavingAndLoading()
        {
            DiagramComponent diagramComponent = new DiagramComponent(null);
            diagramComponent.CreateNewDiagram("Test Diagram 1");

            ADiagramElement ellipsoid = new Ellipsoid
            {
                Position = new Tuple3(10, 20, 30),
                Scale = Tuple3.One
            };
            diagramComponent.CurrentDiagram.Add(new DiagramElementType("test", typeof(TestElement)));
            IDiagram original = diagramComponent.CurrentDiagram;
            string fileName = "testFile.3dd";
            diagramComponent.Save(fileName, true);

            diagramComponent.Load(fileName);
            IDiagram diagram = diagramComponent.CurrentDiagram;

            Assert.IsTrue(original.Name.Equals(diagram.Name), "Name was not correctly transported.");
            Assert.IsTrue(original.Elements.All(elem => diagram.Elements.Contains(elem)), "Not every element was transported.");
            Assert.IsTrue(diagram.Elements.All(elem => original.Elements.Contains(elem)), "Additional elements appeared.");
        }

        private class TestElement : ADiagramElement
        {
            public override DiagramElementType Type => new DiagramElementType(nameof(TestElement), GetType());

            public TestElement()
            {
                Type = new DiagramElementType(nameof(TestElement), GetType());
            }

            public override ADiagramElement CreateCopy()
            {
                return new TestElement
                {
                    Id = Id,
                    Parent = Parent,
                    Position = Position,
                    Scale = Scale,
                    Rotation = Rotation
                };
            }
        }
    }
}

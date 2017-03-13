using DiagramLogic.Implementation;
using DiagramLogic.Interface;
using DiagramLogic.Interface.Elements;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace Tests.TestDiagramLogic
{
    [TestClass]
    public class TestDiagram
    {
        [TestMethod]
        public void Add_WithElementType()
        {
            // Arrange
            Diagram diagramUnderTest = new Diagram("Test Diagram", new TestInstanceFactory());
            ADiagramElement addedElement = null;

            //  Act
            diagramUnderTest.Add(new DiagramElementType("Ellipsoid", typeof (Ellipsoid)));

            // Assert
            Assert.IsNotNull(addedElement);
        }
    }

    public class TestInstanceFactory : IDiagramElementInstanceFactory
    {
        public ADiagramElement GetInstanceForType(DiagramElementType elementType)
        {
            return new Ellipsoid();
        }
    }
}

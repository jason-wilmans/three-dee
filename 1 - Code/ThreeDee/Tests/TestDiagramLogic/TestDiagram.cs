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
            IDiagramElement addedElement = null;
            diagramUnderTest.ElementAdded += element => addedElement = element;

            //  Act
            diagramUnderTest.Add(new DiagramElementType("Ellipsoid", typeof (Ellipsoid)));

            // Assert
            Assert.IsNotNull(addedElement);
            Assert.IsTrue(diagramUnderTest.Elements.Contains(addedElement));
        }
    }

    public class TestInstanceFactory : IDiagramElementInstanceFactory
    {
        public IDiagramElement GetInstanceForType(DiagramElementType elementType)
        {
            return new Ellipsoid();
        }
    }
}

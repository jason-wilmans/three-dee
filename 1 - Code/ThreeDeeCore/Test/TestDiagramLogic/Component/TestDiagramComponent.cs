using System;
using System.IO;
using System.Linq;
using DiagramLogic.Implementation;
using DiagramLogic.Interface;
using DiagramLogic.Interface.Elements;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using ZeroTypes;

namespace TestDiagramLogic.Component
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
            DiagramComponent diagramComponent = new DiagramComponent();

            Diagram original = new Diagram("Test Diagram 1");
            IDiagramElement ellipsoid = new Ellipsoid {Position = new Tuple3(10, 20, 30), Scale = Tuple3.One};
            original.Add(ellipsoid);

            FileInfo file = new FileInfo("testFile.3dd");
            diagramComponent.Save(original, file, true);

            Diagram diagram = diagramComponent.Load(file);

            Assert.IsTrue(original.Name.Equals(diagram.Name), "Name was not correctly transported.");
            Assert.IsTrue(original.Elements.All(elem => diagram.Elements.Contains(elem)), "Not every element was transported.");
            Assert.IsTrue(diagram.Elements.All(elem => original.Elements.Contains(elem)), "Additional elements appeared.");
        }
    }
}

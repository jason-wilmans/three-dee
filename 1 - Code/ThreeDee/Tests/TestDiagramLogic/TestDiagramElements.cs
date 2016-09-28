using System;
using System.Dynamic;
using System.Linq;
using System.Reflection;
using DiagramLogic.Implementation;
using DiagramLogic.Interface.Elements;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace Tests.TestDiagramLogic
{
    [TestClass]
    public class TestDiagramElements
    {
        [TestMethod]
        public void Type()
        {
            // Arrange
            Type[] typesToTest = ReflectDiagramElementTypes();

            foreach (Type typeUnderTest in typesToTest)
            {
                // Act
                ADiagramElement elementInstanceUnderTest = CreateInstance(typeUnderTest);

                // Assert
                Assert.IsNotNull(elementInstanceUnderTest.Type);
                Assert.IsNotNull(elementInstanceUnderTest.Type.TechnicalName);
                Assert.IsTrue(!string.IsNullOrWhiteSpace(elementInstanceUnderTest.Type.DisplayName));
                Assert.IsTrue(elementInstanceUnderTest.Type.IsValid);
            }
        }

        private ADiagramElement CreateInstance(Type typeUnderTest)
        {
            ConstructorInfo constructor = typeUnderTest.GetConstructor(new Type[0]);
            return constructor.Invoke(new object[0]) as ADiagramElement;
        }

        private Type[] ReflectDiagramElementTypes()
        {
            Type diagramElementType = typeof (ADiagramElement);
            Assembly diagramAssembly = Assembly.GetAssembly(diagramElementType);
            Type[] result = diagramAssembly.DefinedTypes
                .Where(type => type.IsSubclassOf(diagramElementType))
                .ToArray();

            return result;
        }
    }
}

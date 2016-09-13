using System;
using System.Collections.Generic;
using System.IO;
using System.Runtime.Serialization;
using System.Text;
using DiagramLogic.Interface;
using DiagramLogic.Interface.Elements;
using Newtonsoft.Json;
using PortabilityLayer.IO;
using PortabilityLayer.ServiceRegistry;
using SiliconStudio.Core.Serialization.Serializers;
using ZeroTypes;
using ZeroTypes.Exceptions;

namespace DiagramLogic.Implementation
{
    internal class DiagramComponent : IDiagramComponent
    {
        private readonly IServiceLocator _serviceLocator;
        private readonly Encoding _encoding;
        private IDiagram _currentDiagram;
        private JsonSerializer _serializer;

        public DiagramComponent(IServiceLocator serviceLocator)
        {
            _serviceLocator = serviceLocator;

            _encoding = Encoding.UTF8;
            _serializer = new JsonSerializer();
        }

        public IEnumerable<DiagramElementType> GetAvailableElementTypes()
        {
            return new List<DiagramElementType>
            {
                new DiagramElementType("Ellipsoid", typeof(Ellipsoid)),
                new DiagramElementType("Cuboid", typeof(Cuboid))
            };
        }

        public IDiagram CurrentDiagram
        {
            get { return _currentDiagram; }
            private set
            {
                _currentDiagram = value;
                DiagramChanged?.Invoke(_currentDiagram);
            }
        }

        public Tuple3 RecommendedSpawnPosition { get; set; }

        public event Action<IDiagram> DiagramChanged;

        public void CreateNewDiagram(string diagramName)
        {
            CurrentDiagram = new Diagram(diagramName, new DiagramElementInstanceFactory());
        }

        public void Save(string file, bool overWrite)
        {
            if (CurrentDiagram == null) throw new InvalidOperationException("There is no diagram currently loaded that could be saved.");

            var fileAccess = _serviceLocator.GetServiceInstance<IFileAccess>();

            if (overWrite && fileAccess.Exists(file))
            {
                fileAccess.Delete(file);
            }
            else if (!overWrite && fileAccess.Exists(file))
            {
                throw new FileAlreadyExistsException();
            }

            var stringWriter = new StringWriter();
            _serializer.Serialize(new JsonTextWriter(stringWriter), CurrentDiagram);
                    fileStream.Write(jsonBytes, 0, jsonBytes.Length);
                    fileStream.Flush();
                    fileStream.Close();

            stringWriter.
                }
                catch (Exception exception)
                {
                    throw new TechnicalException($"Could not write file '{file.FullName}'.", exception);
                }
            }
        }

        private byte[] Serialize(Diagram diagram)
        {
            try
            {
                
                string json = TypeSerializer.SerializeToString(diagram);
                byte[] bytes = _encoding.GetBytes(json);
                return bytes;
            }
            catch (Exception exception)
            {
                throw new SerializationException("An error occurred while serializing this diagram.", exception);
            }
        }

        public void Load(string file)
        {
            file.Refresh();
            if (!file.Exists)
            {
                throw new ArgumentException($"The file '{file.FullName}' does not exist.");
            }
            using (StreamReader fileStream = file.OpenText())
            {
                string json = fileStream.ReadToEnd();
                CurrentDiagram = TypeSerializer.DeserializeFromString<Diagram>(json);
            }
        }
    }
}

using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text;
using DiagramLogic.Interface;
using DiagramLogic.Interface.Elements;
using Newtonsoft.Json;
using PortabilityLayer.IO;
using ZeroTypes;
using ZeroTypes.Exceptions;

namespace DiagramLogic.Implementation
{
    internal class DiagramComponent : IDiagramComponent
    {public Tuple3 RecommendedSpawnPosition { get; set; }

        public event Action<IDiagram> DiagramChanged;

        private readonly IFileAccess _fileAccess;
        private readonly Encoding _encoding;
        private IDiagram _currentDiagram;
        private readonly JsonSerializer _serializer;
        private DiagramElementType _selectedElement;
        private List<DiagramElementType> _availableElements;

        public DiagramComponent(IFileAccess fileAccess)
        {
            _fileAccess = fileAccess;
            _encoding = Encoding.UTF8;
            _serializer = new JsonSerializer();
            FindAvailableElementTypes();
            _selectedElement = _availableElements.First();
        }

        private void FindAvailableElementTypes()
        {
            _availableElements = new List<DiagramElementType>
            {
                new DiagramElementType("Ellipsoid", typeof(Ellipsoid)),
                new DiagramElementType("Cuboid", typeof(Cuboid))
            };
        }

        public event Action<IDiagramElement> ElementAdded;

        public IEnumerable<DiagramElementType> GetAvailableElementTypes()
        {
            return _availableElements;
        }

        public void SelectElementType(DiagramElementType elementType)
        {
            if(!GetAvailableElementTypes().Any(type => type.Equals(elementType))) throw new ArgumentException($"Unknown element type: {elementType.TechnicalName}", nameof(elementType));
            _selectedElement = elementType;
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

        public void CreateNewDiagram(string diagramName)
        {
            CurrentDiagram = new Diagram(diagramName, new DiagramElementInstanceFactory());
        }

        public void Save(string file, bool overWrite)
        {
            if (CurrentDiagram == null) throw new InvalidOperationException("There is no diagram currently loaded that could be saved.");

            if (overWrite && _fileAccess.Exists(file))
            {
                _fileAccess.Delete(file);
            }
            else if (!overWrite && _fileAccess.Exists(file))
            {
                throw new FileAlreadyExistsException();
            }

            try
            {
                var stringWriter = new StringWriter(CultureInfo.InvariantCulture);
                _serializer.Serialize(new JsonTextWriter(stringWriter), CurrentDiagram);
                _fileAccess.WriteFile(file, stringWriter.ToString());
            }
            catch (Exception exception)
            {
                throw new TechnicalException($"Could not write file '{file}'.", exception);
            }
        }

        public void Load(string file)
        {
            if (!_fileAccess.Exists(file))
            {
                throw new ArgumentException($"The file '{file}' does not exist.");
            }

            try
            {
                string serialized = _fileAccess.LoadFile(file);
                var jsonTextReader = new JsonTextReader(new StringReader(serialized));
                CurrentDiagram = _serializer.Deserialize<Diagram>(jsonTextReader);
            }
            catch (Exception exception)
            {
                throw new TechnicalException($"Could not load file '{file}'.", exception);
            }
        }
    }
}

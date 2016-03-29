using System;
using System.IO;
using System.Runtime.Serialization;
using System.Text;
using DiagramLogic.Interface;
using ServiceStack.Text;
using ZeroTypes.Exceptions;

namespace DiagramLogic.Implementation
{
    internal class DiagramComponent : IDiagramComponent
    {
        
        private readonly Encoding _encoding;

        public DiagramComponent()
        {
            
            _encoding = Encoding.UTF8;
        }

        public Diagram CurrentDiagram { get; internal set; }

        public void CreateNewDiagram(string diagramName)
        {
            CurrentDiagram = new Diagram(diagramName);
        }

        public void Save(FileInfo file, bool overWrite)
        {
            if (CurrentDiagram == null) throw new InvalidOperationException("There is no diagram currently loaded that could be saved.");

            file.Refresh();
            if (overWrite && file.Exists)
            {
                file.Delete();
            }
            else if (!overWrite && file.Exists)
            {
                throw new FileAlreadyExistsException();
            }

            using (FileStream fileStream = file.OpenWrite())
            {
                try
                {
                    byte[] jsonBytes = Serialize(CurrentDiagram);
                    fileStream.Write(jsonBytes, 0, jsonBytes.Length);
                    fileStream.Flush();
                    fileStream.Close();
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

        public void Load(FileInfo file)
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

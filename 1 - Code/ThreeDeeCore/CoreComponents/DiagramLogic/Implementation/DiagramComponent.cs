using System;
using System.IO;
using System.Text;
using DiagramLogic.Interface;
using Newtonsoft.Json;
using ZeroTypes.Exceptions;

namespace DiagramLogic.Implementation
{
    internal class DiagramComponent : IDiagramComponent
    {
        private readonly JsonSerializerSettings _settings;
        private readonly Encoding _encoding;

        public DiagramComponent()
        {
            _settings = new JsonSerializerSettings();
            _settings.Formatting = Formatting.Indented;
            _encoding = Encoding.UTF8;
        }

        public void Save(Diagram diagram, FileInfo file, bool overWrite)
        {
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
                    string json = JsonConvert.SerializeObject(diagram, _settings);
                    byte[] bytes = _encoding.GetBytes(json);
                    fileStream.Write(bytes, 0, bytes.Length);
                    fileStream.Flush();
                    fileStream.Close();
                }
                catch (Exception exception)
                {
                    throw new TechnicalException($"Could not write file '{file.FullName}'.", exception);
                }
            }
        }

        public Diagram Load(FileInfo file)
        {
            using (StreamReader fileStream = file.OpenText())
            {
                string json = fileStream.ReadToEnd();
                Diagram diagram = JsonConvert.DeserializeObject<Diagram>(json);
                return diagram;
            }
        }
    }
}

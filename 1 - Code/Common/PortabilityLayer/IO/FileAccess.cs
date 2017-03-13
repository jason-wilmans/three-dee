using System;

namespace PortabilityLayer.IO
{
    public class FileAccess : IFileAccess
    {
        public bool Exists(string file)
        {
            throw new NotImplementedException();
        }

        public void Delete(string file)
        {
            throw new NotImplementedException();
        }

        public void WriteFile(string file, string content)
        {
            throw new NotImplementedException();
        }

        public string LoadFile(string file)
        {
            throw new NotImplementedException();
        }
    }
}

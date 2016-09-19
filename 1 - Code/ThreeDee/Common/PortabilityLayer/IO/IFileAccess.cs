using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PortabilityLayer.IO
{
    public interface IFileAccess
    {
        bool Exists(string file);
        void Delete(string file);
        void WriteFile(string file, string content);
        string LoadFile(string file);
    }
}

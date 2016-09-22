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

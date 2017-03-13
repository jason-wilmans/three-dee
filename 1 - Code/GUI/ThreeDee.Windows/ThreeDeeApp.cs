using SiliconStudio.Xenko.Engine;

namespace ThreeDee
{
    class ThreeDeeApp
    {
        static void Main(string[] args)
        {
            using (var game = new Game())
            {
                game.Run();
            }
        }
    }
}

using SiliconStudio.Xenko.Engine;

namespace ThreeDeeUi
{
    class ThreeDeeUiApp
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

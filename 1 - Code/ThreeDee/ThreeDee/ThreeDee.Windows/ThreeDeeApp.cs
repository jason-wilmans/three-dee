using SiliconStudio.Xenko.Engine;

namespace ThreeDee
{
    class ThreeDeeApp
    {
        static void Main(string[] args)
        {
            using (var game = new Game())
            {
                game.GraphicsDeviceManager.PreferredBackBufferWidth = 1920;
                game.GraphicsDeviceManager.PreferredBackBufferHeight = 1080;
                //game.GraphicsDeviceManager.IsFullScreen = false;
                game.Run();
            }
        }
    }
}

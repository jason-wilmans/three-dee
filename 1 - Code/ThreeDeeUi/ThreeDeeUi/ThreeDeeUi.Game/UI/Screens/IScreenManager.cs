namespace ThreeDeeUi.UI.Screens
{
    public interface IScreenManager
    {
        void ChangeTo(Screen screen);

        void QuitProgram();
    }
}
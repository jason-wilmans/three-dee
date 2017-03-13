namespace UI.Diagrams
{
    public class HandlePosition
    {
        public static readonly HandlePosition Top = new HandlePosition(0);
        public static readonly HandlePosition TopRight = new HandlePosition(1 / 8.0f);
        public static readonly HandlePosition Right = new HandlePosition(2 / 8.0f);
        public static readonly HandlePosition BottomRight = new HandlePosition(3 / 8.0f);
        public static readonly HandlePosition Bottom = new HandlePosition(4 / 8.0f);
        public static readonly HandlePosition BottomLeft = new HandlePosition(5 / 8.0f);
        public static readonly HandlePosition Left = new HandlePosition(6 / 8.0f);
        public static readonly HandlePosition TopLeft = new HandlePosition(7 / 8.0f);

        public static readonly HandlePosition[] Values =
        {
            Top,
            TopRight,
            Right,
            BottomRight,
            Bottom,
            BottomLeft,
            Left,
            TopLeft
        };

        public float Angle { get; }

        public HandlePosition(float angle)
        {
            Angle = angle + 0.5f;
        }
    }
}
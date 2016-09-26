using SiliconStudio.Core.Mathematics;

namespace UI3D.EventArgs
{
    public class MouseClickEventArgs : UI3DEventArgs
    {
        public Vector2 ScreenPosition { get; }

        public Vector3 WorldHitPoint { get; }

        public MouseClickEventArgs(Vector2 screenPosition, Vector3 worldHitPoint)
        {
            ScreenPosition = screenPosition;
            WorldHitPoint = worldHitPoint;
        }
    }
}
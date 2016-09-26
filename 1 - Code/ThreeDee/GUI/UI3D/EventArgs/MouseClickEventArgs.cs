
using SiliconStudio.Core;
using SiliconStudio.Core.Mathematics;

namespace UI3D.EventArgs
{
    [DataContract]
    public class MouseClickEventArgs : Ui3DEventArgs
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
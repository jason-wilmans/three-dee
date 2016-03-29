using SiliconStudio.Xenko.Engine;
using System;
using SiliconStudio.Core;
using SiliconStudio.Core.Mathematics;
using SiliconStudio.Xenko.Input;

namespace ThreeDee
{
    [DataContract]
    public class CameraRigScript : SyncScript
    {
        [DataMember]
        public TransformComponent JointTransform;

        private const float ScrollDelta = 0.005f;
        private const float ScrollingSpeed = 0.05f;
        private const float PanSpeed = 1.0f;

        private TransformComponent _transform;
        private Vector2 _oldMousePosition;
        
        public override void Start()
        {
            _transform = Entity.GetOrCreate<TransformComponent>();
        }

        public override void Update()
        {
            Scrolling();
            Panning();
        }
        
        #region Scrolling

        public void Scrolling()
        {
            if (Math.Abs(Input.MouseWheelDelta) > ScrollDelta)
            {
                var zoomDelta = JointTransform.WorldMatrix.Forward * Input.MouseWheelDelta * ScrollingSpeed;
                _transform.Position += zoomDelta * ScrollingSpeed;
            }
        }

        #endregion
        
        #region Panning

        private void Panning()
        {
            if (Input.IsMouseButtonDown(MouseButton.Left) && Input.IsMouseButtonDown(MouseButton.Right))
            {
                Vector2 delta = (Input.MousePosition - _oldMousePosition) * PanSpeed;
                _transform.Position += JointTransform.WorldMatrix.Right * delta.X;
                _transform.Position += JointTransform.WorldMatrix.Up * delta.Y;
            }

            _oldMousePosition = Input.MousePosition;
        }

        #endregion
    }
}

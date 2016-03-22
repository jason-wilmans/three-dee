using SiliconStudio.Xenko.Engine;
using System;
using SiliconStudio.Core;
using SiliconStudio.Core.Mathematics;
using SiliconStudio.Xenko.Input;

namespace ThreeDee
{
    [DataContract("CameraInputScript")]
    public class CameraInputScript : SyncScript
    {
        [DataMember]
        public float CurrentAngle;
        private const float ScrollDelta = 0.005f;
        private const float ScrollingSpeed = 0.05f;
        private const float PanSpeed = -0.05f;
        private const float PanAreaSize = 0.01f;
        private const float Distance = 2;
        private float TurnSpeed = 1.5f;

        private float _distance;
        private TransformComponent _transform;
        private Vector3 _pivot;
        private Vector2 _oldMousePosition;
        private AnimationComponent _animation;

        private CameraAngle[] _angles;
        private int _currentAngle;


        public override void Start()
        {
            _transform = Entity.GetOrCreate<TransformComponent>();
            _animation = Entity.GetOrCreate<AnimationComponent>();
            
            _currentAngle = 0;
            _angles = new[]
            {
                new CameraAngle(0, MathUtil.PiOverTwo, _transform.Position, Distance, TurnSpeed),
                new CameraAngle(MathUtil.PiOverTwo, Math.PI, _transform.Position, Distance, TurnSpeed),
                new CameraAngle(Math.PI, 1.5f * Math.PI, _transform.Position, Distance, TurnSpeed),
                new CameraAngle(1.5f*Math.PI, MathUtil.TwoPi, _transform.Position, Distance, TurnSpeed)
            };
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
                var zoomDelta = _transform.WorldMatrix.Forward * Input.MouseWheelDelta * ScrollingSpeed;
                _transform.Position += zoomDelta * ScrollingSpeed;
            }
        }

        #endregion



        #region Panning

        private void Panning()
        {
            if (Input.IsMouseButtonDown(MouseButton.Left) && Input.IsMouseButtonDown(MouseButton.Right))
            {
                Vector2 delta = Input.MousePosition - _oldMousePosition;
                _transform.Position.X += delta.X;
                _transform.Position.Y += delta.Y;
            }
            _oldMousePosition = Input.MousePosition;
        }

        #endregion
    }
}

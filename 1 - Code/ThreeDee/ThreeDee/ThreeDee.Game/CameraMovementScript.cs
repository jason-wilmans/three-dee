using System;
using SiliconStudio.Core;
using SiliconStudio.Core.Mathematics;
using SiliconStudio.Xenko.Animations;
using SiliconStudio.Xenko.Engine;
using SiliconStudio.Xenko.Input;

namespace ThreeDee
{
    [DataContract(nameof(CameraMovementScript))]
    public class CameraMovementScript : SyncScript
    {
        private const float ScrollDelta = 0.005f;
        private const float ScrollingSpeed = 0.05f;
        private const float PanSpeed = 1.0f;
        private CameraAngle[] _angles;
        private AnimationComponent _animation;
        private int _currentAngleIndex;
        private Vector2 _oldMousePosition;

        private TransformComponent _transform;

        [DataMember]
        public float CurrentAngle;

        public float Distance { get; set; }

        public float TurnSpeed { get; set; }

        public override void Start()
        {
            base.Start();

            _transform = Entity.GetOrCreate<TransformComponent>();
            _animation = Entity.GetOrCreate<AnimationComponent>();

            _angles = new[]
            {
                new CameraAngle(0, MathUtil.PiOverTwo, _transform.Position, Distance, TurnSpeed),
                new CameraAngle(MathUtil.PiOverTwo, MathUtil.PiOverTwo, _transform.Position, Distance, TurnSpeed),
                new CameraAngle(Math.PI, MathUtil.PiOverTwo, _transform.Position, Distance, TurnSpeed),
                new CameraAngle(1.5*Math.PI, MathUtil.PiOverTwo, _transform.Position, Distance, TurnSpeed)
            };

            CurrentAngle = (float)_angles[_currentAngleIndex].Angle;
        }

        private void Turning()
        {
            if (Input.IsKeyPressed(Keys.Right))
            {
                StartTurnAnimation(_angles[_currentAngleIndex].LeftAnimation);
                _currentAngleIndex = (_currentAngleIndex + 1) % _angles.Length;
            }
            else if (Input.IsKeyPressed(Keys.Left))
            {
                StartTurnAnimation(_angles[_currentAngleIndex].RightAnimation);
                _currentAngleIndex = _currentAngleIndex > 0 ? _currentAngleIndex - 1 : _angles.Length - 1;
            }

            _transform.Rotation = Quaternion.RotationY(CurrentAngle);
        }

        private void StartTurnAnimation(AnimationClip clip)
        {
            const string animationName = "MyCustomAnimation";
            _animation.Animations.Clear();
            _animation.Animations.Add(animationName, clip);

            var playingAnimation = _animation.Play(animationName);
            playingAnimation.RepeatMode = AnimationRepeatMode.PlayOnce;
        }

        public override void Update()
        {
            Scrolling();
            Panning();
            Turning();
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
                var delta = (Input.MousePosition - _oldMousePosition) * PanSpeed;
                _transform.Position += _transform.WorldMatrix.Right * delta.X;
                _transform.Position += _transform.WorldMatrix.Up * delta.Y;
            }

            _oldMousePosition = Input.MousePosition;
        }

        #endregion
    }
}
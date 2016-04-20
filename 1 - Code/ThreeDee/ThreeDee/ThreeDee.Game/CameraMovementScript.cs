using System;
using SiliconStudio.Core;
using SiliconStudio.Core.Mathematics;
using SiliconStudio.Xenko.Animations;
using SiliconStudio.Xenko.Engine;
using SiliconStudio.Xenko.Input;
using XenkoUtilities;

namespace ThreeDee
{
    [DataContract(nameof(CameraMovementScript))]
    public class CameraMovementScript : SyncScript
    {
        public float Distance { get; set; }

        public float TurnSpeed { get; set; }

        [DataMember]
        public float CurrentAngle
        {
            get { return _currentAngle; }
            set
            {
                _currentAngle = value;
                //if (Log != null)
                //{
                //    Log.Error(value.ToString());
                //}
            }
        }

        private const float ScrollDelta = 0.005f;
        private const float ScrollingSpeed = 0.05f;
        private const float PanSpeed = 1.0f;
        private CameraAngle[] _angles;
        private AnimationComponent _animation;
        private int _currentAngleIndex;
        private Vector2 _oldMousePosition;

        private TransformComponent _transform;
        private Vector3 _pivot;
        private float _currentAngle;

        public override void Start()
        {
            base.Start();

            _transform = Entity.GetOrCreate<TransformComponent>();
            _animation = Entity.GetOrCreate<AnimationComponent>();
            
            _angles = new[]
            {
                new CameraAngle(0, MathUtil.PiOverTwo, TurnSpeed),
                new CameraAngle(MathUtil.PiOverTwo, MathUtil.PiOverTwo, TurnSpeed),
                new CameraAngle(Math.PI, MathUtil.PiOverTwo, TurnSpeed),
                new CameraAngle(1.5*Math.PI, MathUtil.PiOverTwo, TurnSpeed)
            };
            
            CurrentAngle = (float) _angles[_currentAngleIndex].Angle;
            UpdatePivot();
            PositionFromAngle();
        }

        public override void Update()
        {
            Log.Error(CurrentAngle.ToString());
            if (_animation.PlayingAnimations.Count == 0)
            {
                Scrolling();
                Panning();
            }

            Turning();
            PositionFromAngle();
        }

        private void Turning()
        {
            if (Input.IsKeyPressed(Keys.Left))
            {
                StartTurnAnimation(_angles[_currentAngleIndex].HigherAnimation);
                _currentAngleIndex = (_currentAngleIndex + 1) % _angles.Length;
            }
            else if (Input.IsKeyPressed(Keys.Right))
            {
                StartTurnAnimation(_angles[_currentAngleIndex].LowerAnimation);
                _currentAngleIndex = _currentAngleIndex > 0 ? _currentAngleIndex - 1 : _angles.Length - 1;
            }
            
            _transform.LookAt(_pivot);
        }

        private void PositionFromAngle()
        {
            _transform.Position = _pivot + new Vector3(
                Distance*(float) Math.Sin(CurrentAngle),
                0,
                Distance*(float) Math.Cos(CurrentAngle)
                );
        }

        private void StartTurnAnimation(AnimationClip clip)
        {
            const string animationName = "MyCustomAnimation";
            _animation.Animations.Clear();
            _animation.Animations.Add(animationName, clip);

            var playingAnimation = _animation.Play(animationName);
            playingAnimation.RepeatMode = AnimationRepeatMode.PlayOnce;
        }

        private void UpdatePivot()
        {
            _pivot = _transform.Position + _transform.LocalMatrix.Backward * Distance;
        }


        #region Scrolling

        public void Scrolling()
        {
            if (Math.Abs(Input.MouseWheelDelta) > ScrollDelta)
            {
                var zoomDelta = _transform.LocalMatrix.Forward * Input.MouseWheelDelta * ScrollingSpeed;
                _transform.Position += zoomDelta * ScrollingSpeed;

                UpdatePivot();
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

                _pivot.Y = _transform.Position.Y;
            }

            _oldMousePosition = Input.MousePosition;
        }

        #endregion
    }
}
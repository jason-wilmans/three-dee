using SiliconStudio.Xenko.Engine;
using System;
using SiliconStudio.Core;
using SiliconStudio.Core.Mathematics;
using SiliconStudio.Xenko.Animations;
using SiliconStudio.Xenko.Input;

namespace ThreeDee
{
    [DataContract("CameraInputScript")]
    public class CameraInputScript : SyncScript
    {
        [DataMember]
        public float CurrentAngle;
        private const float ScrollDelta = 0.005f;
        private const float ScrollingSpeed = 20;
        private const float PanSpeed = -0.05f;
        private const float PanAreaSize = 0.01f;
        private const float Distance = 2;
        private float TurnSpeed = 3.0f;

        private float _distance;
        private TransformComponent _transform;
        private bool _zoom = true;
        private Vector3 _pivot;
        private Vector2 _oldMousePosition;
        private AnimationComponent _animation;

        private CameraAngle[] _angles;
        private int _currentAngle;


        public override void Start()
        {
            _transform = Entity.GetOrCreate<TransformComponent>();
            _animation = Entity.GetOrCreate<AnimationComponent>();

            _pivot = _transform.Position + _transform.WorldMatrix.Forward * Distance;
            _currentAngle = 0;
            _angles = new[]
            {
                new CameraAngle(0, Math.PI / 2, _transform.Position, Distance, TurnSpeed),
                new CameraAngle(Math.PI/2, Math.PI / 2, _transform.Position, Distance, TurnSpeed),
                new CameraAngle(Math.PI, Math.PI / 2, _transform.Position, Distance, TurnSpeed),
                new CameraAngle(1.5f*Math.PI, Math.PI / 2, _transform.Position, Distance, TurnSpeed)
            };
        }



        public override void Update()
        {
            Turning();
            Scrolling();
            Panning();
            //LookAtPivot();
        }

        private void LookAtPivot()
        {
            // get vector from position to pivot = lookTarget
            // get angle between forward & lookTarget
            // correct horizontal angle

            Vector3 targetDirection = _pivot - _transform.Position;
            float angleDelta = Vector3.Dot(targetDirection, _transform.LocalMatrix.Forward);
            angleDelta = angleDelta/(_pivot.Length()*_transform.Position.Length());
            _transform.Rotation *= new Quaternion(Vector3.UnitY, angleDelta);
        }

        private void Turning()
        {
            if (Input.IsKeyPressed(Keys.Left))
            {
                StartTurnAnimation(_angles[_currentAngle].RightAnimation);
                _currentAngle = (_currentAngle + 1)% _angles.Length;
            }
            else if (Input.IsKeyPressed(Keys.Right))
            {
                StartTurnAnimation(_angles[_currentAngle].RightAnimation);
                _currentAngle = _currentAngle == 0 ? _angles.Length - 1 : _currentAngle - 1;
            }

            _transform.Position = _pivot + Distance*
                                  new Vector3((float) Math.Sin(CurrentAngle), 0, (float) Math.Cos(CurrentAngle));
        }

        #region Scrolling

        public void Scrolling()
        {
            if (_zoom && Math.Abs(Input.MouseWheelDelta) > ScrollDelta)
            {
                var zoomDelta = _transform.WorldMatrix.Forward * Input.MouseWheelDelta * ScrollingSpeed;
                _transform.Position += zoomDelta;
            }
        }

        #endregion

        #region Turning

        private void StartTurnAnimation(AnimationClip clip)
        {
            // Add an AnimationComponent to the current entity and register our custom clip
            const string animationName = "MyCustomAnimation";

            _animation.Animations.Clear();
            _animation.Animations.Add(animationName, clip);

            // Start playing the animation right away and keep repeating it
            var playingAnimation = _animation.Play(animationName);
            playingAnimation.RepeatMode = AnimationRepeatMode.PlayOnce;
        }


        private void TurnComplete()
        {
            _zoom = true;
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

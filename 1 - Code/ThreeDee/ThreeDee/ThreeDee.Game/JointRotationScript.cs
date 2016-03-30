using System;
using SiliconStudio.Core;
using SiliconStudio.Core.Mathematics;
using SiliconStudio.Xenko.Animations;
using SiliconStudio.Xenko.Engine;
using SiliconStudio.Xenko.Input;

namespace ThreeDee
{
    [DataContract("JointRotationScript")]
    public class JointRotationScript : SyncScript
    {
        public float Distance { get; set; }

        public float TurnSpeed { get; set; }

        [DataMember]
        public float CurrentAngle;

        private TransformComponent _transform;
        private AnimationComponent _animation;
        private CameraAngle[] _angles;
        private int _currentAngleIndex;
        private Vector3 _pivot;

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
        }

        public override void Update()
        {
            Turning();
        }

        private void Turning()
        {
            if (Input.IsKeyPressed(Keys.Right))
            {
                StartTurnAnimation(_angles[_currentAngleIndex].RightAnimation);
                _currentAngleIndex = (_currentAngleIndex + 1) % _angles.Length;
            }
            else if (Input.IsKeyPressed(Keys.Left))
            {
                StartTurnAnimation(_angles[_currentAngleIndex].LeftAnimation);
                _currentAngleIndex = _currentAngleIndex > 0 ? _currentAngleIndex - 1 : _angles.Length - 1;
            }

            _transform.Position = new Vector3((float) (Math.Sin(CurrentAngle) * Distance), _transform.Position.Y, (float) (Math.Cos(CurrentAngle) * Distance));
        }

        private void StartTurnAnimation(AnimationClip clip)
        {
            _pivot = _transform.Position + _transform.WorldMatrix.Forward*Distance;

            const string animationName = "MyCustomAnimation";
            _animation.Animations.Clear();
            _animation.Animations.Add(animationName, clip);

            var playingAnimation = _animation.Play(animationName);
            playingAnimation.RepeatMode = AnimationRepeatMode.PlayOnce;
        }
    }
}

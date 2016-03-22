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
        private int _currentAngleIndex = 1;

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
        }

        public override void Update()
        {

            //_transform.Rotation = new Quaternion(Vector3.UnitY, CurrentAngle);
            _transform.Rotation = Quaternion.RotationY(CurrentAngle);

            Turning();
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
                _currentAngleIndex = _currentAngleIndex == 0 ? _angles.Length - 1 : _currentAngleIndex - 1;
            }
        }

        private void StartTurnAnimation(AnimationClip clip)
        {
            const string animationName = "MyCustomAnimation";
            _animation.Animations.Clear();
            _animation.Animations.Add(animationName, clip);

            var playingAnimation = _animation.Play(animationName);
            playingAnimation.RepeatMode = AnimationRepeatMode.PlayOnce;
        }
    }
}

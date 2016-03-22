using System;
using SiliconStudio.Core.Mathematics;
using SiliconStudio.Xenko.Animations;

namespace ThreeDee
{
    internal class CameraAngle
    {
        public Vector3 Position
        {
            get { return _position; }
            set
            {
                _position = value;
                CalculateAnimations();
            }
        }

        public float Distance
        {
            get { return _distance; }
            set
            {
                _distance = value;
                CalculateAnimations();
            }
        }

        public float TurnSpeed
        {
            get { return _turnSpeed; }
            set
            {
                _turnSpeed = value; 
                CalculateAnimations();
            }
        }

        public AnimationClip LeftAnimation { get; private set; }
        public AnimationClip RightAnimation { get; private set; }

        private readonly double _angle;
        private readonly double _angleDelta;
        private float _distance;
        private Vector3 _position;
        private float _turnSpeed;

        public CameraAngle(double angle, double angleDelta, Vector3 position, float distance, float turnSpeed)
        {
            Position = position;
            Distance = distance;
            TurnSpeed = turnSpeed;
            _angle = angle;
            _angleDelta = angleDelta;
            CalculateAnimations();
        }

        private void CalculateAnimations()
        {
            double leftNeighbour = _angle - _angleDelta;
            double rightNeighbour = _angle + _angleDelta;

            LeftAnimation = CreateTurnCurve((float)leftNeighbour, (float) _angle);
            RightAnimation = CreateTurnCurve((float)rightNeighbour, (float) _angle);
        }


        private AnimationClip CreateTurnCurve(float start, float end)
        {
            var animationClip = new AnimationClip { Duration = TimeSpan.FromSeconds(TurnSpeed) };

            AnimationCurve curve = new AnimationCurve<float>
            {
                InterpolationType = AnimationCurveInterpolationType.Linear,
                KeyFrames =
                {
                    new KeyFrameData<float>((CompressedTimeSpan) TimeSpan.FromSeconds(0.0f), start),
                    new KeyFrameData<float>((CompressedTimeSpan) TimeSpan.FromSeconds(TurnSpeed), end)
                }
            };
            
            animationClip.AddCurve($"[{nameof(JointRotationScript)}.Key].CurrentAngle", curve);
            animationClip.Optimize();

            return animationClip;
        }
    }
}
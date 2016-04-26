using System;
using SiliconStudio.Core.Mathematics;
using SiliconStudio.Xenko.Animations;

namespace ThreeDeeUi.UI.Camera
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

        public AnimationClip LowerAnimation { get; private set; }
        public AnimationClip HigherAnimation { get; private set; }

        public readonly double Angle;
        private readonly double _angleDelta;
        private float _distance;
        private Vector3 _position;
        private float _turnSpeed;
        private double _leftNeighbour;
        private double _rightNeighbour;

        public CameraAngle(double angle, double angleDelta, float turnSpeed)
        {
            TurnSpeed = turnSpeed;
            Angle = angle;
            _angleDelta = angleDelta;
            CalculateAnimations();
        }

        private void CalculateAnimations()
        {
            _leftNeighbour = Angle - _angleDelta;
            _rightNeighbour = Angle + _angleDelta;

            LowerAnimation = CreateTurnCurve((float) Angle, (float)_leftNeighbour);
            HigherAnimation = CreateTurnCurve((float)Angle, (float)_rightNeighbour);
        }


        private AnimationClip CreateTurnCurve(float start, float end)
        {
            var animationClip = new AnimationClip
            {
                Duration = TimeSpan.FromSeconds(TurnSpeed)
            };

            AnimationCurve curve = new AnimationCurve<float>
            {
                InterpolationType = AnimationCurveInterpolationType.Cubic,
                KeyFrames =
                {
                    new KeyFrameData<float>((CompressedTimeSpan) TimeSpan.FromSeconds(0.0f), start),
                    new KeyFrameData<float>((CompressedTimeSpan) TimeSpan.FromSeconds(TurnSpeed), end)
                }
            };

            animationClip.AddCurve($"[{nameof(CameraMovementScript)}.Key].CurrentAngle", curve);
            animationClip.Optimize();

            return animationClip;
        }
    }
}
using SiliconStudio.Xenko.Engine;
using System;
using System.Collections;
using SiliconStudio.Core.Mathematics;
using SiliconStudio.Xenko.Animations;
using SiliconStudio.Xenko.Input;

namespace ThreeDee
{

    public class CameraControl : SyncScript
    {
        private const string ScrollAxisName = "Mouse ScrollWheel";
        private const float ScrollDelta = 0.005f;
        private const float ScrollingSpeed = 20;
        private const float PanSpeed = -0.05f;
        private const float PanAreaSize = 0.01f;
        private const double HalfPi = 0.5 * Math.PI;
        private const double ThreeHalfPi = 3.0 / 2.0 * Math.PI;
        private const double TwoPi = 2 * Math.PI;
        private const float Distance = 25;
        private float TurnSpeed = 0.4f;

        private float _distance;
        private TransformComponent _transform;
        private bool _zoom = true;
        private Vector3 _pivot;
        private Vector2 _oldMousePosition;
        private AnimationComponent _animation;
        private AnimationClip[] _turnAnimations;

        public float CurrentPlaneAngle { get; private set; }

        public override void Start()
        {
            _transform = Entity.GetOrCreate<TransformComponent>();
            _animation = Entity.GetOrCreate<AnimationComponent>();

            PrepareTurnAnimations();

            CurrentPlaneAngle = (float)Math.PI;
        }

        private void PrepareTurnAnimations()
        {
            _turnAnimations = new AnimationClip[4];
            _turnAnimations[0] = CreateTurnCurve(0, HalfPi);
            _turnAnimations[1] = CreateTurnCurve(HalfPi, Math.PI);
            _turnAnimations[2] = CreateTurnCurve(Math.PI, ThreeHalfPi);
            _turnAnimations[3] = CreateTurnCurve(ThreeHalfPi, TwoPi);
        }

        private AnimationClip CreateTurnCurve(double start, double end)
        {
            var animationClip = new AnimationClip { Duration = TimeSpan.FromSeconds(TurnSpeed) };
            
            AnimationCurve curve = new AnimationCurve<float>
            {
                InterpolationType = AnimationCurveInterpolationType.Cubic,
                KeyFrames =
                {
                    new KeyFrameData<float>((CompressedTimeSpan) TimeSpan.FromSeconds(0.0f), (float) start),
                    new KeyFrameData<float>((CompressedTimeSpan) TimeSpan.FromSeconds(0.5f), (float) end)
                }
            };

            animationClip.AddCurve("[TransformComponent.Key].Position", curve);

            return animationClip;
        }

        public override void Update()
        {
            Scrolling();
            Panning();
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

        public void TurnClockwise()
        {
            Turn(Math.PI * 0.5f);
        }

        public void TurnCounterClockwise()
        {
            Turn(-Math.PI * 0.5f);
        }

        private void Turn(double angleDelta)
        {
            _zoom = false;

            _pivot = _transform.Position + _transform.WorldMatrix.Forward * Distance;

            var oldPlaneAngle = CurrentPlaneAngle;
            CurrentPlaneAngle = CorrectAngle(CurrentPlaneAngle + angleDelta);

            double from = oldPlaneAngle;
            double to = CurrentPlaneAngle;

            
            if (Math.Abs(oldPlaneAngle) < Double.Epsilon && angleDelta < 0)
            {
                to = -HalfPi;
            }
            else if (ThreeHalfPi - Math.Abs(oldPlaneAngle) < Double.Epsilon && angleDelta > 0)
            {
                to = TwoPi;
            }

            TurnUpdate((float) to);

            StartTurnAnimation(from, to);
        }

        private void StartTurnAnimation(double from, double to)
        {
            
        }

        /// <summary>
        ///     This method compensates for floating point errors by giving back<br />
        ///     the closest of the following values: 0, 1/2*pi, pi, 3/4 pi.
        /// </summary>
        /// <remarks>
        ///     Also considers multiples of those values,<br />
        ///     i.e. a closeness end 2*pi will result in pi being returned instead of 3/4pi.
        /// </remarks>
        /// <param name="angle"></param>
        /// <returns></returns>
        private float CorrectAngle(double angle)
        {
            var scalar = (int)(angle / TwoPi);
            var rest = angle - scalar * TwoPi;
            if (rest > 0)
            {
                return Rasterize(rest);
            }
            return Rasterize(TwoPi + rest);
        }

        private float Rasterize(double angle)
        {
            if (angle > TwoPi || angle < 0)
            {
                throw new ArgumentException("Angle must be: 0 <= angle <= TwoPi.");
            }

            double[] rasterPoints = { 0, HalfPi, Math.PI, ThreeHalfPi, TwoPi };
            var delta = angle;
            var lowestIndex = 0;

            for (var i = 1; i < rasterPoints.Length; i++)
            {
                var currentDelta = Math.Abs(angle - rasterPoints[i]);
                if (currentDelta < delta)
                {
                    lowestIndex = i;
                    delta = currentDelta;
                }
            }

            if (lowestIndex == rasterPoints.Length - 1)
            {
                return 0;
            }
            return (float)rasterPoints[lowestIndex];
        }

        private void TurnUpdate(float angle)
        {
            Vector3 absoluteCirclePosition =
                                  new Vector3(
                                      (float) (Math.Sin(angle) * Distance),
                                      0,
                                      (float) (Math.Cos(angle) * Distance)
                                  );
            _transform.Position = _pivot + absoluteCirclePosition;
            //_transform.LookAt(_pivot);
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

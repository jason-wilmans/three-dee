﻿using System;
using CoreFacade.Interface;
using SiliconStudio.Core;
using SiliconStudio.Core.Mathematics;
using SiliconStudio.Xenko.Animations;
using SiliconStudio.Xenko.Engine;
using SiliconStudio.Xenko.Input;
using UI.Utilities;

namespace UI.Camera
{
    [DataContract(nameof(CameraMovementComponent))]
    public class CameraMovementComponent : SyncScript
    {
        public float Distance = 5;
        public float TurnSpeed = 0.75f;
        public float ScrollingSpeed = 0.25f;
        public float PanSpeed = 1.0f;

        // Set by animation component
        [DataMember] public float CurrentAngle;
        private const float ScrollDelta = 0.00005f;
        private CameraAngle[] _angles;
        private AnimationComponent _animation;
        private int _currentAngleIndex;
        private Vector2 _oldMousePosition;
        
        private Vector3 _pivot;
        private bool _isTurning;

        private IThreeDeeCore _core;

        public override void Start()
        {
            base.Start();
            
            _animation = Entity.GetOrCreate<AnimationComponent>();

            _angles = new[]
            {
                new CameraAngle(0, MathUtil.PiOverTwo, TurnSpeed),
                new CameraAngle(MathUtil.PiOverTwo, MathUtil.PiOverTwo, TurnSpeed),
                new CameraAngle(Math.PI, MathUtil.PiOverTwo, TurnSpeed),
                new CameraAngle(1.5*Math.PI, MathUtil.PiOverTwo, TurnSpeed)
            };

            CurrentAngle = (float)_angles[_currentAngleIndex].Angle;
            UpdatePivot();
            PositionFromAngle();

            _core = ThreeDeeCoreFactory.GetProductionCore();
        }

        public override void Update()
        {
            Turning();

            if (!_isTurning)
            {
                Scrolling();
                Panning();
            }

            RecommendSpawnPosition();
        }

        private void RecommendSpawnPosition()
        {
            Vector3 recommendedPosition = Entity.Transform.Position + Entity.Transform.LocalMatrix.Forward*Distance;
            _core.RecommendedSpawnPosition = ConversionTools.ToModel(recommendedPosition);
        }

        private void Turning()
        {
            _isTurning = _animation.PlayingAnimations.Count > 0;

            if (_isTurning)
            {
                PositionFromAngle();
                Entity.Transform.LookAt(_pivot);
            }

            _isTurning = CheckAndTurn();
        }

        private bool CheckAndTurn()
        {
            if (Input.IsKeyPressed(Keys.Right))
            {
                UpdatePivot();
                StartTurnAnimation(_angles[_currentAngleIndex].HigherAnimation);
                _currentAngleIndex = (_currentAngleIndex + 1) % _angles.Length;
                return true;
            }

            if (Input.IsKeyPressed(Keys.Left))
            {
                UpdatePivot();
                StartTurnAnimation(_angles[_currentAngleIndex].LowerAnimation);
                _currentAngleIndex = _currentAngleIndex > 0 ? _currentAngleIndex - 1 : _angles.Length - 1;
                return true;
            }

            return false;
        }

        private void PositionFromAngle()
        {
            Entity.Transform.Position = _pivot + new Vector3(
                Distance * (float)Math.Sin(CurrentAngle),
                0,
                Distance * (float)Math.Cos(CurrentAngle)
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
            _pivot = Entity.Transform.Position + Entity.Transform.LocalMatrix.Forward * Distance;
        }


        #region Scrolling

        public void Scrolling()
        {
            if (Math.Abs(Input.MouseWheelDelta) > ScrollDelta)
            {
                var direction = Input.MouseWheelDelta > 0
                    ? Entity.Transform.LocalMatrix.Forward
                    : Entity.Transform.LocalMatrix.Backward;

                Entity.Transform.Position += direction * ScrollingSpeed;
            }
        }

        #endregion

        #region Panning

        private void Panning()
        {
            if (Input.IsMouseButtonDown(MouseButton.Right))
            {
                var delta = (Input.MousePosition - _oldMousePosition) * PanSpeed;
                Entity.Transform.Position += Entity.Transform.WorldMatrix.Left * delta.X;
                Entity.Transform.Position += Entity.Transform.WorldMatrix.Up * delta.Y;
            }

            _oldMousePosition = Input.MousePosition;
        }

        #endregion
    }
}
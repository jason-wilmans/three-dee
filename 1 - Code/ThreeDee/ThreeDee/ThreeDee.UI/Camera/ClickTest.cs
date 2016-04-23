using SiliconStudio.Core.Mathematics;
using SiliconStudio.Xenko.Engine;
using SiliconStudio.Xenko.Graphics;
using SiliconStudio.Xenko.Physics;

namespace ThreeDee.UI.Camera
{
    public class ClickTest : SyncScript
    {
        public TransformComponent TargetIndicator;
        private CameraComponent Camera;
        private Simulation _simulation;

        public override void Start()
        {
            base.Start();

            Camera = Entity.Get<CameraComponent>();
            _simulation = Entity.GetOrCreate<RigidbodyComponent>().Simulation;
        }

        public override void Update()
        {
            TransformComponent target = Raycast(Input.MousePosition);
            if (target != null)
            {
                TargetIndicator.Position = target.Position;
            }
        }

        private TransformComponent Raycast(Vector2 screenPos)
        {
            var backBuffer = GraphicsDevice.Presenter.BackBuffer;
            screenPos.X *= backBuffer.Width;
            screenPos.Y *= backBuffer.Height;

            var viewport = new Viewport(0, 0, backBuffer.Width, backBuffer.Height);

            var unprojectedNear =
                viewport.Unproject(
                    new Vector3(screenPos, 0.0f),
                    Camera.ProjectionMatrix,
                    Camera.ViewMatrix,
                    Matrix.Identity);

            var unprojectedFar =
                viewport.Unproject(
                    new Vector3(screenPos, 1.0f),
                    Camera.ProjectionMatrix,
                    Camera.ViewMatrix,
                    Matrix.Identity);

            var result = _simulation.Raycast(unprojectedNear, unprojectedFar);

            if (!result.Succeeded || result.Collider == null)
            {
                return null;
            }

            return result.Collider.Entity.Transform;
        }
    }
}

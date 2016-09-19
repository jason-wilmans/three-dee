using System.Linq;
using GameClient.GUI.Ui3D.EventArgs;
using SiliconStudio.Core.Mathematics;
using SiliconStudio.Xenko.Engine;
using SiliconStudio.Xenko.Graphics;
using SiliconStudio.Xenko.Input;
using SiliconStudio.Xenko.Physics;

namespace UI3D
{
    public class Ui3DEventSystem : SyncScript
    {
        public CameraComponent Camera;
        private Simulation _simulation;

        public override void Start()
        {
            base.Start();

            _simulation = this.GetSimulation();
        }

        public override void Update()
        {
            HitResult hitResult = Raycast(Input.MousePosition);
            Interpret(hitResult);
        }

        private void Interpret(HitResult hitResult)
        {
            if (!Input.IsMouseButtonReleased(MouseButton.Left) || !hitResult.Succeeded || hitResult.Collider == null)
                return;

            Entity hitEntity = hitResult.Collider.Entity;
            AViewElement3D hit3DUiElement = Search3DUIElement(hitEntity);
            hit3DUiElement?.Bubble(new MouseClickEventArgs(Input.MousePosition, hitResult.Point));
        }

        private AViewElement3D Search3DUIElement(Entity entity)
        {
            return entity.Components
                .OfType<AViewElement3D>()
                .FirstOrDefault();
        }

        private HitResult Raycast(Vector2 screenPos)
        {
            Texture backBuffer = GraphicsDevice.Presenter.BackBuffer;
            screenPos.X *= backBuffer.Width;
            screenPos.Y *= backBuffer.Height;

            Viewport viewport = new Viewport(0, 0, backBuffer.Width, backBuffer.Height);

            Vector3 unprojectedNear =
                viewport.Unproject(
                    new Vector3(screenPos, 0.0f),
                    Camera.ProjectionMatrix,
                    Camera.ViewMatrix,
                    Matrix.Identity);

            Vector3 unprojectedFar =
                viewport.Unproject(
                    new Vector3(screenPos, 1.0f),
                    Camera.ProjectionMatrix,
                    Camera.ViewMatrix,
                    Matrix.Identity);
            
            HitResult hitResult = _simulation.Raycast(unprojectedNear, unprojectedFar);
            
            return hitResult;
        }
    }
}

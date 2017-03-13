using System;
using System.Linq;
using SiliconStudio.Core.Mathematics;
using SiliconStudio.Xenko.Engine;
using SiliconStudio.Xenko.Graphics;
using SiliconStudio.Xenko.Input;
using SiliconStudio.Xenko.Physics;
using UI.Ui3D.EventArgs;

namespace UI.Ui3D
{
    public class Ui3DEventSystemComponent : SyncScript
    {
        private CameraComponent _camera;
        private Simulation _simulation;

        public override void Start()
        {
            base.Start();

            _simulation = this.GetSimulation();
            _camera = SearchCameraInScene();
        }

        private CameraComponent SearchCameraInScene()
        {
            try
            {
                var cameraEntity = SceneSystem.SceneInstance.Scene.Entities.SingleOrDefault(
                    entity => entity.Components.Any(component => component is CameraComponent)
                    );

                if (cameraEntity == null)
                {
                    throw new InvalidOperationException("There is no camera on the top level in this scene.");
                }

                return cameraEntity.Get<CameraComponent>();
            }
            catch (InvalidOperationException)
            {
                throw new InvalidOperationException("There was more than one camera in the scene.");
            }
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
                    _camera.ProjectionMatrix,
                    _camera.ViewMatrix,
                    Matrix.Identity);

            Vector3 unprojectedFar =
                viewport.Unproject(
                    new Vector3(screenPos, 1.0f),
                    _camera.ProjectionMatrix,
                    _camera.ViewMatrix,
                    Matrix.Identity);
            
            HitResult hitResult = _simulation.Raycast(unprojectedNear, unprojectedFar);
            
            return hitResult;
        }
    }
}

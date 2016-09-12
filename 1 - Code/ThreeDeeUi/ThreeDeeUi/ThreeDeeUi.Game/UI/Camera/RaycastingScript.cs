// <copyright file="RaycastingScript.cs" year="2016" owner="Fritz Oscar S. Berngruber & Jason Wilmans">
// All rights are reserved. Reproduction or transmission in whole or in part, in
// any form or by any means, electronic, mechanical or otherwise, is prohibited
// without the prior written consent of the copyright owner.
// </copyright>

#region

using System.Linq;
using SiliconStudio.Core.Mathematics;
using SiliconStudio.Xenko.Engine;
using SiliconStudio.Xenko.Graphics;
using SiliconStudio.Xenko.Input;
using SiliconStudio.Xenko.Physics;
using ThreeDeeUi.UI.Diagrams;

#endregion

namespace ThreeDeeUi.UI.Camera
{
    public class RaycastingScript : SyncScript
    {
        private Simulation _simulation;
        private CameraComponent _camera;

        public override void Start()
        {
            _camera = Entity.Get<CameraComponent>();
            _simulation = this.GetSimulation();
        }

        public override void Update()
        {
            foreach (var pointerEvent in Input.PointerEvents.Where(x => x.State == PointerState.Down))
            {
                Entity hitEntity = Raycast(pointerEvent.Position);
                if (hitEntity != null)
                {
                    DiagramVertexComponent vertex = hitEntity.Get<DiagramVertexComponent>();
                    vertex.ToggleColor();
                }
            }
        }

        private Entity Raycast(Vector2 screenPos)
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
            if (!hitResult.Succeeded || hitResult.Collider == null)
            {
                return null;
            }

            return hitResult.Collider.Entity;
        }
    }
}
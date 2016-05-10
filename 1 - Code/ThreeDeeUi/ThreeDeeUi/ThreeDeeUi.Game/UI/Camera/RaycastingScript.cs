// <copyright file="RaycastingScript.cs" year="2016" owner="Fritz Oscar S. Berngruber & Jason Wilmans">
// All rights are reserved. Reproduction or transmission in whole or in part, in
// any form or by any means, electronic, mechanical or otherwise, is prohibited
// without the prior written consent of the copyright owner.
// </copyright>

#region

using System;
using System.Collections.Generic;
using System.Linq;
using Prototype_1.GameBoard;
using SiliconStudio.Core.Collections;
using SiliconStudio.Core.Mathematics;
using SiliconStudio.Xenko.Engine;
using SiliconStudio.Xenko.Graphics;
using SiliconStudio.Xenko.Input;
using SiliconStudio.Xenko.Physics;

#endregion

namespace Prototype_1
{
    public class RaycastingScript : SyncScript
    {
        private Simulation _simulation;
        private CameraComponent _camera;
        private Prefab _explosionPrefab;
        private Prefab _explosionPrefab2;
        private readonly WorldToHexCoordsProjection _worldToHexCoordsProjection = new WorldToHexCoordsProjection();

        public override void Start()
        {
            _camera = Entity.Get<CameraComponent>();
            _simulation = this.GetSimulation();
            _explosionPrefab = Content.Load<Prefab>("ExplosionPfb");
            _explosionPrefab2 = Content.Load<Prefab>("Explosion2Pfb");
        }

        public override void Update()
        {
            foreach (var pointerEvent in Input.PointerEvents.Where(x => x.State == PointerState.Down))
            {
                Raycast(pointerEvent.Position);
            }
        }

        private void Raycast(Vector2 screenPos)
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
            if (!hitResult.Succeeded || hitResult.Collider == null) return;

            SpawnExplosionPrefab(hitResult.Point);
        }

        private void SpawnExplosionPrefab(Vector3 point)
        {
            FastCollection<Entity> explosion = _explosionPrefab.Instantiate();
            SceneSystem.SceneInstance.Scene.Entities.AddRange(explosion);
            Vector2 hexGuiCenter2D = _worldToHexCoordsProjection.ToHex(new Vector2(point.X, point.Z));
            explosion[0].Transform.Position = new Vector3(hexGuiCenter2D.X, point.Y, hexGuiCenter2D.Y);

            FastCollection<Entity> explosion2 = _explosionPrefab2.Instantiate();
            SceneSystem.SceneInstance.Scene.Entities.AddRange(explosion2);
            explosion2[0].Transform.Position = point;
        }
    }
}
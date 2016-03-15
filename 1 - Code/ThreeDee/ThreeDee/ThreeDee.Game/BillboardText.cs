using SiliconStudio.Core;
using SiliconStudio.Core.Mathematics;
using SiliconStudio.Xenko.Engine;
using SiliconStudio.Xenko.Graphics;
using SiliconStudio.Xenko.Rendering;
using SiliconStudio.Xenko.Rendering.Composers;
using SiliconStudio.Xenko.UI;
using SiliconStudio.Xenko.UI.Controls;
using SiliconStudio.Xenko.UI.Panels;

namespace ThreeDee
{
    public class BillboardText : StartupScript
    {
        private SpriteBatch batch;
        private Vector2 screenSize;
        private SceneDelegateRenderer fontRenderer;
        private Sprite3DBatch batch3d;
        public SpriteFont Font { get; set; }
        private UIComponent _uiComponent;
        [DataMember(Mask = LiveScriptingMask)]
        private SpriteFont _font;

        public override void Start()
        {
            base.Start();

            _uiComponent = Entity.GetOrCreate<UIComponent>();

            var font = Asset.Load<SpriteFont>("fonts/SpriteFont");
            var firstButton = new Button { Content = new TextBlock { Text = "First Button", Font = font, TextSize = 10} };
            _uiComponent.RootElement = new StackPanel { HorizontalAlignment = HorizontalAlignment.Left, Children = { firstButton } };

            batch = new SpriteBatch(GraphicsDevice.RootDevice)
            {
                VirtualResolution = new Vector3(GraphicsDevice.RootDevice.Viewport.Size, 1000)
            };
            screenSize = new Vector2(GraphicsDevice.BackBuffer.Width, GraphicsDevice.BackBuffer.Height);

            batch3d = new Sprite3DBatch(GraphicsDevice.RootDevice);

            var scene = SceneSystem.SceneInstance.Scene;
            var compositor = (SceneGraphicsCompositorLayers)scene.Settings.GraphicsCompositor;
            fontRenderer = new SceneDelegateRenderer(DrawFont);
            compositor.Master.Renderers.Add(fontRenderer);
        }

        private void DrawFont(RenderContext arg1, RenderFrame arg2)
        {
            batch.Begin();
            var text = Entity.Transform.Position.ToString();
            batch.DrawString(Font, text, Vector2.One, Color4.White);
            batch.End();
        }

        protected override void Destroy()
        {
            base.Destroy();

            var scene = SceneSystem.SceneInstance.Scene;
            var compositor = (SceneGraphicsCompositorLayers)scene.Settings.GraphicsCompositor;

            compositor.Master.Renderers.Remove(fontRenderer);
            batch.Dispose();
        }
    }
}

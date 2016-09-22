using System;
using System.Linq;
using GameClient.GUI.Ui3D.EventArgs;
using SiliconStudio.Core;
using SiliconStudio.Xenko.Engine;

namespace UI3D
{
    [DataContract(Inherited = true)]
    public abstract class AViewElement3D : SyncScript
    {
        public event Action<MouseClickEventArgs> Clicked;

        /// <summary>
        /// If null, this is the root element of a visual tree.
        /// </summary>
        public AViewElement3D Parent { get; set; }
        
        internal void Bubble(UI3DEventArgs eventArgs)
        {
            //Contract.Requires(eventArgs != null);

            AViewElement3D currentElement = this;
            while (currentElement != null)
            {
                Delegate[] invocationList = currentElement.GetInvocationList(eventArgs);

                if (invocationList != null && invocationList.Length > 0)
                {
                    if (TryHandle(invocationList, eventArgs))
                    {
                        return;
                    };
                }

                currentElement = currentElement.Parent;
            }
        }

        private Delegate[] GetInvocationList(UI3DEventArgs eventArgs)
        {
            if (eventArgs is MouseClickEventArgs)
            {
                return Clicked?.GetInvocationList();
            }

            throw new ArgumentException($"Unknown event type '{eventArgs.GetType()}'.", nameof(eventArgs));
        }

        private static bool TryHandle(Delegate[] invocationList, UI3DEventArgs eventArgs)
        {
            return invocationList.Any(eventHandler =>
            {
                eventHandler.DynamicInvoke(eventArgs);
                return eventArgs.Handled;
            });
        }
    }
}

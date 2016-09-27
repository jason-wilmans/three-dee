using System;
using System.Linq;
using SiliconStudio.Core;
using SiliconStudio.Xenko.Engine;
using UI3D.EventArgs;

namespace UI3D
{
    public abstract class AViewElement3D : SyncScript
    {
        //TODO: Put me back in
        //public event Action<MouseClickEventArgs> Clicked;

        ///// <summary>
        ///// If null, this is the root element of a visual tree.
        ///// </summary>
        //public AViewElement3D Parent { get; set; }
        
        //internal void Bubble(Ui3DEventArgs eventArgs)
        //{
        //    AViewElement3D currentElement = this;
        //    while (currentElement != null)
        //    {
        //        Delegate[] invocationList = currentElement.GetInvocationList(eventArgs);

        //        if (invocationList != null && invocationList.Length > 0)
        //        {
        //            if (TryHandle(invocationList, eventArgs))
        //            {
        //                return;
        //            };
        //        }

        //        currentElement = currentElement.Parent;
        //    }
        //}

        //private Delegate[] GetInvocationList(Ui3DEventArgs eventArgs)
        //{
        //    if (eventArgs is MouseClickEventArgs)
        //    {
        //        return Clicked?.GetInvocationList();
        //    }

        //    throw new ArgumentException($"Unknown event type '{eventArgs.GetType()}'.", nameof(eventArgs));
        //}

        //private static bool TryHandle(Delegate[] invocationList, Ui3DEventArgs eventArgs)
        //{
        //    return invocationList.Any(eventHandler =>
        //    {
        //        eventHandler.DynamicInvoke(eventArgs);
        //        return eventArgs.Handled;
        //    });
        //}
    }
}

using System;
using UnityEngine;

namespace UIToolkit
{
    public class UiElement3D : MonoBehaviour
    {
        public UiElement3D()
        {
            Parent = null;
        }

        /// <summary>
        ///     This 3D UI element's parent element.
        /// </summary>
        /// <remarks>If this element is the root of a visual tree, it is of type <see cref="DefaultElement" /></remarks>
        public UiElement3D Parent { get; protected set; }

        /// <summary>
        ///     Called, if the mouse enters about a collider of this object or one of its children.
        /// </summary>
        private event Action<MouseEventArgs> MouseEnter;

        /// <summary>
        ///     Called, if the mouse exits of a collider of this object or one of its children.
        /// </summary>
        private event Action<MouseEventArgs> MouseExit;

        public void Start()
        {
            //gameObject.pa
        }

        private void OnMouseEnter()
        {
            Bubble(EventType.MouseEnter, new MouseEventArgs(Input.mousePosition));
        }

        /// <summary>
        ///     Invokes the given event on the current level of the visual tree.
        ///     If the event is not handled after that, invokes the same process a level up the chain.
        /// </summary>
        /// <param name="eventType"></param>
        /// <param name="mouseEventArgs"></param>
        private void Bubble(EventType eventType, MouseEventArgs mouseEventArgs)
        {
            var level = this;

            while (!mouseEventArgs.IsHandled && level != null)
            {
                Debug.Log("level: " + level.gameObject.name);
                InvokeEvent(eventType, mouseEventArgs);
                level = level.Parent;
            }
        }

        protected virtual void InvokeEvent(EventType eventType, MouseEventArgs mouseEventArgs)
        {
            switch (eventType)
            {
                case EventType.MouseEnter:
                    if (MouseEnter != null)
                    {
                        MouseEnter(mouseEventArgs);
                    }
                    break;
            }
        }
    }
}
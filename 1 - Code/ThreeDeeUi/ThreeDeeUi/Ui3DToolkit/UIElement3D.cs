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
        public UiElement3D Parent { get; protected set; }

        /// <summary>
        ///     Called, if the mouse enters about a collider of this object or one of its children.
        /// </summary>
        private event Action<MouseEventArgs> MouseEnter;

        /// <summary>
        ///     Called, if the mouse exits of a collider of this object or one of its children.
        /// </summary>
        private event Action<MouseEventArgs> MouseExit;

        public void OnEnable()
        {
            Transform current = GetComponent<Transform>().parent;
            while (current != null)
            {
                UiElement3D[] elements = current.GetComponents<UiElement3D>();
                if (elements == null || elements.Length == 0)
                {
                    current = current.parent;
                }
                else
                {
                    if (elements.Length > 1)
                    {
                        Debug.LogError("Multiple ui elements on same go");
                        throw new InvalidOperationException("You can't have more than one UIElement3D script on one GameObject: " + transform.gameObject.name);
                    }

                    Parent = elements[0];
                }
            }
        }

        private void OnMouseEnter()
        {
            Bubble(EventType.MouseEnter, new MouseEventArgs(Input.mousePosition));
        }

        private void OnMouseExit()
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

                case EventType.MouseExit:
                    if (MouseExit != null)
                    {
                        MouseExit(mouseEventArgs);
                    }
                    break;
            }
        }
    }
}
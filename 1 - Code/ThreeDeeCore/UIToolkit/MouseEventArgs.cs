using UnityEngine;

namespace UIToolkit
{
    public class MouseEventArgs
    {
        /// <summary>
        /// Set to true, if this event was handled.
        /// </summary>
        public bool IsHandled { get; set; }

        /// <summary>
        /// The current mouse position.
        /// </summary>
        public Vector3 MousePosition { get; }

        public MouseEventArgs(Vector3 mousePosition)
        {
            MousePosition = mousePosition;
        }
    }
}
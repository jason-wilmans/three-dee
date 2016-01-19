using UnityEngine;

namespace UIToolkit
{
    public class UiElement3D : MonoBehaviour
    {
        public UiElement3D Parent { get; protected set; }

        public UiElement3D() { 
            Parent = new DefaultElement();
        }

        protected virtual void BubbleUp()
        {
            
        }

        void OnMouseEnter()
        {
            Debug.Log("OnMouseEnter");
        }
    }
}

using UnityEngine;
using System.Collections;

public class EditorMenuControl : MonoBehaviour {
    [SerializeField]
    private float VisualCueSize = 5f;

    private RectTransform _rectTransform;
    private Hashtable _easeOut;
    private Hashtable _easeIn;

    // Use this for initialization
	void Start ()
	{
	    _rectTransform = GetComponent<RectTransform>();

        _easeOut = new Hashtable();
        _easeOut["from"] = _rectTransform.position.y;
        _easeOut["to"] = -_rectTransform.rect.height /2 + VisualCueSize;
        _easeOut["time"] = 0.3;
	    _easeOut["easetype"] = "easeInOutCubic";
        _easeOut["onupdate"] = "OnNewMenuPosition";
        
        _easeIn = new Hashtable();
        _easeIn["from"] = -_rectTransform.rect.height / 2 + VisualCueSize;
        _easeIn["to"] = _rectTransform.rect.height / 2;
        _easeIn["time"] = 0.2;
        _easeIn["easetype"] = "easeInOutCubic";
        _easeIn["onupdate"] = "OnNewMenuPosition";

        iTween.ValueTo(gameObject, _easeOut);
	}

    private void OnNewMenuPosition(float newY)
    {
        _rectTransform.position = new Vector3(_rectTransform.position.x, newY, _rectTransform.position.z);
    }

    public void OnMouseEnter()
    {
        iTween.ValueTo(gameObject, _easeIn);
    }

    public void OnMouseExit()
    {
        iTween.ValueTo(gameObject, _easeOut);
    }
}

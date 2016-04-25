using UnityEngine;
using System.Collections;

public class TranslationToolControl : MonoBehaviour
{
    public Color ActiveColor;
    private Transform _transform;

    private Transform _xHandle;
    private Transform _yHandle;
    private Transform _zHandle;
    
    void Start ()
	{
	    _transform = GetComponent<Transform>();

	    _xHandle = _transform.FindChild("XAxisHandle");
        _yHandle = _transform.FindChild("YAxisHandle");
        _zHandle = _transform.FindChild("ZAxisHandle");

        if (_xHandle == null)
        {
            Debug.LogError("X Axis handle not found.");
        }
        if (_yHandle == null)
        {
            Debug.LogError("Y Axis handle not found.");
        }

        if (_zHandle == null)
        {
            Debug.LogError("Z Axis handle not found.");
        }
    }

    void OnMouseEnter()
    {
        _xHandle.GetComponent<MeshRenderer>().material.color = ActiveColor;
    }
}

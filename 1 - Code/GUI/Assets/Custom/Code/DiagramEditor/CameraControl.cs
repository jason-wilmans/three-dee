using UnityEngine;
using System.Collections;

public class CameraControl : MonoBehaviour {
    private Transform _transform;
    private const string ScrollAxisName = "Mouse ScrollWheel";
    private const float ScrollDelta = 0.005f;
    private const float ScrollingSpeed = 20;

    public void Start()
    {
        _transform = GetComponent<Transform>();
    }

    public void FixedUpdate()
    {
        if (Mathf.Abs(Input.GetAxis(ScrollAxisName)) > ScrollDelta)
        {
            Vector3 zoomDelta = _transform.forward * Input.GetAxis(ScrollAxisName) * ScrollingSpeed;
            _transform.Translate(zoomDelta);
        }
    }


}

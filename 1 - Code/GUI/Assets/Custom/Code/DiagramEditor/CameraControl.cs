using System;
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

    public void TurnClockwise()
    {
        Debug.Log("Turning clockwise..");
        Vector3 lookTarget = _transform.forward*20;

        float dX = _transform.position.x - lookTarget.x;
        float dZ = _transform.position.z - lookTarget.z;

        Vector3 target = new Vector3(
            _transform.position.x - Mathf.Sin(Mathf.PI * 0.5f) * dX,
            _transform.position.y,
            _transform.position.z + Mathf.Sin(0) * dZ);
        
        iTween.MoveTo(gameObject, target, 2.5f);
    }
}

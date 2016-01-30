using System.Collections;
using UnityEngine;

public class CameraControl : MonoBehaviour
{
    private const string ScrollAxisName = "Mouse ScrollWheel";
    private const float ScrollDelta = 0.005f;
    private const float ScrollingSpeed = 20;
    private float _currentPlaneAngle;

    private float _distance;
    private Vector3 _pivot;
    private Transform _transform;
    private bool _zoom;

    public void Start()
    {
        _transform = GetComponent<Transform>();
    }

    public void FixedUpdate()
    {
        if (Mathf.Abs(Input.GetAxis(ScrollAxisName)) > ScrollDelta)
        {
            var zoomDelta = _transform.forward*Input.GetAxis(ScrollAxisName)*ScrollingSpeed;
            _transform.position += zoomDelta;
        }
    }

    public void Update()
    {
        Debug.DrawLine(_transform.position, _transform.position + _transform.forward, Color.magenta);
        Debug.DrawLine(_transform.position, _pivot, Color.green);
    }

    public void TurnClockwise()
    {
        Turn(Mathf.PI * 0.5f);
    }

    public void TurnCounterClockwise()
    {
        Turn(-Mathf.PI * 0.5f);
    }

    private void Turn(float angleDelta)
    {
        _zoom = false;
        _pivot = _transform.position + _transform.forward * 10;

        _distance = (_transform.position - _pivot).magnitude;

        var oldPlaneAngle = _currentPlaneAngle;
        _currentPlaneAngle += angleDelta;

        var tweenSettings = new Hashtable();

        tweenSettings["from"] = oldPlaneAngle;
        tweenSettings["to"] = _currentPlaneAngle;
        tweenSettings["onupdate"] = "TurnUpdate";
        tweenSettings["oncomplete"] = "TurnComplete";
        tweenSettings["time"] = 5;
        tweenSettings["easetype"] = "easeInOutCubic";

        iTween.ValueTo(gameObject, tweenSettings);
    }

    private void TurnUpdate(float angle)
    {
        _transform.position = _pivot + new Vector3(Mathf.Sin(angle)*_distance, _transform.position.y, Mathf.Cos(angle)*_distance);
        _transform.LookAt(_pivot);
    }

    private void TurnComplete()
    {
        _zoom = true;
    }

    enum Direction
    {
        Clockwise,
        Counterclockwise
    }
}
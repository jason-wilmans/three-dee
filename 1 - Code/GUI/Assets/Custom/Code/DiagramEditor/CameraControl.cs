using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraControl : MonoBehaviour
{
    private const string ScrollAxisName = "Mouse ScrollWheel";
    private const float ScrollDelta = 0.005f;
    private const float ScrollingSpeed = 20;
    private const float PanAreaSize = 0.005f;
    private const double HalfPi = Math.PI * 0.5;
    private const double ThreeHalvesPi = Math.PI*(3.0/2.0);
    private const double Pi = Math.PI;
    private const double TwoPi = 2 * Math.PI;
    private float _currentPlaneAngle;

    private float _distance;
    private Vector3 _pivot;
    private Transform _transform;
    private bool _zoom = true;

    public float CurrentPlaneAngle
    {
        get { return _currentPlaneAngle; }
    }

    public void Start()
    {
        _transform = GetComponent<Transform>();
    }

    public void FixedUpdate()
    {
        Scrolling();
        Panning();
        _pivot = _transform.forward * 10;
        Debug.DrawLine(_transform.position, _transform.position + _pivot, Color.magenta);
    }

    #region Scrolling

    public void Scrolling()
    {
        if (_zoom && Mathf.Abs(Input.GetAxis(ScrollAxisName)) > ScrollDelta)
        {
            var zoomDelta = _transform.forward*Input.GetAxis(ScrollAxisName)*ScrollingSpeed;
            _transform.position += zoomDelta;
        }
    }

    #endregion

    #region Turning

    public void TurnClockwise()
    {
        Turn(Mathf.PI*0.5f);
    }

    public void TurnCounterClockwise()
    {
        Turn(-Mathf.PI*0.5f);
    }

    private void Turn(double angleDelta)
    {
        _zoom = false;

        _distance = (_transform.position - _pivot).magnitude;

        var oldPlaneAngle = _currentPlaneAngle;
        _currentPlaneAngle = CorrectAngle(_currentPlaneAngle + angleDelta);

        Debug.Log(string.Format("Turning from {0} to {1}", oldPlaneAngle, _currentPlaneAngle));

        var tweenSettings = new Hashtable();
        tweenSettings["from"] = oldPlaneAngle;
        tweenSettings["to"] = _currentPlaneAngle;
        tweenSettings["onupdate"] = "TurnUpdate";
        tweenSettings["oncomplete"] = "TurnComplete";
        tweenSettings["time"] = 0.3f;
        tweenSettings["easetype"] = "easeInOutCubic";

        iTween.ValueTo(gameObject, tweenSettings);
    }

    /// <summary>
    /// This method compensates for floating point errors by giving back<br/>
    /// the closest of the following values: 0, 1/2*pi, pi, 3/4 pi.
    /// </summary>
    /// <remarks>Also considers multiples of those values,<br/>
    ///  i.e. a closeness to 2*pi will result in pi being returned instead of 3/4pi.</remarks>
    /// <param name="angle"></param>
    /// <returns></returns>
    private float CorrectAngle(double angle)
    {
        bool sign = angle < 0;

        double absAngle = Math.Abs(angle);

        double result = Pi;

        if (absAngle % HalfPi < result)
        {
            result = HalfPi;
        }

        if (absAngle%Pi < result)
        {
            result = Pi;
        }

        if (absAngle % ThreeHalvesPi < result)
        {
            result = ThreeHalvesPi;
        }

        if (absAngle%TwoPi < result)
        {
            result = 0;
        }

        return (float) (sign ? -result : result);
    }

    private void TurnUpdate(float angle)
    {
        _transform.position = _pivot +
                              new Vector3(
                                  Mathf.Sin(angle)*_distance,
                              _transform.position.y,
                              Mathf.Cos(angle)*_distance);
        _transform.LookAt(_pivot);
    }

    private void TurnComplete()
    {
        _zoom = true;
    }

    #endregion

    #region Panning

    private void Panning()
    {
        // Horizontal
        if (MouseInLeftPanningArea())
        {
            _transform.Translate(Vector3.left);
        }
        else if (MouseInRightPanningArea())
        {
            _transform.Translate(Vector3.right);
        }

        // Vertical
        if (MouseInTopPanningArea())
        {
            _transform.Translate(Vector3.up);
        }
        else if (MouseInBottomPanningArea())
        {
            _transform.Translate(Vector3.down);
        }
    }

    private static bool MouseInRightPanningArea()
    {
        return Input.mousePosition.x < Screen.width &&
               Input.mousePosition.x > Screen.width - Screen.width * PanAreaSize;
    }

    private static bool MouseInLeftPanningArea()
    {
        return Input.mousePosition.x > 0 && Input.mousePosition.x < Screen.width * PanAreaSize;
    }

    private bool MouseInTopPanningArea()
    {
        return Input.mousePosition.y < Screen.height &&
         Input.mousePosition.y > Screen.height - Screen.height*PanAreaSize;
    }

    private bool MouseInBottomPanningArea()
    {
        return Input.mousePosition.y > 0 && Input.mousePosition.y < Screen.height*PanAreaSize;
    }

    #endregion
}
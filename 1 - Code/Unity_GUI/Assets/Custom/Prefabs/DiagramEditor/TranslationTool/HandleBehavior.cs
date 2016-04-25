using UnityEngine;
using System.Collections;

public class HandleBehavior : MonoBehaviour {

    public Color ActiveColor;
    public Color ManipulatingColor;
    private Color _normalColor;
    private MeshRenderer _meshRenderer;

    void Start ()
    {
        _meshRenderer = GetComponent<MeshRenderer>();
        _normalColor = _meshRenderer.material.color;
    }

    void OnMouseEnter()
    {
        _meshRenderer.material.color = ActiveColor;
    }

    void OnMouseExit()
    {
        _meshRenderer.material.color = _normalColor;
    }

    void OnMouseDown()
    {
        _meshRenderer.material.color = ManipulatingColor;
    }

    void OnMouseUp()
    {
        _meshRenderer.material.color = _normalColor;
    }
}

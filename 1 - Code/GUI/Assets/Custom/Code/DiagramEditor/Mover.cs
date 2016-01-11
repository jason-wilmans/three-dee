using UnityEngine;
using System.Collections;
using UnityEditor;

public class Mover : MonoBehaviour
{
    public Renderer rend;
    void Start()
    {
        rend = GetComponent<Renderer>();
    }
    void OnMouseDrag()
    {
        rend.material.color -= Color.white * Time.deltaTime;
    }
}

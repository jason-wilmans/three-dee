using UnityEngine;
using System.Collections;
using UnityEngine.UI;

public class PopOverControl : MonoBehaviour {
    private Hashtable _fadeIn;

    public void Start()
    {
        gameObject.SetActive(false);
    }

    public void Show()
    {
        gameObject.SetActive(true);
    }

    public void Hide()
    {
        gameObject.SetActive(false);
    }
}

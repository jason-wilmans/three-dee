using System;
using UnityEngine;
using System.Collections;

public abstract class AController : MonoBehaviour
{
    public event Action Closed;

    protected void FireClosed()
    {
        if (Closed != null)
        {
            Closed();
        }
    }
}

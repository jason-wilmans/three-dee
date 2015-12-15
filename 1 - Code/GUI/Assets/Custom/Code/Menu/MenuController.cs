using UnityEngine;
using System.Collections;
using Core.Interface;

public class MenuController : MonoBehaviour
{

    private IThreeDeeCore _threeDeeCore;

	// Use this for initialization
	void Start ()
	{
	    _threeDeeCore = ThreeDeeCoreFactory.GetProductionCore();
	}

    public void NewDiagram()
    {
        Application.LoadLevel(1);
    }
}

﻿using System.IO;
using CoreFacade.Interface;
using DiagramLogic.Interface;
using UnityEngine;

public class MenuController : MonoBehaviour
{
    private IThreeDeeCore _threeDeeCore;
    private string _diagramName;
	// Use this for initialization
	void Start ()
	{
	    _threeDeeCore = ThreeDeeCoreFactory.GetProductionCore();
	}

    public void SetDiagramName(string diagramName)
    {
        _diagramName = diagramName;
    }

    public void NewDiagram()
    {
        _threeDeeCore.CreateNewDiagram(_diagramName);
        Application.LoadLevel(1);
    }

    public void CloseApplication()
    {
        Application.Quit();
    }
}
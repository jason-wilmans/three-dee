using System.IO;
using CoreFacade.Interface;
using DiagramLogic.Interface;
using UnityEngine;

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
        Diagram diagram = new Diagram("Test");
        _threeDeeCore.Save(diagram, new FileInfo("test.3dd"), true);
        Application.LoadLevel(1);
        //SceneManager.LoadScene(1);
    }

    public void CloseApplication()
    {
        Application.Quit();
    }
}

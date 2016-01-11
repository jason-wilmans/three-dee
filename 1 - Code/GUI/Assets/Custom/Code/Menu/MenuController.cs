using UnityEngine;
using Core.Interface;
using UnityEngine.SceneManagement;

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
        SceneManager.LoadScene(1);
    }

    public void CloseApplication()
    {
        Application.Quit();
    }
}

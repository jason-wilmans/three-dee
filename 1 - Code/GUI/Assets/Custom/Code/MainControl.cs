using UnityEngine;
using System.Collections;
using System.Runtime.Serialization;

public class MainControl : MonoBehaviour
{
    [SerializeField]
    private GameObject MainMenu;
    [SerializeField]
    private GameObject EditorMenu;

    public void Start()
    {
        MainMenu.SetActive(true);
        EditorMenu.SetActive(false);
        MainMenu.GetComponent<MenuController>().Closed += OnMainMenuClosed;
    }

    private void OnMainMenuClosed()
    {
        MainMenu.SetActive(false);
        EditorMenu.SetActive(true);
    }
}

using UnityEngine;
using CoreFacade.Interface;
using DiagramLogic.Interface.Elements;

public class PopOverControl : MonoBehaviour
{
    public Transform Camera;
    public GameObject ShapePrefab;
    private IThreeDeeCore _core;

    public void Start()
    {
        _core = ThreeDeeCoreFactory.GetProductionCore();
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

    public void AddShape()
    {
        IDiagramElement element = new Ellipsoid();
        _core.CurrentDiagram.Add(element);
        Vector3 targetPosition = Camera.forward*500;
        Instantiate(ShapePrefab, targetPosition, Quaternion.identity);
        Hide();
    }
}

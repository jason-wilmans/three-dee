using UnityEngine;
using CoreFacade.Interface;
using DiagramLogic.Interface.Elements;

public class PopOverControl : MonoBehaviour
{
    public GameObject ShapePrefab;
    private IThreeDeeCore _core;
    private Transform _cameraTransform;

    public void Start()
    {
        _cameraTransform = Camera.main.GetComponent<Transform>();
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
        Vector3 targetPosition = _cameraTransform.position +_cameraTransform.forward * 20;
        Instantiate(ShapePrefab, targetPosition, _cameraTransform.rotation);
        Hide();
    }
}

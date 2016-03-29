using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using UnityEngine;

namespace TestUnityCode
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void TestMethod1()
        {
            CameraControl camera = new CameraControl();
            Transform transform = camera.GetComponent<Transform>();
            Console.WriteLine(transform.position);
        }
    }
}

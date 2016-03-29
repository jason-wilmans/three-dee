using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DiagramLogic.Interface.Exceptions
{
    /// <summary>
    /// This exception is thrown, when there are unsaved changes in a diagram (element) that would be discarded if not saved.
    /// </summary>
    public class UnsavedChangesException : Exception
    {
    }
}

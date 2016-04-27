using System;

namespace ZeroTypes.Exceptions
{
    /// <summary>
    /// This exception is used to encapsulate errors that might occur for any technical reason.
    /// </summary>
    /// <remarks>
    /// From R-Level on upwards, technical errors (and especially exceptions) are never thrown directly. Instead, they are wrapped in
    /// a technical exception, so that the levels relying on the R-layers don't need to know anything about technical details.
    /// </remarks>
    public class TechnicalException : Exception
    {
        private TechnicalException()
        {
        }

        /// <summary>
        /// Message only, no exception.
        /// </summary>
        /// <param name="message">A human readable description (as in: this message could appear somewhere in a GUI element)
        /// of the error (and possible options to resolve or circumvent it). != null</param>
        public TechnicalException(string message) : base(message)
        {
        }

        /// <summary>
        /// Message only, no exception.
        /// </summary>
        /// <param name="message">See first constructor. But with a string.Format()-string.</param>
        /// <param name="paramList">Optional arguments for the string.Format() string.</param>
        public TechnicalException(string message, params object[] paramList)
            : base(string.Format(message, paramList))
        {
        }

        /// <summary>
        /// Variant with an encapsulated exception.
        /// </summary>
        /// <param name="message">See other variants.</param>
        /// <param name="innerException">The original exception. != null</param>
        public TechnicalException(string message, Exception innerException) : base(message, innerException)
        {
        }

        /// <summary>
        /// Variant with an encapsulated exception and a delegation to string.Format().
        /// </summary>
        /// <param name="message">See other variants.</param>
        /// <param name="innerException">The original exception. != null</param>
        /// <param name="paramList">Optional arguments for the string.Format() string.</param>
        public TechnicalException(string message, Exception innerException, params object[] paramList)
            : base(string.Format(message, paramList), innerException)
        {
        }
    }
}

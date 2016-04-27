namespace DiagramLogic.Interface
{
    /// <summary>
    /// Describes an available diagram element type.
    /// </summary>
    public struct DiagramElementType
    {
        /// <summary>
        /// The name for this element type in UI.
        /// </summary>
        public string DisplayName { get; }

        public DiagramElementType(string displayName)
        {
            DisplayName = displayName;
        }
    }
}
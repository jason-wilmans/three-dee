using System;
using System.Reflection;
using DiagramLogic.Interface.Elements;
using PortabilityLayer.Reflection;

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

        /// <summary>
        /// Use this name for all technical descriptions, i.e. asset names, etc.
        /// </summary>
        public string TechnicalName => Type.Name;

        public bool IsValid => ValidtityCheckDoesNotThrowException();

        /// <summary>
        /// the CLR type of this element type.
        /// </summary>
        internal Type Type { get; }

        internal DiagramElementType(string displayName, Type type)
        {
            DisplayName = displayName;
            Type = type;

            CheckValidity();
        }

        private bool ValidtityCheckDoesNotThrowException()
        {
            try
            {
                CheckValidity();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        private void CheckValidity()
        {
            if (string.IsNullOrWhiteSpace(DisplayName)) throw new ArgumentException(nameof(DisplayName));
            if (Type == null) throw new ArgumentNullException(nameof(Type));
        }

        public override string ToString()
        {
            return $"ElementType[{TechnicalName}]";
        }

        public bool Equals(DiagramElementType other)
        {
            return string.Equals(DisplayName, other.DisplayName) && Type == other.Type;
        }

        public override bool Equals(object obj)
        {
            if (ReferenceEquals(null, obj)) return false;
            return obj is DiagramElementType && Equals((DiagramElementType) obj);
        }

        public override int GetHashCode()
        {
            unchecked
            {
                return ((DisplayName != null ? DisplayName.GetHashCode() : 0)*397) ^ (Type != null ? Type.GetHashCode() : 0);
            }
        }
    }
}
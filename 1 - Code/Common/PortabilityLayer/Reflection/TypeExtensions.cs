using System;
using System.Linq;
using System.Reflection;

namespace PortabilityLayer.Reflection
{
    public static class TypeExtensions
    {
        public static ConstructorInfo GetConstructor(this Type type, Type[] parameterTypes)
        {
            return type.GetTypeInfo().DeclaredConstructors.Single(ctor => IsCompatible(ctor, parameterTypes));
        }

        private static bool IsCompatible(ConstructorInfo ctor, Type[] parameterTypes)
        {
            ParameterInfo[] parameters = ctor.GetParameters();
            if (parameterTypes.Length != parameters.Length) return false;

            for (int i = 0; i < parameters.Length; i++)
            {
                if (parameters[i].ParameterType != parameterTypes[i]) return false;
            }

            return true;
        }
    }
}

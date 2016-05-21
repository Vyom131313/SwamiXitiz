using System;

namespace SwamiXitiz.Data
{
    [Serializable]
    public class Exceptions : Exception
    {
        public Exceptions(string message)
            : base(message)
        {
        }
    }
}
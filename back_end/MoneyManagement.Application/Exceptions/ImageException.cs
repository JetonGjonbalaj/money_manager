using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MoneyManagement.Application.Exceptions
{
    public class ImageException : Exception
    {
        public ImageException(string message) : base(message) { }
    }
}

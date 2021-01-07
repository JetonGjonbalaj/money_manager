using System;
using System.Collections.Generic;
using System.Text;

namespace MoneyManagement.Application.Exceptions
{
    public class ApiException : Exception
    {
        public ApiException() : base("Something went wrong with api request") { }

        public ApiException(string message) : base(message) { }
    }
}

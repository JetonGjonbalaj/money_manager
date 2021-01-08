using System;
using System.Collections.Generic;
using System.Text;

namespace MoneyManagement.Application.Wrappers
{
    public class DataResponse<T> : Response
    {
        public T Data { get; set; }

        public DataResponse() : base()
        {
        }

        public DataResponse(string message) : base(message)
        {
        }

        public DataResponse(T data, string message)
        {
            Data = data;
            Succeeded = true;
            Message = message;
            Errors = null;
        }
    }
}

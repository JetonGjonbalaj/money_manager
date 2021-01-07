using System;
using System.Collections.Generic;
using System.Text;

namespace MoneyManagement.Application.Wrappers
{
    public class DataResponse<T> : Response
    {
        public T Data { get; set; }

        public DataResponse()
        {
            Succeeded = false;
        }

        public DataResponse(string message)
        {
            Succeeded = false;
            Message = message;
        }

        public DataResponse(T data, string message = null)
        {
            Data = data;
            Succeeded = true;
            Message = message;
            Errors = null;
        }
    }
}

﻿using System;
using System.Collections.Generic;
using System.Text;

namespace MoneyManagement.Application.Wrappers
{
    public class Response<T>
    {
        public T Data { get; set; }
        public bool Succeeded { get; set; }
        public string Message { get; set; }
        public IEnumerable<string> Errors { get; set; }

        public Response() {}

        public Response(string message)
        {
            Succeeded = false;
            Message = message;
        }

        public Response(T data, string message = null)
        {
            Data = data;
            Succeeded = true;
            Message = message;
            Errors = null;
        }
    }
}

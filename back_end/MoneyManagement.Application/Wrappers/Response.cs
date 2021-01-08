using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MoneyManagement.Application.Wrappers
{
    public class Response
    {
        public bool Succeeded { get; set; }
        public string Message { get; set; }
        public IEnumerable<string> Errors { get; set; }

        public Response()
        {
            Succeeded = false;
        }

        public Response(string message, bool succeeded = false)
        {
            Succeeded = succeeded;
            Message = message;
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MoneyManagement.Application.Wrappers
{
    public class AuthResponse : Response
    {
        public string Token { get; set; }
        public DateTime? ExpireDate { get; set; }

        public AuthResponse(string message)
        {
            Succeeded = true;
            Message = message;
        }

        public AuthResponse(string message, string token, DateTime? expireDate)
        {
            Succeeded = true;
            Message = message;
            Token = token;
            ExpireDate = expireDate;
        }

        public AuthResponse(string message, bool succeeded)
        {
            Message = message;
            Succeeded = succeeded;
        }

        public AuthResponse(string message, IEnumerable<string> errors)
        {
            Succeeded = false;
            Message = message;
            Errors = errors;
        }
    }
}

using MoneyManagement.Application.Features.AuthFeatures.Commands.Login;
using MoneyManagement.Application.Features.AuthFeatures.Commands.Register;
using MoneyManagement.Application.Wrappers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MoneyManagement.Application.Interfaces
{
    public interface IUserService
    {
        Task<AuthResponse> RegisterUserAsync(RegisterCommand command);
        Task<AuthResponse> LoginUserAsync(LoginCommand command);
    }
}

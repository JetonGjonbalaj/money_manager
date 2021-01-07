using Microsoft.AspNetCore.Mvc;
using MoneyManagement.Application.Features.AuthFeatures.Commands.Login;
using MoneyManagement.Application.Features.AuthFeatures.Commands.Register;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BackEndAPI.Controllers
{
    public class AuthenticateController : BaseApiController
    {
        /// <summary>
        /// Creates a New User.
        /// </summary>
        /// <param name="command"></param>
        /// <returns></returns>
        [HttpPost("[action]")]
        public async Task<IActionResult> Register([FromBody] RegisterCommand command)
        {
            return Ok(await Mediator.Send(command));
        }

        /// <summary>
        /// Logs a user in
        /// </summary>
        /// <param name="command"></param>
        /// <returns></returns>
        [HttpPost("[action]")]
        public async Task<IActionResult> Login([FromBody] LoginCommand command)
        {
            return Ok(await Mediator.Send(command));
        }
    }
}

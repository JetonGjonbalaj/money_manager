using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MoneyManagement.Application.Exceptions;
using MoneyManagement.Application.Features.RecordFeatures.Commands.CreateIncome;
using MoneyManagement.Application.Features.RecordFeatures.Commands.DeleteIncome;
using MoneyManagement.Application.Features.RecordFeatures.Commands.UpdateIncome;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BackEndAPI.Controllers
{
    [Authorize]
    public class IncomeController : BaseApiController
    {
        /// <summary>
        /// Creates user's income
        /// </summary>
        /// <param name="command"></param>
        /// <returns></returns>
        [HttpPost("[action]")]
        public async Task<IActionResult> Create([FromBody] CreateIncomeCommand command)
        {
            return Ok(await Mediator.Send(command));
        }

        /// <summary>
        /// Updates user's income
        /// </summary>
        /// <param name="command"></param>
        /// <returns></returns>
        [HttpPut("[action]/{id}")]
        public async Task<IActionResult> Update(string id, [FromBody] UpdateIncomeCommand command)
        {
            if (id != command.Id)
            {
                throw new ApiException("Ids don't match!");
            }
            return Ok(await Mediator.Send(command));
        }

        /// <summary>
        /// Delete user's income
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpDelete("[action]/{id}")]
        public async Task<IActionResult> Delete(string id)
        {
            return Ok(await Mediator.Send(new DeleteIncomeCommand { Id = id }));
        }
    }
}

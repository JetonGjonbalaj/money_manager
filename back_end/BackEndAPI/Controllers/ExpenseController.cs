using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MoneyManagement.Application.Exceptions;
using MoneyManagement.Application.Features.RecordFeatures.Commands.CreateExpense;
using MoneyManagement.Application.Features.RecordFeatures.Commands.DeleteExpense;
using MoneyManagement.Application.Features.RecordFeatures.Commands.UpdateExpense;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BackEndAPI.Controllers
{
    [Authorize]
    public class ExpenseController : BaseApiController
    {
        /// <summary>
        /// Creates user's expense
        /// </summary>
        /// <param name="command"></param>
        /// <returns></returns>
        [HttpPost("[action]")]
        public async Task<IActionResult> Create([FromBody] CreateExpenseCommand command)
        {
            return Ok(await Mediator.Send(command));
        }

        /// <summary>
        /// Updates user's expense
        /// </summary>
        /// <param name="command"></param>
        /// <returns></returns>
        [HttpPut("[action]/{id}")]
        public async Task<IActionResult> Update(string id, [FromBody] UpdateExpenseCommand command)
        {
            if (id != command.Id)
            {
                throw new ApiException("Ids don't match!");
            }
            return Ok(await Mediator.Send(command));
        }

        /// <summary>
        /// Deletes user's expense
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpDelete("[action]/{id}")]
        public async Task<IActionResult> Delete(string id)
        {
            return Ok(await Mediator.Send(new DeleteExpenseCommand { Id = id }));
        }
    }
}

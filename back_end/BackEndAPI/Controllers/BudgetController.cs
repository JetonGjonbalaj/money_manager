using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MoneyManagement.Application.Exceptions;
using MoneyManagement.Application.Features.BudgetFeatures.CreateBudget;
using MoneyManagement.Application.Features.BudgetFeatures.DeleteBudget;
using MoneyManagement.Application.Features.BudgetFeatures.UpdateBudget;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BackEndAPI.Controllers
{
    [Authorize]
    public class BudgetController : BaseApiController
    {
        [HttpPost("[action]")]
        public async Task<IActionResult> Create([FromBody] CreateBudgetCommand command)
        {
            return Ok(await Mediator.Send(command));
        }

        [HttpPut("[action]/{id}")]
        public async Task<IActionResult> Update(string id, [FromBody] UpdateBudgetCommand command)
        {
            if (id != command.Id)
            {
                throw new ApiException("Ids don't match!");
            }
            return Ok(await Mediator.Send(command));
        }

        [HttpDelete("[action]/{id}")]
        public async Task<IActionResult> Delete(string id)
        {
            return Ok(await Mediator.Send(new DeleteBudgetCommand() { Id = id }));
        }
    }
}

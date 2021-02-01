using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MoneyManagement.Application.Features.RecordFeatures.Queries.UserBalance;
using MoneyManagement.Application.Features.RecordFeatures.Queries.UserExpensesByCategory;
using MoneyManagement.Application.Features.RecordFeatures.Queries.UserRecordsByDate;
using MoneyManagement.Application.Features.RecordFeatures.Queries.UserUpcomingExpenses;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BackEndAPI.Controllers
{
    [Authorize]
    public class RecordController : BaseApiController
    {
        [HttpGet("[action]")]
        public async Task<IActionResult> UserBalance()
        {
            return Ok(await Mediator.Send(new GetUserBalanceQuery()));
        }

        [HttpGet("[action]")]
        public async Task<IActionResult> UserUpcomingExpenses()
        {
            return Ok(await Mediator.Send(new GetUserUpcomingExpensesQuery()));
        }

        [HttpGet("[action]")]
        public async Task<IActionResult> UserExpensesByCategory()
        {
            return Ok(await Mediator.Send(new GetUserExpensesByCategoryQuery()));
        }

        [HttpGet("[action]")]
        public async Task<IActionResult> UserRecordsByDate()
        {
            return Ok(await Mediator.Send(new GetUserRecordsByDateQuery()));
        }
    }
}

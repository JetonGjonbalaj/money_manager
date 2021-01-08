using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MoneyManagement.Application.Exceptions;
using MoneyManagement.Application.Features.CategoryFeatures.Commands.CreateCategory;
using MoneyManagement.Application.Features.CategoryFeatures.Commands.DeleteCategory;
using MoneyManagement.Application.Features.CategoryFeatures.Commands.UpdateCategory;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BackEndAPI.Controllers
{
    [Authorize]
    public class CategoryController : BaseApiController
    {
        [HttpPost("[action]")]
        public async Task<IActionResult> Create(CreateCategoryCommand command)
        {
            return Ok(await Mediator.Send(command));
        }

        [HttpPut("[action]/{id}")]
        public async Task<IActionResult> Update(string id, UpdateCategoryCommand command)
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
            return Ok(await Mediator.Send(new DeleteCategoryCommand() { Id = id }));
        }
    }
}

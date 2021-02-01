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
        /// <summary>
        /// Creates a new category
        /// </summary>
        /// <param name="command"></param>
        /// <returns></returns>
        [HttpPost("[action]")]
        public async Task<IActionResult> Create([FromForm] CreateCategoryCommand command)
        {
            return Ok(await Mediator.Send(command));
        }

        /// <summary>
        /// Updates a category
        /// </summary>
        /// <param name="command"></param>
        /// <returns></returns>
        [HttpPut("[action]/{id}")]
        public async Task<IActionResult> Update(string id, [FromForm] UpdateCategoryCommand command)
        {
            if (id != command.Id)
            {
                throw new ApiException("Ids don't match!");
            }
            return Ok(await Mediator.Send(command));
        }

        /// <summary>
        /// Deletes a category
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpDelete("[action]/{id}")]
        public async Task<IActionResult> Delete(string id)
        {
            return Ok(await Mediator.Send(new DeleteCategoryCommand() { Id = id }));
        }
    }
}

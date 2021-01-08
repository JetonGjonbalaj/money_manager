using MediatR;
using MoneyManagement.Application.Exceptions;
using MoneyManagement.Application.Interfaces;
using MoneyManagement.Application.Wrappers;
using MoneyManagement.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace MoneyManagement.Application.Features.CategoryFeatures.Commands.UpdateCategory
{
    public class UpdateCategoryCommand : IRequest<DataResponse<string>>
    {
        public string Id { get; set; }
        public string Name { get; set; }
    }

    public class UpdateCategoryCommandHandler : IRequestHandler<UpdateCategoryCommand, DataResponse<string>>
    {
        private readonly ICategoryRepositoryAsync _repository;

        public UpdateCategoryCommandHandler(ICategoryRepositoryAsync repository)
        {
            _repository = repository;
        }

        public async Task<DataResponse<string>> Handle(UpdateCategoryCommand request, CancellationToken cancellationToken)
        {
            var category = await _repository.GetByIdAsync(request.Id);

            if (category == null) throw new ApiException("Category doesn't exist!");

            category.Name = request.Name;

            await _repository.UpdateAsync(category);

            return new DataResponse<string>(category.Id, "Category updated successfully!");
        }
    }
}

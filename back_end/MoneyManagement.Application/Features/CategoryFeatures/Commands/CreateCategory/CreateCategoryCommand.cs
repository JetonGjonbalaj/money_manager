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

namespace MoneyManagement.Application.Features.CategoryFeatures.Commands.CreateCategory
{
    public class CreateCategoryCommand : IRequest<DataResponse<string>>
    {
        public string Name { get; set; }
    }

    public class CreateCategoryCommandHandler : IRequestHandler<CreateCategoryCommand, DataResponse<string>>
    {
        private readonly IRepositoryAsync<Category> _repository;

        public CreateCategoryCommandHandler(IRepositoryAsync<Category> repository)
        {
            _repository = repository;
        }

        public async Task<DataResponse<string>> Handle(CreateCategoryCommand request, CancellationToken cancellationToken)
        {
            var category = new Category();
            category.Name = request.Name;

            await _repository.AddAsync(category);

            return new DataResponse<string>(category.Id, "Category added successfully!");
        }
    }
}

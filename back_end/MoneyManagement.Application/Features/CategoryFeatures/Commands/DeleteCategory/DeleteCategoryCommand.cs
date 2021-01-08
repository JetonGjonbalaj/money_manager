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

namespace MoneyManagement.Application.Features.CategoryFeatures.Commands.DeleteCategory
{
    public class DeleteCategoryCommand : IRequest<Response>
    {
        public string Id { get; set; }
    }

    public class DeleteCategoryCommandHandler : IRequestHandler<DeleteCategoryCommand, Response>
    {
        private readonly ICategoryRepositoryAsync _repository;

        public DeleteCategoryCommandHandler(ICategoryRepositoryAsync repository)
        {
            _repository = repository;
        }

        public async Task<Response> Handle(DeleteCategoryCommand request, CancellationToken cancellationToken)
        {
            var category = await _repository.GetByIdAsync(request.Id);

            if (category == null) throw new ApiException("Category doesn't exist!");

            await _repository.DeleteAsync(category);

            return new Response("Category deleted successfully!", true);
        }
    }
}

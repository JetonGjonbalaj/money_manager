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
        private readonly IFileService _imageService;

        public DeleteCategoryCommandHandler(ICategoryRepositoryAsync repository, IFileService imageService)
        {
            _repository = repository;
            _imageService = imageService;
        }

        public async Task<Response> Handle(DeleteCategoryCommand request, CancellationToken cancellationToken)
        {
            var category = await _repository.GetCategoryAsync(request.Id);

            if (category == null) throw new ApiException("Category doesn't exist!");

            var imageName = category.CategoryImage?.Image?.ImageName;

            _imageService.DeleteImage(imageName);

            await _repository.DeleteAsync(category);

            return new Response("Category deleted successfully!", true);
        }
    }
}

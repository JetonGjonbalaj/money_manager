using MediatR;
using Microsoft.AspNetCore.Http;
using MoneyManagement.Application.Exceptions;
using MoneyManagement.Application.Interfaces;
using MoneyManagement.Application.Wrappers;
using MoneyManagement.Domain.Entities;
using System;
using System.Collections.Generic;
using System.IO;
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
        public string ImageTitle { get; set; }
        public IFormFile ImageFile { get; set; }
    }

    public class UpdateCategoryCommandHandler : IRequestHandler<UpdateCategoryCommand, DataResponse<string>>
    {
        private readonly ICategoryRepositoryAsync _repository;
        private readonly IFileService _imageService;

        public UpdateCategoryCommandHandler(ICategoryRepositoryAsync repository, IFileService imageService)
        {
            _repository = repository;
            _imageService = imageService;
        }

        public async Task<DataResponse<string>> Handle(UpdateCategoryCommand request, CancellationToken cancellationToken)
        {
            var category = await _repository.GetCategoryAsync(request.Id);

            if (category == null) throw new ApiException("Category doesn't exist!");

            var categoryImage = category.CategoryImage ?? new CategoryImage();
            var image = category.CategoryImage?.Image ?? new Image();
            var imageName = category.CategoryImage?.Image?.ImageName ?? $"{Guid.NewGuid()}-{DateTime.Now.Ticks}{Path.GetExtension(request.ImageFile.FileName).ToLower()}";

            image.ImageTitle = request.ImageTitle;
            image.ImageName = imageName;

            categoryImage.Image = image;

            await _imageService.SaveImage(imageName, request.ImageFile);

            category.Name = request.Name;
            category.CategoryImage = categoryImage;

            await _repository.UpdateAsync(category);

            return new DataResponse<string>(category.Id, "Category updated successfully!");
        }
    }
}

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

namespace MoneyManagement.Application.Features.CategoryFeatures.Commands.CreateCategory
{
    public class CreateCategoryCommand : IRequest<DataResponse<string>>
    {
        public string Name { get; set; }
        public string ImageTitle { get; set; }
        public IFormFile ImageFile { get; set; }
    }

    public class CreateCategoryCommandHandler : IRequestHandler<CreateCategoryCommand, DataResponse<string>>
    {
        private readonly ICategoryRepositoryAsync _repository;
        private readonly IFileService _imageService;

        public CreateCategoryCommandHandler(ICategoryRepositoryAsync repository, IFileService imageService)
        {
            _repository = repository;
            _imageService = imageService;
        }

        public async Task<DataResponse<string>> Handle(CreateCategoryCommand request, CancellationToken cancellationToken)
        {
            var imageName = $"Images/{Guid.NewGuid()}-{DateTime.Now.Ticks}{Path.GetExtension(request.ImageFile.FileName).ToLower()}";
            await _imageService.SaveImage(imageName, request.ImageFile);

            var image = new Image();
            image.ImageTitle = request.ImageTitle;
            image.ImageName = imageName;

            var categoryImage = new CategoryImage();
            categoryImage.Image = image;

            var category = new Category();
            category.Name = request.Name;
            category.CategoryImage = categoryImage;

            await _repository.AddAsync(category);

            return new DataResponse<string>(category.Id, "Category added successfully!");
        }
    }
}

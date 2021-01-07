using MediatR;
using MoneyManagement.Application.Interfaces;
using MoneyManagement.Application.Wrappers;
using MoneyManagement.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace MoneyManagement.Application.Features.ProductFeatures.Commands.CreateProduct
{
    public class CreateProductCommand : IRequest<DataResponse<string>>
    {
        public string Barcode { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public decimal Rate { get; set; }
    }

    public class CreateProductCommandHandler : IRequestHandler<CreateProductCommand, DataResponse<string>>
    {
        private readonly IRepositoryAsync<Product> _repository;

        public CreateProductCommandHandler(IRepositoryAsync<Product> repository)
        {
            _repository = repository;
        }

        public async Task<DataResponse<string>> Handle(CreateProductCommand request, CancellationToken cancellationToken)
        {
            var product = new Product();
            product.Barcode = request.Barcode;
            product.Name = request.Name;
            product.Description = request.Description;
            product.Rate = request.Rate;

            await _repository.AddAsync(product);

            return new DataResponse<string>(product.Id, "Course created successfully!");
        }
    }
}

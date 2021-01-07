using MediatR;
using Microsoft.EntityFrameworkCore;
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

namespace MoneyManagement.Application.Features.ProductFeatures.Commands.UpdateProduct
{
    public class UpdateProductCommand : IRequest<DataResponse<string>>
    {
        public string Id { get; set; }
        public string Barcode { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public decimal Rate { get; set; }
    }

    public class UpdateProductCommandHandler : IRequestHandler<UpdateProductCommand, DataResponse<string>>
    {
        private readonly IRepositoryAsync<Product> _repository;

        public UpdateProductCommandHandler(IRepositoryAsync<Product> repository)
        {
            _repository = repository;
        }

        public async Task<DataResponse<string>> Handle(UpdateProductCommand request, CancellationToken cancellationToken)
        {
            var product = await _repository.GetByIdAsync(request.Id);

            if (product == null) throw new ApiException("Product not found!");

            product.Barcode = request.Barcode;
            product.Name = request.Name;
            product.Description = request.Description;
            product.Rate = request.Rate;

            await _repository.Update(product);

            return new DataResponse<string>(product.Id, "Product updated successfully!");
        }
    }
}

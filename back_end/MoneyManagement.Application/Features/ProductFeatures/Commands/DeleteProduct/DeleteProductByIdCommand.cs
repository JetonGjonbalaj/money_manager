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

namespace MoneyManagement.Application.Features.ProductFeatures.Commands.DeleteProduct
{
    public class DeleteProductByIdCommand : IRequest<DataResponse<string>>
    {
        public string Id { get; set; }
    }

    public class DeleteProductByIdCommandHandler : IRequestHandler<DeleteProductByIdCommand, DataResponse<string>>
    {
        private readonly IRepositoryAsync<Product> _repository;

        public DeleteProductByIdCommandHandler(IRepositoryAsync<Product> repository)
        {
            _repository = repository;
        }

        public async Task<DataResponse<string>> Handle(DeleteProductByIdCommand request, CancellationToken cancellationToken)
        {
            var product = await _repository.GetByIdAsync(request.Id);

            if (product == null) throw new ApiException("Product not found!");

            await _repository.DeleteAsync(product);

            return new DataResponse<string>(product.Id, "Product deleted successfully!");
        }
    }
}

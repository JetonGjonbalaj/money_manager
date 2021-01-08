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

namespace MoneyManagement.Application.Features.ProductFeatures.Queries.GetProductById
{
    public class GetProductByIdQuery : IRequest<DataResponse<Product>>
    {
        public string Id { get; set; }
    }

    public class GetProductByIdQueryHandler : IRequestHandler<GetProductByIdQuery, DataResponse<Product>>
    {
        private readonly IRepositoryAsync<Product> _repository;

        public GetProductByIdQueryHandler(IRepositoryAsync<Product> repository)
        {
            _repository = repository;
        }

        public async Task<DataResponse<Product>> Handle(GetProductByIdQuery request, CancellationToken cancellationToken)
        {
            var product = await _repository.GetByIdAsync(request.Id);

            if (product == null) throw new ApiException("Product not found!");

            return new DataResponse<Product>(product, "Product added successfully!");
        }
    }
}

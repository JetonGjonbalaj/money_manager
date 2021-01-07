using MediatR;
using Microsoft.EntityFrameworkCore;
using MoneyManagement.Application.Exceptions;
using MoneyManagement.Application.Interfaces;
using MoneyManagement.Application.Pagination;
using MoneyManagement.Application.Wrappers;
using MoneyManagement.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace MoneyManagement.Application.Features.ProductFeatures.Queries.GetAllProducts
{
    public class GetAllProductsQuery : IRequest<PagedResponse<IEnumerable<Product>>>
    {
        public int PageNumber { get; set; }
        public int PageSize { get; set; }

        public GetAllProductsQuery(int pageNumber, int pageSize)
        {
            PageNumber = pageNumber;
            PageSize = pageSize;
        }

        public GetAllProductsQuery(PaginationFilter paginationFilter)
        {
            PageNumber = paginationFilter.PageNumber;
            PageSize = paginationFilter.PageSize;
        }
    }

    public class GetAllProductsQueryHandler : IRequestHandler<GetAllProductsQuery, PagedResponse<IEnumerable<Product>>>
    {
        private readonly IRepositoryAsync<Product> _repository;
        private readonly IAuthenticatedUserService _authenticatedUserService;

        public GetAllProductsQueryHandler(IRepositoryAsync<Product> repository, IAuthenticatedUserService authenticatedUserService)
        {
            _repository = repository;
            _authenticatedUserService = authenticatedUserService;
        }

        public async Task<PagedResponse<IEnumerable<Product>>> Handle(GetAllProductsQuery request, CancellationToken cancellationToken)
        {
            var userId = _authenticatedUserService.UserId;
            var products = await _repository.GetPagedReponseAsync(request.PageNumber, request.PageSize);
            var totalProducts = await _repository.GetCountAsync();

            if (products.Count == 0)
                throw new ApiException("There is no data to show!");

            return new PagedResponse<IEnumerable<Product>>(products, request.PageNumber, request.PageSize, totalProducts);
        }
    }
}

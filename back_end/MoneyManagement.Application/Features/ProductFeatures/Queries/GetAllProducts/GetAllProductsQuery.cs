using MediatR;
using Microsoft.EntityFrameworkCore;
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

        public GetAllProductsQuery() { }

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
        private readonly IApplicationDbContext _context;

        public GetAllProductsQueryHandler(IApplicationDbContext context)
        {
            _context = context;
        }

        public async Task<PagedResponse<IEnumerable<Product>>> Handle(GetAllProductsQuery request, CancellationToken cancellationToken)
        {
            var products = await _context.Products.Skip((request.PageNumber - 1) * request.PageSize).Take(request.PageSize).ToListAsync();

            if (products.Count == 0) return new PagedResponse<IEnumerable<Product>>("There is no data!");
            
            var totalProducts = await _context.Products.CountAsync();

            return new PagedResponse<IEnumerable<Product>>(products.AsReadOnly(), request.PageNumber, request.PageSize, totalProducts);
        }
    }
}

using MediatR;
using Microsoft.EntityFrameworkCore;
using MoneyManagement.Application.Interfaces;
using MoneyManagement.Application.Wrappers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace MoneyManagement.Application.Features.ProductFeatures.Commands.DeleteProduct
{
    public class DeleteProductByIdCommand : IRequest<Response<int>>
    {
        public int Id { get; set; }
    }

    public class DeleteProductByIdCommandHandler : IRequestHandler<DeleteProductByIdCommand, Response<int>>
    {
        private readonly IApplicationDbContext _context;

        public DeleteProductByIdCommandHandler(IApplicationDbContext context)
        {
            _context = context;
        }

        public async Task<Response<int>> Handle(DeleteProductByIdCommand request, CancellationToken cancellationToken)
        {
            var product = await _context.Products.Where(p => p.Id == request.Id).FirstOrDefaultAsync();

            if (product == null) return new Response<int>("Product not found!");

            _context.Products.Remove(product);

            await _context.SaveChangesAsync();

            return new Response<int>(product.Id, "Product deleted successfully!");
        }
    }
}

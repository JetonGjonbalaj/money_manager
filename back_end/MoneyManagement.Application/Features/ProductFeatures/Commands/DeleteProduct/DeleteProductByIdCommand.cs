using MediatR;
using Microsoft.EntityFrameworkCore;
using MoneyManagement.Application.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace MoneyManagement.Application.Features.ProductFeatures.Commands.DeleteProduct
{
    public class DeleteProductByIdCommand : IRequest<int>
    {
        public int Id { get; set; }
    }

    public class DeleteProductByIdCommandHandler : IRequestHandler<DeleteProductByIdCommand, int>
    {
        private readonly IApplicationDbContext _context;

        public DeleteProductByIdCommandHandler(IApplicationDbContext context)
        {
            _context = context;
        }

        public async Task<int> Handle(DeleteProductByIdCommand request, CancellationToken cancellationToken)
        {
            var product = await _context.Products.Where(p => p.Id == request.Id).FirstOrDefaultAsync();

            if (product == null) return default;

            _context.Products.Remove(product);

            await _context.SaveChangesAsync();

            return product.Id;
        }
    }
}

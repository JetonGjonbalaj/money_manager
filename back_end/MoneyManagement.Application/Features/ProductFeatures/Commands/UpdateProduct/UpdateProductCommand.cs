using MediatR;
using Microsoft.EntityFrameworkCore;
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
    public class UpdateProductCommand : IRequest<Response<int>>
    {
        public int Id { get; set; }
        public string Barcode { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public decimal Rate { get; set; }
    }

    public class UpdateProductCommandHandler : IRequestHandler<UpdateProductCommand, Response<int>>
    {
        private readonly IApplicationDbContext _context;

        public UpdateProductCommandHandler(IApplicationDbContext context)
        {
            _context = context;
        }

        public async Task<Response<int>> Handle(UpdateProductCommand request, CancellationToken cancellationToken)
        {
            var product = await _context.Products.Where(p => p.Id == request.Id).FirstOrDefaultAsync();

            if (product == null) return new Response<int>("Product not found!");

            product.Barcode = request.Barcode;
            product.Name = request.Name;
            product.Description = request.Description;
            product.Rate = request.Rate;

            await _context.SaveChangesAsync();

            return new Response<int>(product.Id, "Product updated successfully!");
        }
    }
}

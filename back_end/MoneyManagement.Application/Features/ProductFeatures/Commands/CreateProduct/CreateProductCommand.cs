using MediatR;
using MoneyManagement.Application.Interfaces;
using MoneyManagement.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace MoneyManagement.Application.Features.ProductFeatures.Commands.CreateProduct
{
    public class CreateProductCommand : IRequest<int>
    {
        public string Barcode { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public decimal Rate { get; set; }
    }

    public class CreateProductCommandHandler : IRequestHandler<CreateProductCommand, int>
    {
        private readonly IApplicationDbContext _context;

        public CreateProductCommandHandler(IApplicationDbContext context)
        {
            _context = context;
        }

        public async Task<int> Handle(CreateProductCommand request, CancellationToken cancellationToken)
        {
            var product = new Product();
            product.Barcode = request.Barcode;
            product.Name = request.Name;
            product.Description = request.Description;
            product.Rate = request.Rate;

            _context.Products.Add(product);

            await _context.SaveChangesAsync();

            return product.Id;
        }
    }
}

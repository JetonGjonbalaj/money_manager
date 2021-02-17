using MediatR;
using MoneyManagement.Application.DTOs;
using MoneyManagement.Application.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace MoneyManagement.Application.Features.CategoryFeatures.Queries
{
    public class AllCategoriesQuery : IRequest<ICollection<CategoryDTO>>
    {
    }

    public class AllCatigoriesQueryHandler : IRequestHandler<AllCategoriesQuery, ICollection<CategoryDTO>>
    {
        private readonly ICategoryRepositoryAsync _categoryRepositoryAsync;

        public AllCatigoriesQueryHandler(ICategoryRepositoryAsync categoryRepositoryAsync)
        {
            _categoryRepositoryAsync = categoryRepositoryAsync;
        }

        public Task<ICollection<CategoryDTO>> Handle(AllCategoriesQuery request, CancellationToken cancellationToken)
        {
            return _categoryRepositoryAsync.GetAllCategoriesAsync();
        }
    }
}

using MediatR;
using MoneyManagement.Application.DTOs;
using MoneyManagement.Application.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace MoneyManagement.Application.Features.RecordFeatures.Queries.UserExpensesByCategory
{
    public class GetUserExpensesByCategoryQuery : IRequest<IEnumerable<ExpensesByCategoryDTO>>
    {
    }

    public class UserExpensesByCategoryQueryHandler : IRequestHandler<GetUserExpensesByCategoryQuery, IEnumerable<ExpensesByCategoryDTO>>
    {
        private readonly ICategoryRepositoryAsync _repository;
        private readonly IAuthenticatedUserService _authenticatedUser;

        public UserExpensesByCategoryQueryHandler(ICategoryRepositoryAsync repository, IAuthenticatedUserService authenticatedUser)
        {
            _repository = repository;
            _authenticatedUser = authenticatedUser;
        }

        public async Task<IEnumerable<ExpensesByCategoryDTO>> Handle(GetUserExpensesByCategoryQuery request, CancellationToken cancellationToken)
        {
            var userId = _authenticatedUser.UserId;
            return await _repository.GetUserExpensesByCategory(userId);
        }
    }
}

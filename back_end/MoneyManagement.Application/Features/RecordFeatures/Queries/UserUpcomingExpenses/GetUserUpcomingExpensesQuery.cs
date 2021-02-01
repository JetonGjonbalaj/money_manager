using MediatR;
using MoneyManagement.Application.DTOs;
using MoneyManagement.Application.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace MoneyManagement.Application.Features.RecordFeatures.Queries.UserUpcomingExpenses
{
    public class GetUserUpcomingExpensesQuery : IRequest<UpcomingExpensesDTO>
    {
    }

    public class GetUserUpcomingExpensesQueryHandler : IRequestHandler<GetUserUpcomingExpensesQuery, UpcomingExpensesDTO>
    {
        private readonly IRecordRepositoryAsync _repository;
        private readonly IAuthenticatedUserService _authenticatedUser;

        public GetUserUpcomingExpensesQueryHandler(IRecordRepositoryAsync repository, IAuthenticatedUserService authenticatedUser)
        {
            _repository = repository;
            _authenticatedUser = authenticatedUser;
        }

        public async Task<UpcomingExpensesDTO> Handle(GetUserUpcomingExpensesQuery request, CancellationToken cancellationToken)
        {
            var userId = _authenticatedUser.UserId;
            return await _repository.GetUserUpcomingExpenses(userId);
        }
    }
}

using MediatR;
using MoneyManagement.Application.DTOs;
using MoneyManagement.Application.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace MoneyManagement.Application.Features.RecordFeatures.Queries.UserBalance
{
    public class GetUserBalanceQuery : IRequest<UserBalanceDTO>
    {
    }

    public class GetUserBalanceCommandHanlder : IRequestHandler<GetUserBalanceQuery, UserBalanceDTO>
    {
        private readonly IRecordRepositoryAsync _repository;
        private readonly IAuthenticatedUserService _authenticatedUser;

        public GetUserBalanceCommandHanlder(IRecordRepositoryAsync repository, IAuthenticatedUserService authenticatedUser)
        {
            _repository = repository;
            _authenticatedUser = authenticatedUser;
        }

        public async Task<UserBalanceDTO> Handle(GetUserBalanceQuery request, CancellationToken cancellationToken)
        {
            var userId = _authenticatedUser.UserId;
            return await _repository.GetUserBalance(userId);
        }
    }
}

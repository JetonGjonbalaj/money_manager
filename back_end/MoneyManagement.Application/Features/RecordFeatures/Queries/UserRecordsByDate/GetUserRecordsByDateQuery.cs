using MediatR;
using MoneyManagement.Application.DTOs;
using MoneyManagement.Application.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace MoneyManagement.Application.Features.RecordFeatures.Queries.UserRecordsByDate
{
    public class GetUserRecordsByDateQuery : IRequest<ICollection<RecordsByDateDTO>>
    {
    }

    public class GetUserRecordsByDateQueryHandler : IRequestHandler<GetUserRecordsByDateQuery, ICollection<RecordsByDateDTO>>
    {
        private readonly IRecordRepositoryAsync _repository;
        private readonly IAuthenticatedUserService _authenticatedUser;

        public GetUserRecordsByDateQueryHandler(IRecordRepositoryAsync repository, IAuthenticatedUserService authenticatedUser)
        {
            _repository = repository;
            _authenticatedUser = authenticatedUser;
        }

        public async Task<ICollection<RecordsByDateDTO>> Handle(GetUserRecordsByDateQuery request, CancellationToken cancellationToken)
        {
            var userId = _authenticatedUser.UserId;
            return await _repository.GetUserRecordsByDate(userId);
        }
    }
}

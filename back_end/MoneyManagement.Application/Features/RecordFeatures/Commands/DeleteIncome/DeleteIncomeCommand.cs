using MediatR;
using MoneyManagement.Application.Exceptions;
using MoneyManagement.Application.Interfaces;
using MoneyManagement.Application.Wrappers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace MoneyManagement.Application.Features.RecordFeatures.Commands.DeleteIncome
{
    public class DeleteIncomeCommand : IRequest<Response>
    {
        public string Id { get; set; }
    }

    public class DeleteIncomeCommandHandler : IRequestHandler<DeleteIncomeCommand, Response>
    {
        private readonly IRecordRepositoryAsync _repository;
        private readonly IAuthenticatedUserService _authenticatedUserService;

        public DeleteIncomeCommandHandler(IRecordRepositoryAsync repository, IAuthenticatedUserService authenticatedUserService)
        {
            _repository = repository;
            _authenticatedUserService = authenticatedUserService;
        }

        public async Task<Response> Handle(DeleteIncomeCommand request, CancellationToken cancellationToken)
        {
            var userId = _authenticatedUserService.UserId;
            var income = await _repository.GetIncomeAsync(userId, request.Id);

            if (income == null) throw new ApiException("Income doesn't exist!");

            await _repository.DeleteIncomeAsync(userId, income);

            return new Response("Income deleted successfully!", true);
        }
    }
}

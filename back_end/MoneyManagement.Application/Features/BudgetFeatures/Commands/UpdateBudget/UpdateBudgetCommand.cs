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

namespace MoneyManagement.Application.Features.BudgetFeatures.Commands.UpdateBudget
{
    public class UpdateBudgetCommand : IRequest<DataResponse<string>>
    {
        public string Id { get; set; }
        public decimal Amount { get; set; }
    }

    public class UpdateBudgetCommandHandler : IRequestHandler<UpdateBudgetCommand, DataResponse<string>>
    {
        private readonly IBudgetRepositoryAsync _repository;
        private readonly IAuthenticatedUserService _authenticatedUser;

        public UpdateBudgetCommandHandler(IBudgetRepositoryAsync repository, IAuthenticatedUserService authenticatedUser)
        {
            _repository = repository;
            _authenticatedUser = authenticatedUser;
        }

        public async Task<DataResponse<string>> Handle(UpdateBudgetCommand request, CancellationToken cancellationToken)
        {
            var userId = _authenticatedUser.UserId;
            var budget = await _repository.GetUserBudget(userId, request.Id);

            if (budget == null) throw new ApiException("Budget doesn't exist!");

            budget.Amount = request.Amount;

            await _repository.UpdateAsync(budget);

            return new DataResponse<string>("Budget updated successfully!");
        }
    }
}

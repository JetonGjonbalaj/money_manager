using MediatR;
using MoneyManagement.Application.Exceptions;
using MoneyManagement.Application.Interfaces;
using MoneyManagement.Application.Wrappers;
using MoneyManagement.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace MoneyManagement.Application.Features.BudgetFeatures.CreateBudget
{
    public class CreateBudgetCommand : IRequest<DataResponse<string>>
    {
        public decimal Amount { get; set; }
    }

    public class CreateBudgetCommandHandler : IRequestHandler<CreateBudgetCommand, DataResponse<string>>
    {
        private readonly IBudgetRepositoryAsync _repository;
        private readonly IAuthenticatedUserService _authenticatedUser;

        public CreateBudgetCommandHandler(IBudgetRepositoryAsync repository, IAuthenticatedUserService authenticatedUser)
        {
            _repository = repository;
            _authenticatedUser = authenticatedUser;
        }

        public async Task<DataResponse<string>> Handle(CreateBudgetCommand request, CancellationToken cancellationToken)
        {
            var userHasBudget = await _repository.ExistsForUserAsync(_authenticatedUser.UserId);

            if (userHasBudget) throw new ApiException("User already has a budget!");

            var budget = new Budget();
            budget.UserId = _authenticatedUser.UserId;
            budget.Amount = request.Amount;

            await _repository.AddAsync(budget);

            return new DataResponse<string>(budget.Id, "Budget created successfully!");
        }
    }
}

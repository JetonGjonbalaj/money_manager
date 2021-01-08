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

namespace MoneyManagement.Application.Features.BudgetFeatures.DeleteBudget
{
    public class DeleteBudgetCommand : IRequest<Response>
    {
        public string Id { get; set; }
    }

    public class DeleteBudgetCommandHandler : IRequestHandler<DeleteBudgetCommand, Response>
    {
        private readonly IBudgetRepositoryAsync _repository;
        private readonly IAuthenticatedUserService _authenticatedUser;

        public DeleteBudgetCommandHandler(IBudgetRepositoryAsync repository, IAuthenticatedUserService authenticatedUser)
        {
            _repository = repository;
            _authenticatedUser = authenticatedUser;
        }

        public async Task<Response> Handle(DeleteBudgetCommand request, CancellationToken cancellationToken)
        {
            var userId = _authenticatedUser.UserId;
            var budget = await _repository.GetUserBudget(userId, request.Id);

            if (budget == null) throw new ApiException("Budget doesn't exist!");

            await _repository.DeleteAsync(budget);

            return new Response("Budget deleted successfully!", true);
        }
    }
}

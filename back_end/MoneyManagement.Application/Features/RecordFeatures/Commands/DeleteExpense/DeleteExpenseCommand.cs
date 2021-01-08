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

namespace MoneyManagement.Application.Features.RecordFeatures.Commands.DeleteExpense
{
    public class DeleteExpenseCommand : IRequest<Response>
    {
        public string Id { get; set; }
    }

    public class DeleteExpenseCommandHandler : IRequestHandler<DeleteExpenseCommand, Response>
    {
        private readonly IRecordRepositoryAsync _repository;
        private readonly IAuthenticatedUserService _authenticatedUserService;

        public DeleteExpenseCommandHandler(IRecordRepositoryAsync repository, IAuthenticatedUserService authenticatedUserService)
        {
            _repository = repository;
            _authenticatedUserService = authenticatedUserService;
        }

        public async Task<Response> Handle(DeleteExpenseCommand request, CancellationToken cancellationToken)
        {
            var userId = _authenticatedUserService.UserId;
            var expense = await _repository.GetExpenseAsync(userId, request.Id);

            if (expense == null) throw new ApiException("Expense doesn't exist!");

            await _repository.DeleteExpenseAsync(userId, expense);

            return new Response("Expense deleted successfully!", true);
        }
    }
}

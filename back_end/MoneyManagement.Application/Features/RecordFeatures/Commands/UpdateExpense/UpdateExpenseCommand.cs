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

namespace MoneyManagement.Application.Features.RecordFeatures.Commands.UpdateExpense
{
    public class UpdateExpenseCommand : IRequest<DataResponse<string>>
    {
        public string Id { get; set; }
        public decimal Amount { get; set; }
        public string Description { get; set; }
        public DateTime ExpendedAt { get; set; }
        public string CategoryId { get; set; }
    }

    public class UpdateExpenseCommandHandler : IRequestHandler<UpdateExpenseCommand, DataResponse<string>>
    {
        private readonly IRecordRepositoryAsync _repository;
        private readonly IAuthenticatedUserService _authenticatedUserService;

        public UpdateExpenseCommandHandler(IRecordRepositoryAsync repository, IAuthenticatedUserService authenticatedUserService)
        {
            _repository = repository;
            _authenticatedUserService = authenticatedUserService;
        }

        public async Task<DataResponse<string>> Handle(UpdateExpenseCommand request, CancellationToken cancellationToken)
        {
            var userId = _authenticatedUserService.UserId;
            var expense = await _repository.GetExpenseAsync(userId, request.Id);

            if (expense == null) throw new ApiException("Expense doesn't exist!");

            var newExpense = new Expense();
            newExpense.Id = expense.Id;
            newExpense.Amount = request.Amount;
            newExpense.Description = request.Description;
            newExpense.ExpendedAt = request.ExpendedAt;
            newExpense.CategoryId = request.CategoryId;

            await _repository.UpdateExpenseAsync(userId, newExpense);

            return new DataResponse<string>(newExpense.Id, "Expense updated successfully!");
        }
    }
}

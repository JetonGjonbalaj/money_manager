using MediatR;
using MoneyManagement.Application.Interfaces;
using MoneyManagement.Application.Wrappers;
using MoneyManagement.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace MoneyManagement.Application.Features.RecordFeatures.Commands.CreateExpense
{
    public class CreateExpenseCommand : IRequest<DataResponse<string>>
    {
        public decimal Amount { get; set; }
        public string Description { get; set; }
        public DateTime ExpendedAt { get; set; }
        public string CategoryId { get; set; }
    }

    public class CreateExpenseCommandHandler : IRequestHandler<CreateExpenseCommand, DataResponse<string>>
    {
        private readonly IRecordRepositoryAsync _repository;
        private readonly IAuthenticatedUserService _authenticatedUserService;

        public CreateExpenseCommandHandler(IRecordRepositoryAsync repository, IAuthenticatedUserService authenticatedUserService)
        {
            _repository = repository;
            _authenticatedUserService = authenticatedUserService;
        }

        public async Task<DataResponse<string>> Handle(CreateExpenseCommand request, CancellationToken cancellationToken)
        {

            var expense = new Expense();
            expense.Amount = request.Amount;
            expense.Description = request.Description;
            expense.ExpendedAt = request.ExpendedAt;
            expense.CreatedAt = DateTime.Now;
            expense.CategoryId = request.CategoryId;

            await _repository.AddExpenseAsync(_authenticatedUserService.UserId, expense);

            return new DataResponse<string>(expense.Id, "Expense added successfully!");
        }
    }
}

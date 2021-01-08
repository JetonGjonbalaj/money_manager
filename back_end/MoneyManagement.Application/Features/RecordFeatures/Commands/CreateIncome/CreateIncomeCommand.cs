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

namespace MoneyManagement.Application.Features.RecordFeatures.Commands.CreateIncome
{
    public class CreateIncomeCommand : IRequest<DataResponse<string>>
    {
        public decimal Amount { get; set; }
        public string Description { get; set; }
    }

    public class CreateIncomeCommandHandlre : IRequestHandler<CreateIncomeCommand, DataResponse<string>>
    {
        private readonly IRecordRepositoryAsync _repository;
        private readonly IAuthenticatedUserService _authenticatedUserService;

        public CreateIncomeCommandHandlre(IRecordRepositoryAsync repository, IAuthenticatedUserService authenticatedUserService)
        {
            _repository = repository;
            _authenticatedUserService = authenticatedUserService;
        }

        public async Task<DataResponse<string>> Handle(CreateIncomeCommand request, CancellationToken cancellationToken)
        {
            var income = new Income();
            income.Amount = request.Amount;
            income.Description = request.Description;
            income.CreatedAt = DateTime.Now;

            await _repository.AddIncomeAsync(_authenticatedUserService.UserId, income);

            return new DataResponse<string>(income.Id, "Income added successfully!");
        }
    }
}

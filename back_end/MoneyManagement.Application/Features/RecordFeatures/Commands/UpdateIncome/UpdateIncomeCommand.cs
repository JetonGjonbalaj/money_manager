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

namespace MoneyManagement.Application.Features.RecordFeatures.Commands.UpdateIncome
{
    public class UpdateIncomeCommand : IRequest<DataResponse<string>>
    {
        public string Id { get; set; }
        public decimal Amount { get; set; }
        public string Description { get; set; }
    }

    public class UpdateIncomeCommandHandler : IRequestHandler<UpdateIncomeCommand, DataResponse<string>>
    {
        private readonly IRecordRepositoryAsync _repository;
        private readonly IAuthenticatedUserService _authenticatedUserService;

        public UpdateIncomeCommandHandler(IRecordRepositoryAsync repository, IAuthenticatedUserService authenticatedUserService)
        {
            _repository = repository;
            _authenticatedUserService = authenticatedUserService;
        }
        public async Task<DataResponse<string>> Handle(UpdateIncomeCommand request, CancellationToken cancellationToken)
        {
            var userId = _authenticatedUserService.UserId;
            var income = await _repository.GetIncomeAsync(userId, request.Id);

            if (income == null) throw new ApiException("Income doesn't exist!");

            var newIncome = new Income();
            newIncome.Id = income.Id;
            newIncome.Amount = request.Amount;
            newIncome.Description = request.Description;

            await _repository.UpdateIncomeAsync(userId, newIncome);

            return new DataResponse<string>(newIncome.Id, "Income updated successfully!");
        }
    }
}

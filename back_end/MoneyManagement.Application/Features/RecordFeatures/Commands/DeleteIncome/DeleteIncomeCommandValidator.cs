using FluentValidation;
using MoneyManagement.Application.Constants;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MoneyManagement.Application.Features.RecordFeatures.Commands.DeleteIncome
{
    public class DeleteIncomeCommandValidator : AbstractValidator<DeleteIncomeCommand>
    {
        public DeleteIncomeCommandValidator()
        {
            RuleFor(i => i.Id)
                .NotEmpty().WithMessage(ValidationConstants.RequiredText);
        }
    }
}

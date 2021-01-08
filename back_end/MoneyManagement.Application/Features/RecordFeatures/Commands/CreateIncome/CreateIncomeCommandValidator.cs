using FluentValidation;
using MoneyManagement.Application.Constants;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MoneyManagement.Application.Features.RecordFeatures.Commands.CreateIncome
{
    public class CreateIncomeCommandValidator : AbstractValidator<CreateIncomeCommand>
    {
        public CreateIncomeCommandValidator()
        {
            RuleFor(i => i.Amount)
                .NotEmpty().WithMessage(ValidationConstants.RequiredText)
                .ScalePrecision(2, 18).WithMessage(ValidationConstants.ScalePrecisionText);

            RuleFor(i => i.Description)
                .MaximumLength(256).WithMessage(ValidationConstants.MaximumLengthText);
        }
    }
}

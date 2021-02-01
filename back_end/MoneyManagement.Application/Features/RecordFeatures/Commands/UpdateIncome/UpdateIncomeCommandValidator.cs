using FluentValidation;
using MoneyManagement.Application.Constants;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MoneyManagement.Application.Features.RecordFeatures.Commands.UpdateIncome
{
    public class UpdateIncomeCommandValidator : AbstractValidator<UpdateIncomeCommand>
    {
        public UpdateIncomeCommandValidator()
        {
            RuleFor(i => i.Id)
                .NotEmpty().WithMessage(ValidationConstants.RequiredText);

            RuleFor(i => i.Amount)
                .NotEmpty().WithMessage(ValidationConstants.RequiredText)
                .GreaterThan(0).WithMessage(ValidationConstants.GreaterThenText)
                .ScalePrecision(2, 18).WithMessage(ValidationConstants.ScalePrecisionText);

            RuleFor(i => i.Description)
                .MaximumLength(256).WithMessage(ValidationConstants.MaximumLengthText);

            RuleFor(e => e.IncomeAt)
                    .NotEmpty().WithMessage(ValidationConstants.RequiredText)
                    .Must(BeAValidDate).WithMessage(ValidationConstants.DateTimeText);
        }

        private bool BeAValidDate(DateTime dateTime)
        {
            return !(dateTime == default(DateTime));
        }
    }
}

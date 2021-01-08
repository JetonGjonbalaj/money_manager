using FluentValidation;
using MoneyManagement.Application.Constants;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MoneyManagement.Application.Features.BudgetFeatures.UpdateBudget
{
    public class UpdateBudgetCommandValidator : AbstractValidator<UpdateBudgetCommand>
    {
        public UpdateBudgetCommandValidator()
        {
            RuleFor(b => b.Id)
                .NotEmpty().WithMessage(ValidationConstants.RequiredText);

            RuleFor(b => b.Amount)
                .NotEmpty().WithMessage(ValidationConstants.RequiredText)
                .ScalePrecision(2, 18).WithMessage(ValidationConstants.ScalePrecisionText);
        }
    }
}

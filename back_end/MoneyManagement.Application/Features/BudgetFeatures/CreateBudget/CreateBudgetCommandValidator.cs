using FluentValidation;
using MoneyManagement.Application.Constants;
using MoneyManagement.Application.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace MoneyManagement.Application.Features.BudgetFeatures.CreateBudget
{
    public class CreateBudgetCommandValidator : AbstractValidator<CreateBudgetCommand>
    {
        public CreateBudgetCommandValidator()
        {
            RuleFor(b => b.Amount)
                .NotEmpty().WithMessage(ValidationConstants.RequiredText)
                .ScalePrecision(2, 18).WithMessage(ValidationConstants.ScalePrecisionText);
        }
    }
}

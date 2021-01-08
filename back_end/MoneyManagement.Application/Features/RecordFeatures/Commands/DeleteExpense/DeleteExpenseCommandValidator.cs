using FluentValidation;
using MoneyManagement.Application.Constants;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MoneyManagement.Application.Features.RecordFeatures.Commands.DeleteExpense
{
    public class DeleteExpenseCommandValidator : AbstractValidator<DeleteExpenseCommand>
    {
        public DeleteExpenseCommandValidator()
        {
            RuleFor(e => e.Id)
                .NotEmpty().WithMessage(ValidationConstants.RequiredText);
        }
    }
}

using FluentValidation;
using MoneyManagement.Application.Constants;
using MoneyManagement.Application.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace MoneyManagement.Application.Features.RecordFeatures.Commands.CreateExpense
{
    public class CreateExpenseCommandValidator : AbstractValidator<CreateExpenseCommand>
    {
        private readonly ICategoryRepositoryAsync _repository;

        public CreateExpenseCommandValidator(ICategoryRepositoryAsync repository)
        {
            _repository = repository;

            RuleFor(e => e.Amount)
                .NotEmpty().WithMessage(ValidationConstants.RequiredText)
                .ScalePrecision(2, 18).WithMessage(ValidationConstants.ScalePrecisionText);

            RuleFor(e => e.Description)
                .MaximumLength(256).WithMessage(ValidationConstants.MaximumLengthText);

            RuleFor(e => e.ExpendedAt)
                .NotEmpty().WithMessage(ValidationConstants.RequiredText)
                .Must(BeAValidDate).WithMessage(ValidationConstants.DateTimeText);

            RuleFor(e => e.CategoryId)
                .NotEmpty().WithMessage(ValidationConstants.RequiredText)
                .MustAsync(Exist).WithMessage(ValidationConstants.ShouldExistText);
        }

        private async Task<bool> Exist(string id, CancellationToken arg2)
        {
            return id == null ? true : await _repository.CategoryIdExistsAsync(id);
        }

        private bool BeAValidDate(DateTime dateTime)
        {
            return !(dateTime == default(DateTime));
        }
    }
}

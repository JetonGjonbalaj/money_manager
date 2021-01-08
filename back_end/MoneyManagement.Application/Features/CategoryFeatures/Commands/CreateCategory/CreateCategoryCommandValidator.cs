using FluentValidation;
using MoneyManagement.Application.Constants;
using MoneyManagement.Application.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace MoneyManagement.Application.Features.CategoryFeatures.Commands.CreateCategory
{
    public class CreateCategoryCommandValidator : AbstractValidator<CreateCategoryCommand>
    {
        private readonly ICategoryRepositoryAsync _repository;

        public CreateCategoryCommandValidator(ICategoryRepositoryAsync repository)
        {
            _repository = repository;

            RuleFor(c => c.Name)
                .NotEmpty().WithMessage(ValidationConstants.RequiredText)
                .MaximumLength(256).WithMessage(ValidationConstants.MaximumLengthText)
                .MustAsync(BeUniqueName).WithMessage(ValidationConstants.UniqueText);
        }

        private async Task<bool> BeUniqueName(string name, CancellationToken cancellationToken)
        {
            return (name == null) ? true : await _repository.HasUniqueNameAsync(name);
        }
    }
}

using FluentValidation;
using MoneyManagement.Application.Constants;
using MoneyManagement.Application.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace MoneyManagement.Application.Features.CategoryFeatures.Commands.UpdateCategory
{
    public class UpdateCategoryCommandValidator : AbstractValidator<UpdateCategoryCommand>
    {
        private readonly ICategoryRepositoryAsync _repository;

        public UpdateCategoryCommandValidator(ICategoryRepositoryAsync repository)
        {
            _repository = repository;

            RuleFor(c => c.Id)
                .NotEmpty().WithMessage(ValidationConstants.RequiredText);

            RuleFor(c => c.Name)
                .NotEmpty().WithMessage(ValidationConstants.RequiredText)
                .MaximumLength(256).WithMessage(ValidationConstants.MaximumLengthText)
                .MustAsync(BeUniqueName).WithMessage(ValidationConstants.UniqueText);

            RuleFor(c => c.ImageTitle)
                .NotEmpty().WithMessage(ValidationConstants.RequiredText)
                .MaximumLength(256).WithMessage(ValidationConstants.MaximumLengthText);

            RuleFor(c => c.ImageFile)
                .NotEmpty().WithMessage(ValidationConstants.RequiredText);
        }

        private async Task<bool> BeUniqueName(string name, CancellationToken cancellationToken)
        {
            return (name == null) ? true : await _repository.HasUniqueNameAsync(name);
        }
    }
}

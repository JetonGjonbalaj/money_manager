using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MoneyManagement.Application.Features.AuthFeatures.Commands.Login
{
    public class LoginCommandValidator : AbstractValidator<LoginCommand>
    {
        public LoginCommandValidator()
        {
            RuleFor(l => l.Email)
                .NotEmpty().WithMessage("{PropertyName} is required!")
                .Length(5, 256).WithMessage("{PropertyName} must be at least {MinLength} characters and not exceed {MaxLength} characters! You entered {TotalLength} characters.")
                .EmailAddress().WithMessage("{PropertyName} must be a valid email!");

            RuleFor(l => l.Password)
                .NotEmpty().WithMessage("{PropertyName} is required!")
                .MinimumLength(6).WithMessage("{PropertyName} must be at least {MinLength} characters! You entered {TotalLength} characters.");
        }
    }
}

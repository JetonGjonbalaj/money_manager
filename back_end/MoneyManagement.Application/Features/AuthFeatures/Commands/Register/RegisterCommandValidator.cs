using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MoneyManagement.Application.Features.AuthFeatures.Commands.Register
{
    public class RegisterCommandValidator : AbstractValidator<RegisterCommand>
    {
        public RegisterCommandValidator()
        {
            RuleFor(r => r.Username)
                .NotEmpty().WithMessage("{PropertyName} is required!")
                .Length(6, 256).WithMessage("{PropertyName} must be at least {MinLength} characters and not exceed {TotalLength} characters! You entered {TotalLength} characters.");

            RuleFor(r => r.Email)
                .NotEmpty().WithMessage("{PropertyName} is requried!")
                .Length(5, 256).WithMessage("{PropertyName} must be at least {MinLength} characters and not exceed {MaxLength} characters! You entered {TotalLength} characters.")
                .EmailAddress().WithMessage("{PropertyName} must be a valid email address!");

            RuleFor(r => r.Password)
                .NotEmpty().WithMessage("{PropertyName} is required!")
                .MinimumLength(6).WithMessage("{PropertyName} must be at least {MinLength} characters! You entered {TotalLength} characters.")
                .Matches(@"(?=.*[A-Z])").WithMessage("{PropertyName} must have at least 1 uppercase character!")
                .Matches(@"(?=.*[a-z])").WithMessage("{PropertyName} must have at least 1 lowercase character!")
                .Matches(@"(?=.*\d)").WithMessage("{PropertyName} must have at least 1 digit character!")
                .Matches(@"(?=.*\W)").WithMessage("{PropertyName} must have at least 1 non alphanumeric character!");


            RuleFor(r => r.ConfirmPassword)
                .NotEmpty().WithMessage("{PropertyName} is required!")
                .MinimumLength(6).WithMessage("{PropertyName} should be at least {MinLength} characters! You entered {TotalLength} characters.")
                .Equal(p => p.Password).WithMessage("{PropertyName} should be the same as Password!");
        }
    }
}

using FluentValidation;
using MoneyManagement.Application.Constants;
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
                .NotEmpty().WithMessage(ValidationConstants.RequiredText)
                .Length(6, 256).WithMessage(ValidationConstants.LengthText);

            RuleFor(r => r.Email)
                .NotEmpty().WithMessage(ValidationConstants.RequiredText)
                .Length(5, 256).WithMessage(ValidationConstants.LengthText)
                .EmailAddress().WithMessage(ValidationConstants.EmailText);

            RuleFor(r => r.Password)
                .NotEmpty().WithMessage(ValidationConstants.RequiredText)
                .MinimumLength(6).WithMessage(ValidationConstants.MinumumLengthText)
                .Matches(@"(?=.*[A-Z])").WithMessage(ValidationConstants.UppercaseText)
                .Matches(@"(?=.*[a-z])").WithMessage(ValidationConstants.LowercaseText)
                .Matches(@"(?=.*\d)").WithMessage(ValidationConstants.DigitText)
                .Matches(@"(?=.*\W)").WithMessage(ValidationConstants.AlphaNumericText);


            RuleFor(r => r.ConfirmPassword)
                .NotEmpty().WithMessage(ValidationConstants.RequiredText)
                .MinimumLength(6).WithMessage(ValidationConstants.MinumumLengthText)
                .Equal(p => p.Password).WithMessage(ValidationConstants.EqualToPasswordText);
        }
    }
}

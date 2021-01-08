using FluentValidation;
using MoneyManagement.Application.Constants;
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
                .NotEmpty().WithMessage(ValidationConstants.RequiredText)
                .Length(5, 256).WithMessage(ValidationConstants.LengthText)
                .EmailAddress().WithMessage(ValidationConstants.EmailText);

            RuleFor(l => l.Password)
                .NotEmpty().WithMessage(ValidationConstants.RequiredText)
                .MinimumLength(6).WithMessage(ValidationConstants.MinumumLengthText);
        }
    }
}

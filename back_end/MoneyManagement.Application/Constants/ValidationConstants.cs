using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MoneyManagement.Application.Constants
{
    public static class ValidationConstants
    {
        public static string RequiredText = "{PropertyName} is required.";

        public static string LengthText = "{PropertyName} must be between {MinLength} characters and {MaxLength} characters! You entered {TotalLength} characters.";

        public static string MinumumLengthText = "{PropertyName} must be at least {MinLength} characters! You entered {TotalLength} characters.";

        public static string MaximumLengthText = "{PropertyName} must be {MaxLength} characters or lower! You entered {TotalLength} characters.";

        public static string EmailText = "{PropertyName} is not a valid email!";

        public static string EqualToPasswordText = "{PropertyName} should be the same as Password!";

        public static string UppercaseText = "{PropertyName} must have at least 1 uppercase character!";

        public static string LowercaseText = "{PropertyName} must have at least 1 lowercase character!";

        public static string DigitText = "{PropertyName} must have at least 1 digit character!";

        public static string AlphaNumericText = "{PropertyName} must have at least 1 non alphanumeric character!";

        public static string ScalePrecisionText = "{PropertyName} must not be more than {ExpectedPrecision} digits in total, with allowance for {ExpectedScale} decimals. {Digits} digits and {ActualScale} decimals were found!";

        public static string DateTimeText = "{PropertyName} must be a valid date!";

        public static string UniqueText = "{PropertyName} already exists!";

        public static string ShouldExistText = "{PropertyName} does not exist!";
    }
}

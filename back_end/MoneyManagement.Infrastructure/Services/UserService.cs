using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;
using MoneyManagement.Application.Exceptions;
using MoneyManagement.Application.Features.AuthFeatures.Commands.Login;
using MoneyManagement.Application.Features.AuthFeatures.Commands.Register;
using MoneyManagement.Application.Interfaces;
using MoneyManagement.Application.Settings;
using MoneyManagement.Application.Wrappers;
using MoneyManagement.Infrastructure.Models;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace MoneyManagement.Infrastructure.Services
{
    public class UserService : IUserService
    {
        private readonly UserManager<UserIdentityModel> _userManager;
        private readonly IConfiguration _configuration;
        private readonly IOptions<JWTSettings> _jwtSettings;

        public UserService(UserManager<UserIdentityModel> userManager, IConfiguration configuration, IOptions<JWTSettings> jwtSettings)
        {
            _userManager = userManager;
            _configuration = configuration;
            _jwtSettings = jwtSettings;
        }

        public async Task<AuthResponse> LoginUserAsync(LoginCommand command)
        {
            var user = await _userManager.FindByEmailAsync(command.Email);

            if (user == null)
                throw new ApiException("User not found!");

            var result = await _userManager.CheckPasswordAsync(user, command.Password);

            if (!result)
                throw new ApiException("Password doesn't match!");

            var claims = new[]
            {
                new Claim(JwtRegisteredClaimNames.Sub, user.Id)
            };

            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_jwtSettings.Value.Key));
            var signingCredentials = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

            var token = new JwtSecurityToken(
                issuer: _jwtSettings.Value.Issuer,
                audience: _jwtSettings.Value.Audience,
                claims: claims,
                expires: DateTime.Now.AddDays(_jwtSettings.Value.DurationsInDays),
                signingCredentials: signingCredentials);

            string tokenAsString = new JwtSecurityTokenHandler().WriteToken(token);

            return new AuthResponse("Login successfuly!", tokenAsString, token.ValidTo);
        }

        public async Task<AuthResponse> RegisterUserAsync(RegisterCommand command)
        {
            var user = await _userManager.FindByEmailAsync(command.Email);

            if (user != null)
                throw new ApiException("Email aleary in use!");
            var identityUser = new UserIdentityModel
            {
                UserName = command.Username,
                Email = command.Email,
            };

            var result = await _userManager.CreateAsync(identityUser, command.Password);

            if (result.Succeeded)
                return new AuthResponse("User created successfuly!");

            return new AuthResponse("User could not be created!", result.Errors.Select(e => e.Description));
        }
    }
}

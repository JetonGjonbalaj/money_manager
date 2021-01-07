using FluentValidation;
using MediatR;
using Microsoft.Extensions.DependencyInjection;
using MoneyManagement.Application.Behaviours;
using System;
using System.Collections.Generic;
using System.Reflection;
using System.Text;

namespace MoneyManagement.Application
{
    public static class ServiceExtensions
    {
        public static void AddApplication(this IServiceCollection services)
        {
            services.AddMediatR(Assembly.GetExecutingAssembly());
            services.AddValidatorsFromAssembly(Assembly.GetExecutingAssembly());
            services.AddTransient(typeof(IPipelineBehavior<,>), typeof(ValidationBehaviour<,>));
        }
    }
}

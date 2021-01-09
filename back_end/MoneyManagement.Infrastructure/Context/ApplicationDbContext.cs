using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using MoneyManagement.Application.Interfaces;
using MoneyManagement.Domain.Entities;
using MoneyManagement.Infrastructure.Configurations;
using MoneyManagement.Infrastructure.Models;
using MoneyManagement.Infrastructure.Seed;
using System;
using System.Collections.Generic;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace MoneyManagement.Infrastructure.Context
{
    public class ApplicationDbContext : IdentityDbContext<UserIdentityModel>
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
        : base(options)
        {
        }

        public DbSet<Budget> Budgets { get; set; }
        public DbSet<Category> Categories { get; set; }
        public DbSet<CategoryImage> CategoryImages { get; set; }
        //public DbSet<Expense> Expenses { get; set; }
        //public DbSet<Income> Incomes { get; set; }
        public DbSet<Record> Records { get; set; }

        protected override void OnModelCreating(ModelBuilder builder)
        {
            builder.ApplyConfigurationsFromAssembly(Assembly.GetExecutingAssembly());
            builder.Seed();

            base.OnModelCreating(builder);
        }
    }
}

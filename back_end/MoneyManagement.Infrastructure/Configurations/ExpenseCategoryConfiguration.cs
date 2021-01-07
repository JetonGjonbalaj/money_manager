using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MoneyManagement.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MoneyManagement.Infrastructure.Configurations
{
    public class ExpenseCategoryConfiguration : IEntityTypeConfiguration<ExpenseCategory>
    {
        public void Configure(EntityTypeBuilder<ExpenseCategory> builder)
        {
            builder.HasOne(ec => ec.Expense)
                .WithOne(e => e.ExpenseCategory)
                .HasForeignKey<ExpenseCategory>(ec => ec.ExpenseId);

            builder.HasOne(ec => ec.Category)
                .WithOne(c => c.ExpenseCategory)
                .HasForeignKey<ExpenseCategory>(ec => ec.CategoryId);
        }
    }
}

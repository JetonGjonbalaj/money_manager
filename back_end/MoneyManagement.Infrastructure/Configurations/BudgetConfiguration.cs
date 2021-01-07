using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MoneyManagement.Domain.Entities;
using MoneyManagement.Infrastructure.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MoneyManagement.Infrastructure.Configurations
{
    public class BudgetConfiguration : IEntityTypeConfiguration<Budget>
    {
        public void Configure(EntityTypeBuilder<Budget> builder)
        {   
            builder.HasOne<UserIdentityModel>()
                .WithOne(ui => ui.Budget)
                .HasForeignKey<Budget>(b => b.UserId);

            builder.Property(b => b.UserId)
                .IsRequired();

            builder.Property(b => b.Amount)
                .HasPrecision(16, 2)
                .IsRequired();
        }
    }
}

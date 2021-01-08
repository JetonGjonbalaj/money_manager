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
    public class IncomeConfiguration : IEntityTypeConfiguration<Income>
    {
        public void Configure(EntityTypeBuilder<Income> builder)
        {
            builder.Property(e => e.Id)
                .ValueGeneratedOnAdd();

            builder.Property(i => i.Amount)
                .HasPrecision(18, 2)
                .IsRequired();

            builder.Property(i => i.Description)
                .HasMaxLength(256)
                .IsRequired();

            builder.Property(i => i.CreatedAt)
                .IsRequired();
        }
    }
}

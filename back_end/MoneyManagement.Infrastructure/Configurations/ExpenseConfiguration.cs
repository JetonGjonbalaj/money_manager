﻿using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MoneyManagement.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MoneyManagement.Infrastructure.Configurations
{
    public class ExpenseConfiguration : IEntityTypeConfiguration<Expense>
    {
        public void Configure(EntityTypeBuilder<Expense> builder)
        {
            builder.HasKey(b => b.Id);

            builder.Property(e => e.Id)
                .ValueGeneratedOnAdd();

            builder.HasOne(e => e.Category)
                .WithMany(c => c.Expenses)
                .OnDelete(DeleteBehavior.SetNull);

            builder.Property(e => e.Amount)
                .HasPrecision(18, 2)
                .IsRequired();

            builder.Property(e => e.Description)
                .HasMaxLength(256)
                .IsRequired(false);

            builder.Property(e => e.ExpendedAt)
                .IsRequired();

            builder.Property(e => e.CreatedAt)
                .IsRequired();
        }
    }
}

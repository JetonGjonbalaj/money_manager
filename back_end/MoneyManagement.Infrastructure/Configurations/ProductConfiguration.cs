using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MoneyManagement.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace MoneyManagement.Infrastructure.Configurations
{
    public class ProductConfiguration : IEntityTypeConfiguration<Product>
    {
        public void Configure(EntityTypeBuilder<Product> builder)
        {
            builder.HasKey(b => b.Id);

            builder.Property(p => p.Id)
                .HasMaxLength(450)
                .ValueGeneratedOnAdd()
                .IsRequired();

            builder.Property(p => p.Barcode)
                .HasMaxLength(20)
                .IsRequired();

            builder.Property(p => p.Name)
                .HasMaxLength(200)
                .IsRequired();

            builder.Property(p => p.Rate)
                .HasPrecision(5, 2)
                .IsRequired();
        }
    }
}

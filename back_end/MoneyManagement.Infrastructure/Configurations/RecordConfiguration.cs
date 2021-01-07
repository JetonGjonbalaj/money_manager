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
    public class RecordConfiguration : IEntityTypeConfiguration<Record>
    {
        public void Configure(EntityTypeBuilder<Record> builder)
        {
            builder.HasKey(b => b.Id);

            builder.HasOne<UserIdentityModel>()
                .WithOne(ui => ui.Record)
                .HasForeignKey<Record>(r => r.UserId);

            builder.HasMany(r => r.Expenses)
                .WithOne(e => e.Record)
                .HasForeignKey(e => e.RecordId);

            builder.HasMany(r => r.Incomes)
                .WithOne(e => e.Record)
                .HasForeignKey(e => e.RecordId);

            builder.Property(r => r.Id)
                .HasMaxLength(450)
                .ValueGeneratedOnAdd()
                .IsRequired();

            builder.Property(r => r.UserId)
                .IsRequired();
        }
    }
}

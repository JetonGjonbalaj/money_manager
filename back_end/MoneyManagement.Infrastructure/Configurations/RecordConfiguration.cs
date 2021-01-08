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
            builder.Property(e => e.Id)
                .ValueGeneratedOnAdd();

            builder.HasOne<UserIdentityModel>()
                .WithOne(ui => ui.Record)
                .HasForeignKey<Record>(r => r.UserId)
                .OnDelete(DeleteBehavior.Cascade);

            builder.HasMany(r => r.Expenses)
                .WithOne(e => e.Record)
                .HasForeignKey(e => e.RecordId)
                .OnDelete(DeleteBehavior.Cascade);

            builder.HasMany(r => r.Incomes)
                .WithOne(e => e.Record)
                .HasForeignKey(e => e.RecordId)
                .OnDelete(DeleteBehavior.Cascade);

            builder.Property(r => r.UserId)
                .IsRequired();
        }
    }
}

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
    public class CategoryImageConfiguration : IEntityTypeConfiguration<CategoryImage>
    {
        public void Configure(EntityTypeBuilder<CategoryImage> builder)
        {
            builder.Property(e => e.Id)
                .ValueGeneratedOnAdd();

            builder.HasOne(ci => ci.Image)
                .WithOne()
                .HasForeignKey<CategoryImage>(ci => ci.ImageId)
                .OnDelete(DeleteBehavior.Cascade);

            builder.HasOne(ci => ci.Category)
                .WithOne(c => c.CategoryImage)
                .HasForeignKey<CategoryImage>(ci => ci.CategoryId)
                .OnDelete(DeleteBehavior.SetNull);
        }
    }
}

using Microsoft.EntityFrameworkCore;
using MoneyManagement.Infrastructure.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MoneyManagement.Infrastructure.Seed
{
    public static class ModelBuilderExtensions
    {
        public static void Seed(this ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<UserIdentityModel>()
                .HasData(
                    new UserIdentityModel()
                    {
                        Id = "17a07fe5-c868-435f-9814-51cf10173e5d",
                        UserName = "AdminUser",
                        NormalizedUserName = "ADMINUSER",
                        Email = "admin@admin.com",
                        NormalizedEmail = "ADMIN@ADMIN.COM",
                        EmailConfirmed = true,
                        PasswordHash = "AQAAAAEAACcQAAAAEFbPDbmUSWpXHcRKUgW5l3YTOkJ5tr3g+3wtH8KJcuNXYBzxFGG7Z5R5i4fmof5IwQ==",
                        SecurityStamp = "GKGJTG4HMUVSX467KB5YVH2QK2CGLJQ5",
                        ConcurrencyStamp = "0d05cc2b-13ea-44d5-b6ee-dfbdd3cbdb45",
                        PhoneNumber = null,
                        PhoneNumberConfirmed = false,
                        TwoFactorEnabled = false,
                        LockoutEnd = null,
                        LockoutEnabled = true,
                        AccessFailedCount = 0
                    }
                );
        }
    }
}

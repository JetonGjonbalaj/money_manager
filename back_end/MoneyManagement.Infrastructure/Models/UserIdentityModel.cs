using Microsoft.AspNetCore.Identity;
using MoneyManagement.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MoneyManagement.Infrastructure.Models
{
    public class UserIdentityModel : IdentityUser
    {
        public Budget Budget { get; set; }
        public Record Record { get; set; }
    }
}

using MoneyManagement.Domain.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MoneyManagement.Domain.Entities
{
    public class Budget : BaseEntity
    {
        public string UserId { get; set; }
        public decimal Amount { get; set; }
    }
}

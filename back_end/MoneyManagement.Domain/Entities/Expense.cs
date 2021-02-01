using MoneyManagement.Domain.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MoneyManagement.Domain.Entities
{
    public class Expense : AuditableEntity
    {
        public decimal Amount { get; set; }
        public string Description { get; set; }
        public DateTime ExpendedAt { get; set; }

        public string CategoryId { get; set; }
        public Category Category { get; set; }

        public string RecordId { get; set; }
        public Record Record { get; set; }
    }
}

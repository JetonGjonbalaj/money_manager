using MoneyManagement.Domain.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MoneyManagement.Domain.Entities
{
    public class ExpenseCategory : BaseEntity
    {
        public string ExpenseId { get; set; }
        public Expense Expense { get; set; }

        public string CategoryId { get; set; }
        public Category Category { get; set; }
    }
}

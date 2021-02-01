using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MoneyManagement.Application.DTOs
{
    public class ExpenseDTO
    {
        public decimal Amount { get;set; }
        public string Description { get; set; }
        public DateTime DateTime { get; set; }
    }
}

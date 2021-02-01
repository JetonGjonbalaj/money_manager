using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MoneyManagement.Application.DTOs
{
    public class ExpensesByCategoryDTO
    {
        public string CategoryId { get; set; }
        public string CategoryImg { get; set; }
        public string CategoryName { get; set; }
        public decimal Amount { get; set; }
    }
}

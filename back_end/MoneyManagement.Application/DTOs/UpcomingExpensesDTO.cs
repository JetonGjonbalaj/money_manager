using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MoneyManagement.Application.DTOs
{
    public class UpcomingExpensesDTO
    {
        public decimal UpcomingExpensesAmount { get; set; }
        public ICollection<ExpenseDTO> UpcomingExpenses { get; set; }
    }
}

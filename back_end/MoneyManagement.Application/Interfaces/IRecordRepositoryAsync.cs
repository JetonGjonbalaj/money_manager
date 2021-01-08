using MoneyManagement.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MoneyManagement.Application.Interfaces
{
    public interface IRecordRepositoryAsync : IRepositoryAsync<Record>
    {
        //Task<Record> GetUserRecordAsync(string userId);
        Task<Expense> GetExpenseAsync(string userId, string expenseId);
        Task AddExpenseAsync(string userId, Expense expense);
        Task UpdateExpenseAsync(string userId, Expense expense);
        Task DeleteExpenseAsync(string userId, Expense expense);
    }
}

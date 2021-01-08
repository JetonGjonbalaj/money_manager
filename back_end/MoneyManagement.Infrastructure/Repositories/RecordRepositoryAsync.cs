using Microsoft.EntityFrameworkCore;
using MoneyManagement.Application.Interfaces;
using MoneyManagement.Domain.Entities;
using MoneyManagement.Infrastructure.Context;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MoneyManagement.Infrastructure.Repositories
{
    public class RecordRepositoryAsync : RepositoryAsync<Record>, IRecordRepositoryAsync
    {
        private readonly DbSet<Record> _records;

        public RecordRepositoryAsync (ApplicationDbContext _dbContext) : base(_dbContext)
        {
            _records = _dbContext.Set<Record>();
        }

        private async Task<Record> GetUserRecordAsync(string userId)
        {
            return await _records.Include(r => r.Expenses).ThenInclude(e => e.ExpenseCategory).Include(r => r.Incomes).SingleOrDefaultAsync(r => r.UserId == userId);
        }

        public async Task<Expense> GetExpenseAsync(string userId, string expenseId)
        {
            var record = await GetUserRecordAsync(userId);
            var expense = record.Expenses.SingleOrDefault(e => e.Id == expenseId);

            return expense;
        }

        public async Task AddExpenseAsync(string userId, Expense expense)
        {
            var record = await GetUserRecordAsync(userId);

            if (record == null)
            {
                record = new Record();
                record.UserId = userId;
                await AddAsync(record);
            }

            record.Expenses.Add(expense);
            await UpdateAsync(record);
        }

        public async Task UpdateExpenseAsync(string userId, Expense expense)
        {
            var record = await GetUserRecordAsync(userId);
            var oldExpense = record.Expenses.SingleOrDefault(e => e.Id == expense.Id);

            record.Expenses.Remove(oldExpense);
            record.Expenses.Add(expense);
            await UpdateAsync(record);
        }

        public async Task DeleteExpenseAsync(string userId, Expense expense)
        {
            var record = await GetUserRecordAsync(userId);

            record.Expenses.Remove(expense);
            await UpdateAsync(record);
        }
    }
}

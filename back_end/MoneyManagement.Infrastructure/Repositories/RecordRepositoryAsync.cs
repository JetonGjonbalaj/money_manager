using Microsoft.EntityFrameworkCore;
using MoneyManagement.Application.DTOs;
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
            return await _records.Include(r => r.Expenses).ThenInclude(e => e.Category).Include(r => r.Incomes).SingleOrDefaultAsync(r => r.UserId == userId);
        }

        public async Task<Expense> GetExpenseAsync(string userId, string expenseId)
        {
            //var record = await GetUserRecordAsync(userId);
            return await _records.Where(r => r.UserId == userId).SelectMany(r => r.Expenses).Include(e => e.Category).SingleOrDefaultAsync(e => e.Id == expenseId);
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

        public async Task<Income> GetIncomeAsync(string userId, string incomeId)
        {
            return await _records.Where(r => r.UserId == userId).SelectMany(r => r.Incomes).SingleOrDefaultAsync(e => e.Id == incomeId);
        }

        public async Task AddIncomeAsync(string userId, Income income)
        {
            var record = await GetUserRecordAsync(userId);

            if (record == null)
            {
                record = new Record();
                record.UserId = userId;
                await AddAsync(record);
            }

            record.Incomes.Add(income);
            await UpdateAsync(record);
        }

        public async Task UpdateIncomeAsync(string userId, Income income)
        {
            var record = await GetUserRecordAsync(userId);
            var oldIncome = record.Incomes.SingleOrDefault(e => e.Id == income.Id);

            record.Incomes.Remove(oldIncome);
            record.Incomes.Add(income);
            await UpdateAsync(record);
        }

        public async Task DeleteIncomeAsync(string userId, Income income)
        {
            var record = await GetUserRecordAsync(userId);

            record.Incomes.Remove(income);
            await UpdateAsync(record);
        }

        public async Task<UserBalanceDTO> GetUserBalance(string userId)
        {
            //var userBalance = await (
            //    from record in _records
            //    where record.UserId == userId
            //    select record.Incomes.Sum(i => i.Amount) - record.Expenses.Sum(e => e.Amount)
            //).SingleOrDefaultAsync();
            var userBalance = await
                _records.Where(r => r.UserId == userId)
                .Select(r => r.Incomes.Where(i => i.IncomeAt <= DateTime.Now).Sum(i => i.Amount) - r.Expenses.Where(e => e.ExpendedAt <= DateTime.Now).Sum(e => e.Amount))
                .SingleOrDefaultAsync();

            return new UserBalanceDTO() { BalanceAmount = userBalance };
        }

        public async Task<UpcomingExpensesDTO> GetUserUpcomingExpenses(string userId)
        {
            var userUpcomingExpenses = await
                _records.Where(r => r.UserId == userId)
                .Select(
                    r => new UpcomingExpensesDTO()
                    {
                        UpcomingExpensesAmount = r.Expenses.Where(e => e.ExpendedAt >= DateTime.Now).Sum(e => e.Amount),
                        UpcomingExpenses = r.Expenses.Where(e => e.ExpendedAt >= DateTime.Now).Select(e => new ExpenseDTO() { 
                            Amount = e.Amount,
                            Description = e.Description,
                            DateTime = e.ExpendedAt
                        }).ToList(),
                    })
                .SingleOrDefaultAsync();

            return userUpcomingExpenses ?? new UpcomingExpensesDTO();
        }

        public async Task<ICollection<RecordsByDateDTO>> GetUserRecordsByDate(string userId)
        {
            var userExpenses = _context.Set<Expense>()
                .Where(e => e.Record.UserId == userId)
                .Select(e => 
                    new RecordDTO() {
                        Description = e.Description,
                        Amount = e.Amount,
                        DateTime = e.ExpendedAt,
                        Type = nameof(Expense)
                    });

            var userIncome = _context.Set<Income>()
                .Where(e => e.Record.UserId == userId)
                .Select(i => 
                    new RecordDTO()
                    {
                        Description = i.Description,
                        Amount = i.Amount,
                        DateTime = i.IncomeAt,
                        Type = nameof(Income)
                    });

            var userRecords =
                userExpenses.Union(userIncome)
                .ToLookup(r => r.DateTime.Date)
                .OrderByDescending(r => r.Key)
                .Select(r =>
                    new RecordsByDateDTO()
                    {
                        Date = r.Key.ToString("yyyy-MM-dd"),
                        Records = r.OrderBy(ri => ri.DateTime).ToList()
                    })
                .ToList();

            return userRecords;
        }
    }
}

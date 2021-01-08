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
    public class BudgetRepositoryAsync : RepositoryAsync<Budget>, IBudgetRepositoryAsync
    {
        private readonly DbSet<Budget> _budgets;

        public BudgetRepositoryAsync(ApplicationDbContext dbContext) : base(dbContext)
        {
            _budgets = dbContext.Set<Budget>();
        }

        public async Task<bool> ExistsForUserAsync(string userId)
        {
            return await _budgets.AnyAsync(b => b.UserId == userId);
        }

        public async Task<Budget> GetUserBudget(string userId, string budgetId)
        {
            return await _budgets.SingleOrDefaultAsync(b => b.UserId == userId && b.Id == budgetId);
        }
    }
}

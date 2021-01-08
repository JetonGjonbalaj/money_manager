using MoneyManagement.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MoneyManagement.Application.Interfaces
{
    public interface IBudgetRepositoryAsync : IRepositoryAsync<Budget>
    {
        Task<bool> ExistsForUserAsync(string userId);
        Task<Budget> GetUserBudget(string userId, string budgetId);
    }
}

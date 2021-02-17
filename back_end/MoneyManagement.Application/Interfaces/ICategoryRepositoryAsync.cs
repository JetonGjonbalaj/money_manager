using MoneyManagement.Application.DTOs;
using MoneyManagement.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MoneyManagement.Application.Interfaces
{
    public interface ICategoryRepositoryAsync : IRepositoryAsync<Category>
    {
        Task<ICollection<CategoryDTO>> GetAllCategoriesAsync();
        Task<Category> GetCategoryAsync(string id);
        Task<bool> HasUniqueNameAsync(string name);
        Task<bool> CategoryIdExistsAsync(string id);
        public Task<IEnumerable<ExpensesByCategoryDTO>> GetUserExpensesByCategory(string userId);
    }
}

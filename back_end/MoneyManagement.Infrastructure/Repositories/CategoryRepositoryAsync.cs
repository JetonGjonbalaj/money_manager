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
    public class CategoryRepositoryAsync : RepositoryAsync<Category>, ICategoryRepositoryAsync
    {
        private readonly DbSet<Category> _categories;

        public CategoryRepositoryAsync(ApplicationDbContext dbContext) : base(dbContext)
        {
            _categories = dbContext.Set<Category>();
        }

        public async Task<bool> CategoryIdExistsAsync(string id)
        {
            return await _categories.AnyAsync(c => c.Id == id);
        }

        public async Task<Category> GetCategoryAsync(string id)
        {
            return await _categories.Include(c => c.CategoryImage).ThenInclude(ci => ci.Image).SingleOrDefaultAsync(c => c.Id == id);
        }

        public async Task<IEnumerable<ExpensesByCategoryDTO>> GetUserExpensesByCategory(string userId)
        {
            var userExpensesByCategory = await
                _categories
                .Select(c =>
                    new ExpensesByCategoryDTO()
                    {
                        CategoryId = c.Id,
                        CategoryImg = c.CategoryImage.Image.ImageName,
                        CategoryName = c.Name,
                        Amount = c.Expenses.Where(e => e.Record.UserId == userId && e.ExpendedAt <= DateTime.Now).Sum(e => e.Amount)
                    })
                .ToListAsync();

            return userExpensesByCategory;
        }

        public async Task<bool> HasUniqueNameAsync(string name)
        {
            return await _categories.AllAsync(c => c.Name != name);
        }
    }
}

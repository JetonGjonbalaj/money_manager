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

        public async Task<bool> HasUniqueNameAsync(string name)
        {
            return await _categories.AllAsync(c => c.Name != name);
        }
    }
}

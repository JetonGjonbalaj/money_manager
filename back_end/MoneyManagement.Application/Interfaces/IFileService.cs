using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MoneyManagement.Application.Interfaces
{
    public interface IFileService
    {
        Task SaveImage(string fileName, IFormFile image);
        void DeleteImage(string fileName);
    }
}

using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using MoneyManagement.Application.Exceptions;
using MoneyManagement.Application.Interfaces;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BackEndAPI.Services
{
    public class FileService : IFileService
    {
        private readonly IWebHostEnvironment _hostEnvironment;

        private const int MegaByte = 1024 * 1024;
        private const int MaxMegaBytes = 2 * MegaByte;
        private const string ImageDirectory = "\\Images";
        private string[] permittedExtensions = { ".jpg", ".jpeg", ".png" };

        public FileService(IWebHostEnvironment hostEnvironment)
        {
            _hostEnvironment = hostEnvironment;
        }

        public async Task SaveImage(string fileName, IFormFile image)
        {
            var extension = Path.GetExtension(image.FileName);

            if (IsValidImage(image.Length, extension))
            {
                var rootPath = _hostEnvironment.WebRootPath;
                var imagesPath = Path.Combine(rootPath + ImageDirectory, fileName);

                await SaveFile(imagesPath, image);
            }
        }

        public void DeleteImage(string fileName)
        {
            if (fileName == null) return;

            var rootPath = _hostEnvironment.WebRootPath;
            var filePath = Path.Combine(rootPath + ImageDirectory, fileName);

            DeleteFile(filePath);
        }

        private async Task SaveFile(string path, IFormFile file)
        {
            using (var fileStream = new FileStream(path, FileMode.Create))
            {
                await file.CopyToAsync(fileStream);
            }
        }

        private void DeleteFile(string filePath)
        {
            if (File.Exists(filePath))
                File.Delete(filePath);
        }

        private bool IsValidImage(long byteSize, string ext)
        {
            if (byteSize > MaxMegaBytes) throw new ImageException($"File should not exceed {MaxMegaBytes / MegaByte}MB!");
            if (!IsExtensionValid(ext)) throw new ImageException($"Allowed file extensions: {string.Join(" ", permittedExtensions)}");

            return true;
        }

        private bool IsExtensionValid(string ext)
        {
            return !string.IsNullOrEmpty(ext) && permittedExtensions.Contains(ext, StringComparer.OrdinalIgnoreCase);
        }
    }
}

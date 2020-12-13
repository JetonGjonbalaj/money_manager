using System;
using System.Collections.Generic;
using System.Text;

namespace MoneyManagement.Application.Wrappers
{
    public class PagedResponse<T> : Response<T>
    {
        public int PageNumber { get; set; }
        public int PageSize { get; set; }
        public int TotalPages { get; set; }
        public int TotalRecords { get; set; }

        public PagedResponse(string message) : base(message)
        {}

        public PagedResponse(T data, int pageNumber, int pageSize, int totalPages, int totalRecords)
        {
            PageNumber = pageNumber;
            PageSize = pageSize;
            TotalPages = totalPages;
            TotalRecords = totalRecords;
            Data = data;
            Message = null;
            Succeeded = true;
            Errors = null;
        }
    }
}

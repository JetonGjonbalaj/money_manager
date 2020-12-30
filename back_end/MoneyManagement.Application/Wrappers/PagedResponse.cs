using System;
using System.Collections.Generic;
using System.Text;

namespace MoneyManagement.Application.Wrappers
{
    public class PagedResponse<T> : Response<T>
    {
        public int PageNumber { get; set; }
        public int PageSize { get; set; }
        public int TotalRecords { get; set; }
        public int TotalPages
        {
            get
            {
                return Convert.ToInt32(Math.Ceiling(1.0 * TotalRecords / PageSize));
            }
        }

        public PagedResponse(string message) : base(message)
        {}

        public PagedResponse(T data, int pageNumber, int pageSize, int totalRecords)
        {
            PageNumber = pageNumber;
            PageSize = pageSize;
            TotalRecords = totalRecords;
            Data = data;
            Message = null;
            Succeeded = true;
            Errors = null;
        }
    }
}

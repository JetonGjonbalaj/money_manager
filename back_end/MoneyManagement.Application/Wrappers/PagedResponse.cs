using System;
using System.Collections.Generic;
using System.Text;

namespace MoneyManagement.Application.Wrappers
{
    public class PagedResponse<T> : DataResponse<T>
    {
        private int _pageSize;

        public int PageNumber { get; set; }
        public int TotalRecords { get; set; }
        public int PageSize
        {
            get
            {
                return _pageSize > 0 ? _pageSize : 1;
            }
            set
            {
                _pageSize = value;
            }
        }
        public int TotalPages
        {
            get
            {
                return Convert.ToInt32(Math.Ceiling(1.0 * TotalRecords / PageSize));
            }
        }

        public PagedResponse(string message, int pageNumber, int pageSize, int totalRecords) : base(message)
        {
            PageNumber = pageNumber;
            PageSize = pageSize;
            TotalRecords = totalRecords;
        }

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

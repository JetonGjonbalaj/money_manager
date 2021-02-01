using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MoneyManagement.Application.DTOs
{
    public class RecordDTO
    {
        public string Description { get; set; }
        public DateTime DateTime { get; set; }
        public decimal Amount { get; set; }
        public string Type { get; set; }
    }
}

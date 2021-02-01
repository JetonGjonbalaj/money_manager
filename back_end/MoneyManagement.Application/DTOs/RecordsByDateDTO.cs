using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MoneyManagement.Application.DTOs
{
    public class RecordsByDateDTO
    {
        public string Date { get; set; }
        public ICollection<RecordDTO> Records { get; set; }
    }
}

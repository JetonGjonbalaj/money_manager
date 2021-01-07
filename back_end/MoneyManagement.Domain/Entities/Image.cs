using MoneyManagement.Domain.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MoneyManagement.Domain.Entities
{
    public class Image : BaseEntity
    {
        public string ImageTitle { get; set; }
        public string ImageName { get; set; }
    }
}

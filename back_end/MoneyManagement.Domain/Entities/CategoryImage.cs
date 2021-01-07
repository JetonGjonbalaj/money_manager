using MoneyManagement.Domain.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MoneyManagement.Domain.Entities
{
    public class CategoryImage : BaseEntity
    {
        public string ImageId { get; set; }
        public Image Image { get; set; }

        public string CategoryId { get; set; }
        public Category Category { get; set; }
    }
}

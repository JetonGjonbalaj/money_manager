using System;
using System.Collections.Generic;
using System.Text;

namespace MoneyManagement.Domain.Common
{
    public abstract class AuditableEntity : BaseEntity
    {
        public virtual DateTime CreatedAt { get; set; }
    }
}

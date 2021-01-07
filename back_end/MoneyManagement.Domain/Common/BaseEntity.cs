using System;
using System.Collections.Generic;
using System.Text;

namespace MoneyManagement.Domain.Common
{
    public abstract class BaseEntity
    {
        public virtual string Id { get; set; }
    }
}

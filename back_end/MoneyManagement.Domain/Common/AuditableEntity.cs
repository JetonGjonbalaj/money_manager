using System;
using System.Collections.Generic;
using System.Text;

namespace MoneyManagement.Domain.Common
{
    public class AuditableEntity
    {
        public virtual int Id { get; set; }

        public DateTime Created { get; set; }

        public string CreatedBy { get; set; }

        public DateTime? LastModified { get; set; }

        public string LastModifiedBy { get; set; }
    }
}

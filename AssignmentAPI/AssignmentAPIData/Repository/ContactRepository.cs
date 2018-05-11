using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AssignmentAPIData;

namespace AssignmentAPIData.Repository
{
    public class ContactRepository : GenericRepository<AssignmentDBEntities2, Contact>, IContactRepository
    {
    }
}

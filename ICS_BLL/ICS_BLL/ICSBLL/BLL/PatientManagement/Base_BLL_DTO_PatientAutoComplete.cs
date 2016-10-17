using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ICSBLL.BLL.PatientManagement
{
    public class Base_BLL_DTO_PatientAutoComplete
    {
        public string PK_PatientID { get; set; }

        public string FullName { get; set; }

        public string ImageUrl { get; set; }

        public string MobileNo { get; set; }

        public string Location { get; set; }
        
    }
}

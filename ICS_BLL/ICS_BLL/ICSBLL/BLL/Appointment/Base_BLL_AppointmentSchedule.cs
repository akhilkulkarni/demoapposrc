using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using System.Data;
using DataAccessLayer;
using ICSBLL.BLL.Common;
using System.Globalization;
namespace ICSBLL.BLL.Appointment
{
    public class Base_BLL_AppointmentSchedule
    {
        public DataSet AppointmentSchedule_Get()
        {
            try
            {
                return SqlHelper.ExecuteDataset(Base_BLL_CommonSettings.ConnectionString, "USP_Appoimtment_Schedule");
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        
    }
}

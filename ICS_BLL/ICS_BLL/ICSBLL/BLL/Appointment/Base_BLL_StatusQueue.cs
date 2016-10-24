using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using DataAccessLayer;
using ICSBLL.BLL.Common;

namespace ICSBLL.BLL.Appointment
{
    public class Base_BLL_StatusQueue
    {
        public string PrevID;
        public string CurrentID;
        public string NextID;

        public string PrevIMG;
        public string CurrentIMG;
        public string NextIMG;

        public string CurrentStatus;

        public string PrevName
        {
            get;
            set;
        }
        public string CurrName
        {
            get;
            set;
        }
        public string NextName
        {
            get;
            set;
        }

        
        public string StatusQueueList
        {
            get;
            set;
        }

        public string SelectedElement
        {
            get;
            set;
        }

        

        public DataSet AppointmentStatus_GET()
        {
            
            try
            {
                return SqlHelper.ExecuteDataset(Base_BLL_CommonSettings.ConnectionString, "USP_Appointment_StatusQueue");
            }
            catch (Exception ex)
            {
                throw ex;
            }
            
        }
        
    }
}

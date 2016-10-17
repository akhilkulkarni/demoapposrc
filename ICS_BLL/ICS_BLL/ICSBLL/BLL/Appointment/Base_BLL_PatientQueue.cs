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
    public class Base_BLL_PatientQueue
    {



        public Int32 Appointments_PatientIN(int tockenID,int status)
        {

            try
            {
                return SqlHelper.ExecuteNonQuery(Base_BLL_CommonSettings.ConnectionString, "USP_Appointments_PatientIN", tockenID,status);
            }
            catch (Exception ex)
            {
                throw ex;
            }


        }

        public Int32 Appointments_PatientSKIP(int tockenID)
        {

            try
            {
                return SqlHelper.ExecuteNonQuery(Base_BLL_CommonSettings.ConnectionString, "USP_Appointments_PatientSKIP", tockenID);
            }
            catch (Exception ex)
            {
                throw ex;
            }


        }


        public Int32 Appointments_PatientCANCEL(int tockenID)
        {

            try
            {
                return SqlHelper.ExecuteNonQuery(Base_BLL_CommonSettings.ConnectionString, "USP_Appointments_PatientCANCEL", tockenID);
            }
            catch (Exception ex)
            {
                throw ex;
            }


        }

        public Int32 Appointments_SetPatientReportingTime(int QueueID)
        {

            try
            {
                return SqlHelper.ExecuteNonQuery(Base_BLL_CommonSettings.ConnectionString, "USP_Appointments_SetPatientReportingTime", QueueID);
            }
            catch (Exception ex)
            {
                throw ex;
            }


        }


        public DataSet CancledAppointments()
        {
            
            try
            {
                return SqlHelper.ExecuteDataset(Base_BLL_CommonSettings.ConnectionString, "USP_Appointments_CancledAppointments");
            }
            catch (Exception ex)
            {
                throw ex;
            }
            
        }
        
        public Int32 AppointmentsCancle(int pk_queueId)
        {

            try
            {
                return SqlHelper.ExecuteNonQuery(Base_BLL_CommonSettings.ConnectionString, "USP_Appointments_AppointmentCancle",pk_queueId);
            }
            catch (Exception ex)
            {
                throw ex;
            }


        }
            
        public Int32 AppointmentsCancledReset(int tockenId)
        {

            try
            {
                return SqlHelper.ExecuteNonQuery(Base_BLL_CommonSettings.ConnectionString, "USP_Appointment_CancledReset", tockenId);
            }
            catch (Exception ex)
            {
                throw ex;
            }


        }
        public Int32 AppointmentsReschedule(int tockenId)
        {

            try
            {
                return SqlHelper.ExecuteNonQuery(Base_BLL_CommonSettings.ConnectionString, "USP_Appointment_ResheduleTocken", tockenId);
            }
            catch (Exception ex)
            {
                throw ex;
            }


        }

        public Int32 Appointments_FeesPayment(int appId, int isFree, double fees)
        {

            try
            {
                return SqlHelper.ExecuteNonQuery(Base_BLL_CommonSettings.ConnectionString, "USP_Appointment_FeesPayment", appId,isFree,fees);
            }
            catch (Exception ex)
            {
                throw ex;
            }


        }
        
        public Int32 AppointmentsFees(int pk_appointmentID,double fees,int isFree )
        {

            try
            {
                return SqlHelper.ExecuteNonQuery(Base_BLL_CommonSettings.ConnectionString, "USP_Appointment_Fees", pk_appointmentID, fees, isFree);
            }
            catch (Exception ex)
            {
                throw ex;
            }


        }
        public Int32 AppointmentsDelete(int pk_queueId)
        {

            try
            {
                return SqlHelper.ExecuteNonQuery(Base_BLL_CommonSettings.ConnectionString, "USP_Appointment_Delete", pk_queueId);
            }
            catch (Exception ex)
            {
                throw ex;
            }


        }
        
        public DataSet AppointmentsQueue()
        {
            
            try
            {
                return SqlHelper.ExecuteDataset(Base_BLL_CommonSettings.ConnectionString, "USP_Appointments_AppointmentQueue");
            }
            catch (Exception ex)
            {
                throw ex;
            }
            

        }
        public DataSet AppointmentsQueue_Schedule()
        {

            try
            {
                //return SqlHelper.ExecuteDataset(Base_BLL_CommonSettings.ConnectionString, "USP_Appoimtment_AppointmentSchedule");
                return SqlHelper.ExecuteDataset(Base_BLL_CommonSettings.ConnectionString, "USP_Appoimtment_Schedule");
            }
            catch (Exception ex)
            {
                throw ex;
            }


        }
        public DataSet Appointment_CurrentTockenSTATUS()
        {
            
            try
            {
                return SqlHelper.ExecuteDataset(Base_BLL_CommonSettings.ConnectionString, "USP_Appointment_CurrentTockenSTATUS");
            }
            catch (Exception ex)
            {
                throw ex;
            }
            

        }
        
        public DataSet AppointmentsSearch(int tockenID,int patientID,string Name)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Base_BLL_CommonSettings.ConnectionString, "USP_Appointments_Search",tockenID,patientID,Name);
            }
            catch (Exception ex)
            {
                throw ex;
            }
          
        }
        public DataSet AppointmentTodaysSummary_Get(string strDate,int flag )
        {
            try
            {
                DateTimeFormatInfo dtfi;
                dtfi = new DateTimeFormatInfo();
                dtfi.ShortDatePattern = "dd-MM-yyyy";
                dtfi.DateSeparator = "-";
                DateTime objDate = Convert.ToDateTime(strDate, dtfi);


                objDate.ToString("MM-dd-yyyy");
                return SqlHelper.ExecuteDataset(Base_BLL_CommonSettings.ConnectionString, "USP_Appointment_TodaysSummary", objDate,flag);
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        


    }
}

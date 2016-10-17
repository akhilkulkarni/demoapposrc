using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataAccessLayer;
using ICSBLL.BLL.Common;
using System.Data;
namespace ICSBLL.BLL.Admin
{
    public class Base_BLL_AdminSettings
    {

        public int BlockTime_NewPatient { get; set; }
        public int BlockTime_OldPatient { get; set; }

        public int Sun_Working_Day { get; set; }
        public int Mon_Working_Day { get; set; }
        public int Tues_Working_Day { get; set; }
        public int Wed_Working_Day { get; set; }
        public int Thur_Working_Day { get; set; }
        public int Fri_Working_Day { get; set; }
        public int Sat_Working_Day { get; set; }
        public int Today_Working_Day { get; set; }

        public int IsHoliday { get; set; }


        //===================================================================================
        //                                 Session Settings Block
        //===================================================================================
            public int SessionId { get; set; }
            public string Session1_Start { get; set; }
            public string Session1_End { get; set; }
            public string Session2_Start { get; set; }
            public string Session2_End { get; set; }
            public int PatientLimit { get; set; }
            public string TimeLimit { get; set; }
            public int SessionFlag { get; set; }

        //===================================================================================
        //                              Priority Setting Block
       //====================================================================================
            public int Priority_ID { get; set; }   
            public string Start_Priority_After { get; set; }
            public int Add_Priority_Appoint_After { get; set; }
            public int Priority_To { get; set; }
            public int Reschedule_After{get; set;}
            public int Cancel_After{get; set;}

        //===================================================================================
        //                              SAVE FEES BLOCK
        //====================================================================================
           public double Fees_NewPatient { get; set; }
           public double Fees_OldPatient { get; set; }

        /// <summary>
        /// /////////////////////////////////////////////////////////////////////////////////////
        /// 
        /// 

           public string CategoryName { get; set; }
           public string CategoryDesc { get; set; }
           public string ParentCatId { get; set; }

        /// 
        /// </summary>
        /// <returns></returns>

     
        public int Appointment_Limit_SAVE()
        {
            try
            {
                SqlHelper.ExecuteScalar(Base_BLL_CommonSettings.ConnectionString, "USP_Admin_BlockSetting_InsertUpdate", 0, BlockTime_NewPatient, BlockTime_OldPatient, Fees_NewPatient, Fees_OldPatient);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return 1;
        }

        public DataSet Appointment_Limit_Get()
        {
            DataSet ds = new DataSet();
            try
            {
                ds = SqlHelper.ExecuteDataset(Base_BLL_CommonSettings.ConnectionString, "USP_Admin_BlockSetting_Get",0);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return ds;
        }

        public int Working_Days_SAVE()
        {
            try
            {
                SqlHelper.ExecuteScalar(Base_BLL_CommonSettings.ConnectionString, "USP_Working_Day_Settings_InsertUpdate", Sun_Working_Day, Mon_Working_Day, Tues_Working_Day, Wed_Working_Day, Thur_Working_Day, Fri_Working_Day, Sat_Working_Day,Today_Working_Day);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return 1;
        }
        public int Session_Settings_SAVE()
        {
            try
            {
                 SqlHelper.ExecuteScalar(Base_BLL_CommonSettings.ConnectionString, "USP_Session_Settings_InsertUpdate", SessionId, Session1_Start, Session1_End, Session2_Start, Session2_End,TimeLimit,PatientLimit,SessionFlag);
                
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return 1;
        }
        public int Priority_Setting_SAVE()
        {
            try
            {
                SqlHelper.ExecuteScalar(Base_BLL_CommonSettings.ConnectionString, "USP_Priority_Setting_InsertUpdate", Priority_ID, Start_Priority_After, Add_Priority_Appoint_After, Priority_To, Reschedule_After, Cancel_After);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return 1;
        }
        public int Rescheduling_Setting_SAVE()
        {
            try
            {
                SqlHelper.ExecuteScalar(Base_BLL_CommonSettings.ConnectionString, "USP_Setting_Reschedule_InsertUpdate", Sun_Working_Day, Mon_Working_Day, Tues_Working_Day, Wed_Working_Day, Thur_Working_Day, Fri_Working_Day, Sat_Working_Day, Today_Working_Day, Reschedule_After, Cancel_After);
            }
            catch (Exception ex)
            {
                throw ex;
            }
             return 1;
        }

        public DataSet Session_Setting_Get()
        {
            DataSet ds = new DataSet(); 
            try 
            {
                 ds=SqlHelper.ExecuteDataset(Base_BLL_CommonSettings.ConnectionString, "USP_Admin_Setting_Session_Get");
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return ds;
         }
       
        public DataSet Priority_Setting_GET()
        {
            DataSet ds = new DataSet();
            try
            {
                ds = SqlHelper.ExecuteDataset(Base_BLL_CommonSettings.ConnectionString, "USP_Admin_Setting_PriorityReschedule_Get");
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return ds;
        }

        public DataSet TOdaysSchedule_Get()
        {
            DataSet ds = new DataSet();
            try
            {
                ds = SqlHelper.ExecuteDataset(Base_BLL_CommonSettings.ConnectionString, "USP_Admin_Setting_TodaysSession");
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return ds;
        }

        public static DataView GetInspectionMaster()
        {
            DataSet ds = new DataSet();
            try
            {
                ds = SqlHelper.ExecuteDataset(Base_BLL_CommonSettings.ConnectionString, "USP_GetInspectionMaster");
            }
            catch (Exception ex)
            {
                throw ex;
            }
            DataView dv = new DataView(ds.Tables[0]);
            return dv;
        }

        public static int InseryCategoryInspection(Base_BLL_AdminSettings Obj)
        {
            try
            {
                SqlHelper.ExecuteScalar(Base_BLL_CommonSettings.ConnectionString, "USP_Insery_Category_Inspection",Obj.ParentCatId,Obj.CategoryName,Obj.CategoryDesc);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return 1;
        }

         public static DataView GetInspectionCategory(Base_BLL_AdminSettings obj)
        {
            DataSet ds = new DataSet();
            try
            {
                ds = SqlHelper.ExecuteDataset(Base_BLL_CommonSettings.ConnectionString, "Get_Inspection_Category", obj.ParentCatId);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            DataView dv = new DataView(ds.Tables[0]);
            return dv;
        }

        public static DataView GetInspectionSubCategory()
        {
            DataSet ds = new DataSet();
            try
            {
                ds = SqlHelper.ExecuteDataset(Base_BLL_CommonSettings.ConnectionString, "USP_Get_InspectionSubCategory");
            }
            catch (Exception ex)
            {
                throw ex;
            }
            DataView dv = new DataView(ds.Tables[0]);
            return dv;
        }
      /*  public DataSet Priority_To_GET()
        {
            return SqlHelper.ExecuteDataset(Base_BLL_CommonSettings.ConnectionString, "USP_Priority_To_GET");
        }
        */
    }
  
}

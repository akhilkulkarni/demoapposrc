using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataAccessLayer;
using System.Data;
using ICSBLL.BLL.Common;

namespace ICSBLL.BLL.Admin
{
   public class Base_BLL_User
    {

        public int PK_UserID { get; set; }
        public string UserRegID { get; set; }

        public string FirstName { get; set; }
        public string MiddleName { get; set; }
        public string LastName { get; set; }
        public string FullName { get; set; }

        public string UserRegDate { get; set; }
        public string Password { get; set; }
        public int isActive { get; set; }
        public int isDeleted { get; set; }


        public int Gender { get; set; }


        public Boolean RegisterUser()
        {
           
            try
            {
                // ds = SqlHelper.ExecuteDataset(Base_BLL_CommonSettings.ConnectionString, "USP_AppointmentPatient_SaveAndAppoint_Birla", FullName, IsNew, IsLocalite,AppointmentDate);
                SqlHelper.ExecuteNonQuery(Base_BLL_CommonSettings.ConnectionString, "USP_Admin_User_InsertUpdate",PK_UserID,FirstName,MiddleName,LastName,UserRegID,Password,isActive,isDeleted);
                return true;
                
            }
            catch (Exception ex)
            {
             
                throw ex;

            }

        }

        public DataSet GetRegisteredUser()
        {

            try
            {
                DataSet ds;
                // ds = SqlHelper.ExecuteDataset(Base_BLL_CommonSettings.ConnectionString, "USP_AppointmentPatient_SaveAndAppoint_Birla", FullName, IsNew, IsLocalite,AppointmentDate);
                ds=SqlHelper.ExecuteDataset(Base_BLL_CommonSettings.ConnectionString,CommandType.StoredProcedure ,"USP_GETUSERS");
                return ds;

            }
            catch (Exception ex)
            {
                
                throw ex;

            }

        }

    }
}

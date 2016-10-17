using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using DataAccessLayer;
using ICSBLL.BLL.Common;

namespace ICSBLL.BLL.Admin
{
    public class Base_BLL_PageCommonSettings
    {


        public int PK_UserId { get; set; }
        public string NewPassword { get; set; }
        public string Theme { get; set; }


        public DataSet ThemeList_GET()
        {
            DataSet ds = new DataSet();
            try
            {
                ds = SqlHelper.ExecuteDataset(Base_BLL_CommonSettings.ConnectionString, "USP_Admin_ThemeList_Get");
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return ds;
            
        }

        public bool UpdateCommonSettings()
        {

            DataSet ds = new DataSet();
            try
            {
                 SqlHelper.ExecuteNonQuery(Base_BLL_CommonSettings.ConnectionString, "USP_Admin_CommonSettings_Update",PK_UserId,NewPassword,Theme);
                 return true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
           
        }


        public bool VerifyPassword(int UserID,string Password)
        {
            DataSet ds = new DataSet();
            try
            {
                ds = SqlHelper.ExecuteDataset(Base_BLL_CommonSettings.ConnectionString, "USP_Admin_GetPassword_ForChange", UserID);

                //Decrypt Both
                
                string PassOrg = "Org";
                string PassTyped = "Typ";

                if (ds.Tables[0].Rows.Count > 0)
                {
                    PassOrg = Base_BLL_Cryptography.Decrypt(ds.Tables[0].Rows[0][0].ToString(), true);
                    PassTyped = Base_BLL_Cryptography.Decrypt(Password, true);
                }
                if (PassOrg == PassTyped)
                    return true;

                return false;

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}

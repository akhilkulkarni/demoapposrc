using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using DataAccessLayer;
using ICSBLL.BLL.Common;
namespace ICSBLL.BLL.Admin
{
    public class Base_BLL_Login
    {
        public DataTable CurrentUser { get; set; }

        public bool VerifyLogin(string UserID, string Password)
        {
            DataSet ds = new DataSet();
            try
            {
                ds = SqlHelper.ExecuteDataset(Base_BLL_CommonSettings.ConnectionString, "USP_Login_GetPassword",UserID);


                if (ds != null && ds.Tables[0].Rows.Count > 0)
                {
                    string PassOrg = "Org";
                    string PassTyped = "Typ";

                    string s = ds.Tables[0].Rows[0]["Password"].ToString();
                        PassOrg = Base_BLL_Cryptography.Decrypt(s, true);
                        PassTyped = Base_BLL_Cryptography.Decrypt(Password, true);

                        if (PassOrg == PassTyped)
                        {
                            this.CurrentUser = ds.Tables[0];
                            return true;
                        }
                }
                
                return false;

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataAccessLayer;
using System.Data;
using ICSBLL.BLL.Common;
using System.Globalization;

namespace ICSBLL.BLL.Report
{
    public class Base_BLL_Report_Collection
    {
        
        public DataSet CollectionReport_OverAll()
        {
            DataSet ds = new DataSet();
            try
            {
                ds = SqlHelper.ExecuteDataset(Base_BLL_CommonSettings.ConnectionString, "USP_REPORT_GetCollectionBYPatientType");
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return ds;
        }
        public DataSet CollectionReport_Mothly_BetweenDate(string fromdate, string todate)
        {
            DataSet ds = new DataSet();
            try
            {
                ds = SqlHelper.ExecuteDataset(Base_BLL_CommonSettings.ConnectionString, "USP_REPORT_GetCollectionMonthly", fromdate, todate);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return ds;
        }
        public DataSet CollectionReport_Daily_PieChart(string R_date,int Flag)
        {
            DataSet ds = new DataSet();
            try
            {
                ds = SqlHelper.ExecuteDataset(Base_BLL_CommonSettings.ConnectionString, "USP_REPORT_GetCollection_DailyPie", R_date, Flag);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return ds;
        }
        public DataSet GetMonthlyCollectionReport(string fromdate, string todate,int flag)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Base_BLL_CommonSettings.ConnectionString, "USP_Report_Monthly", Convert.ToDateTime(fromdate), Convert.ToDateTime(todate), flag);
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        public DataSet GetYearlyCollectionReport(string year)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Base_BLL_CommonSettings.ConnectionString, "USP_Report_Yearly", Convert.ToDateTime(year));
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

    }
}

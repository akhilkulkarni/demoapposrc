using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using DataAccessLayer;
using System.Configuration;
using System.Web;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using ICSBLL.BLL.Common;




namespace ICSBLL
{
    public class Base_BLL_MenuMaster
    {
        public DataSet GetMenu(Int32 ModuleID)
        {
            String s = Base_BLL_CommonSettings.ConnectionString;//"Data Source=INFOCASIER-PC;Initial Catalog=ICS_Appo;Integrated Security=True";
            DataSet ds = SqlHelper.ExecuteDataset(s, "USP_GETMENU", ModuleID);
            return ds;
        
        }
        public void SetMenu(Int32 ModuleID,XmlDataSource xds)
        {
             DataSet ds=GetMenu(ModuleID);
            ds.DataSetName = "Menus";
            ds.Tables[0].TableName = "Menu";
            DataRelation relation = new DataRelation("ParentChild", ds.Tables["Menu"].Columns["PK_MenuID"], ds.Tables["Menu"].Columns["ParentID"], false);
            relation.Nested = true;
            ds.Relations.Add(relation);
            xds.Data = ds.GetXml();
            xds.DataBind();

        }

    }
}

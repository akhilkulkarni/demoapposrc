using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using ICSBLL.BLL.Appointment;
public partial class UI_Report_Frm_Gross_Report : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Header.DataBind();
        DataSet ds;
        Base_BLL_PatientQueue objtoday = new Base_BLL_PatientQueue();

        ds = objtoday.AppointmentTodaysSummary_Get("2016-9-24", 2);
        if (ds != null)
        {
          
            UC_ListGrid.Data = ds;
            UC_ListGrid.DataBind();
        }
    }
}
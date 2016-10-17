using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using System.Text;
using System.Globalization;
using System.Threading;
using ICSCommon;
using ICSBLL.BLL.Appointment;

public partial class UI_Appointment_Appointment_TodaysSummary : System.Web.UI.Page
{
    Base_BLL_PatientQueue objtoday;
    DataSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Header.DataBind();
        //uc_header.FillMenu(ICSBLL.Base_BLL_Constants.Modules.Appointments);
        hdflag.Value = Convert.ToString(Request.QueryString["flag"]);

        if (Request.QueryString["flag"] == "1")
        {
            txt_appointmentDate.Text = DateTime.Today.Date.ToString("dd-MM-yyyy");
            fillAppointmentSummary();
        }
        else
        { 
        UC_ListGrid_New.LoadDefault();
        }
        
    }
    protected void btn_Go_Click(object sender, EventArgs e)
    {
        fillAppointmentSummary();
    }

    protected void fillAppointmentSummary()
    {
        ds = new DataSet();
        objtoday = new Base_BLL_PatientQueue();

        ds = objtoday.AppointmentTodaysSummary_Get(txt_appointmentDate.Text, Convert.ToInt32( Request.QueryString["flag"].ToString()));
        if (ds != null)
        {
            UC_Total_Display.TotalPatient = ds.Tables[1].Rows[0][0].ToString();
            UC_Total_Display.TotalAmmount = ds.Tables[1].Rows[0][1].ToString();

            UC_ListGrid_New.Data = ds;
           
        }
    }
   
}
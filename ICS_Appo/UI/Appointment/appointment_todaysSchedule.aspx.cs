using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using ICSBLL.BLL.Admin;

public partial class UI_Appointment_appointment_todaysSchedule : System.Web.UI.Page
{
    DataSet ds;
    Base_BLL_AdminSettings obj;
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Header.DataBind();
        ds=new DataSet();
        obj = new Base_BLL_AdminSettings();
        //uc_header.FillMenu(ICSBLL.Base_BLL_Constants.Modules.Appointments);
        ds = obj.TOdaysSchedule_Get();
        lbl_limitation_type.Text = ds.Tables[0].Rows[0]["Patient/Time"].ToString();
        lbl_max_patient.Text = ds.Tables[0].Rows[0]["DailyPatientLimit"].ToString();
        lbl_max_time.Text = ds.Tables[0].Rows[0]["DailyTimeLimit"].ToString();
        lbl_appointment_done.Text = ds.Tables[0].Rows[0]["Aptdone"].ToString();
        lbl_canceled.Text = ds.Tables[0].Rows[0]["AptCancelled"].ToString();
        lbl_session1_starttime.Text = ds.Tables[0].Rows[0]["Session1_Start"].ToString();
        lbl_session1_endtime.Text = ds.Tables[0].Rows[0]["Session1_End"].ToString();
        lbl_session2_starttime.Text = ds.Tables[0].Rows[0]["Session2_Start"].ToString();
        lbl_session2_endtime.Text = ds.Tables[0].Rows[0]["Session2_End"].ToString();
        lbl_isholiday.Text = ds.Tables[0].Rows[0]["holiday"].ToString();
    }
} 
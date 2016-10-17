using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ICSBLL;
using ICSBLL.BLL.Admin;
using System.Data;
public partial class UI_Admin_Appoinment_Settings : System.Web.UI.Page
{
    Base_BLL_AdminSettings objAdmin;

    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Header.DataBind();
        //uc_header.FillMenu(ICSBLL.Base_BLL_Constants.Modules.Admin);
        if (!Page.IsPostBack)
        {
            FillSetting_SessionData();
            FillSettings_PriorityData();
            FillSettings_BlockTime();
           

        }
    }

    protected void FillSetting_SessionData()
    {
        objAdmin = new Base_BLL_AdminSettings();    
        DataSet ds = objAdmin.Session_Setting_Get();

        grd_SessionSetting.DataSource = ds;
        grd_SessionSetting.DataBind();
    }

    protected void SettingSession_save(int id,string Session1_Start, string Session1_End, string Session2_Start, string Session2_End,string timeLimit,int patientLimit,int flag)
    {
        try
        {
            objAdmin = new Base_BLL_AdminSettings();
            objAdmin.SessionId = id;
            objAdmin.Session1_Start = Session1_Start;
            objAdmin.Session1_End = Session1_End;
            objAdmin.Session2_Start = Session2_Start;
            objAdmin.Session2_End = Session2_End;

            objAdmin.TimeLimit = timeLimit;
            objAdmin.PatientLimit = patientLimit;
            objAdmin.SessionFlag = flag;

            objAdmin.Session_Settings_SAVE();
            uc_footer1.ShowMessage(MessageType.Success, "Session Settings Saved Successfully!", true, MessagePosition.Top, false);
            
        }
        catch (Exception ex)
        {
            uc_footer1.ShowMessage(MessageType.Error, "Error: " + ex.Message + " Please Contact System Administrator!", false, MessagePosition.Top, false);
         }
    }
    
    protected void btnAppoint_Limit_Setting_Save_Click(object sender, EventArgs e)
    {
        objAdmin= new Base_BLL_AdminSettings();
        objAdmin.BlockTime_NewPatient =Convert.ToInt32(txtBlock_Time_New_Patient.Text);
        objAdmin.BlockTime_OldPatient= Convert.ToInt32(txtBlock_Time_Old_Patient.Text);

        objAdmin.Fees_NewPatient = Convert.ToDouble(txt_New_Patient_Fees.Text);
        objAdmin.Fees_OldPatient = Convert.ToDouble(txt_Old_Patient_Fees.Text);

        objAdmin.Appointment_Limit_SAVE();
    }

    protected void btnWorking_Days_Setting_Save_Click(object sender, EventArgs e)
    {
        objAdmin = new Base_BLL_AdminSettings();

        if (cbSun.Checked)
          objAdmin.Sun_Working_Day = 1;
        else
          objAdmin.Sun_Working_Day=0;

        if (cbMon.Checked)
            objAdmin.Mon_Working_Day = 1;
        else
            objAdmin.Mon_Working_Day = 0;

        if (cbTues.Checked)
            objAdmin.Tues_Working_Day = 1;
        else
            objAdmin.Tues_Working_Day = 0;

        if (cbWed.Checked)
            objAdmin.Wed_Working_Day = 1;
        else
            objAdmin.Wed_Working_Day = 0;

        if (cbThur.Checked)
            objAdmin.Thur_Working_Day = 1;
        else
            objAdmin.Thur_Working_Day = 0;

        if (cbFri.Checked)
            objAdmin.Fri_Working_Day = 1;
        else
            objAdmin.Fri_Working_Day = 0;

        if (cbSat.Checked)
            objAdmin.Sat_Working_Day = 1;
        else
            objAdmin.Sat_Working_Day = 0;
        
        if (cbToday.Checked)
            objAdmin.Today_Working_Day = 1;
        else
            objAdmin.Today_Working_Day = 0;


        objAdmin.Working_Days_SAVE();

        FillSetting_SessionData();
        FillSettings_PriorityData();
        
    }

   
    protected void grd_SessionSetting_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            DropDownList drpFlag = (DropDownList)e.Row.FindControl("drp_flag");
            int s = (int)DataBinder.Eval(e.Row.DataItem, "FLAG");
            drpFlag.SelectedValue = s.ToString();
            drpFlag.Attributes.Add("readonly","readonly");
        }
    }
    protected void grd_SessionSetting_RowCommand(object sender, GridViewCommandEventArgs e)
    {

    }
    protected void grd_SessionSetting_RowEditing(object sender, GridViewEditEventArgs e)
    {
        objAdmin = new Base_BLL_AdminSettings();
        grd_SessionSetting.EditIndex = e.NewEditIndex;
        FillSetting_SessionData();
    }
    protected void grd_SessionSetting_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

        int ID = int.Parse(grd_SessionSetting.DataKeys[e.RowIndex]["ID"].ToString());
        GridViewRow gvr = grd_SessionSetting.Rows[e.RowIndex];

        String txt_Session1_Start = ((TextBox)gvr.FindControl("txt_Session1_Start")).Text;
        String txt_Session1_End = ((TextBox)gvr.FindControl("txt_Session1_end")).Text;
        String txt_Session2_Start = ((TextBox)gvr.FindControl("txt_Session2_Start")).Text;
        String txt_Session2_End = ((TextBox)gvr.FindControl("txt_Session2_end")).Text;
        String txt_Patient_Limit = ((TextBox)gvr.FindControl("txt_Patient_Limit")).Text;
        String txt_Time_Limit = ((TextBox)gvr.FindControl("txt_Time_Limit")).Text;
        String Sessionflag = ((DropDownList)gvr.FindControl("drp_flag")).SelectedValue;

        SettingSession_save(ID,txt_Session1_Start, txt_Session1_End, txt_Session2_Start, txt_Session2_End,txt_Time_Limit,Convert.ToInt32(txt_Patient_Limit),Convert.ToInt32(Sessionflag));

        grd_SessionSetting.EditIndex = -1;

        FillSetting_SessionData();

    }

  
    protected void grd_SessionSetting_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        grd_SessionSetting.EditIndex = -1;
        FillSetting_SessionData();
    }

    //-----------------------------------Setting Priority and Rescheduling--------------------------

    protected void FillSettings_PriorityData()
    {
        objAdmin = new Base_BLL_AdminSettings();
        DataSet ds_priority = objAdmin.Priority_Setting_GET();
        grd_Priority_Setting.DataSource = ds_priority;
        grd_Priority_Setting.DataBind();
    }
    protected void grd_Priority_Setting_RowCancel(object sender, GridViewCancelEditEventArgs e)
    {
        grd_Priority_Setting.EditIndex = -1;
        FillSettings_PriorityData();
    }
    protected void grd_Priority_Setting_Update(object sender, GridViewUpdateEventArgs e)
    {
        int DayID = int.Parse(grd_Priority_Setting.DataKeys[e.RowIndex]["PriorityID"].ToString());
        GridViewRow row = grd_Priority_Setting.Rows[e.RowIndex];

        string Priority_From = ((TextBox)row.FindControl("txtStart_After")).Text;
        string Appointment_After = ((TextBox)row.FindControl("txtAppoint_After")).Text;
        string Priority_To = ((DropDownList)row.FindControl("cmbPriority_To")).SelectedValue;
        string Rescheduling_After = ((TextBox)row.FindControl("txtReschedule_After")).Text;
        string Cancel_After = ((TextBox)row.FindControl("txtCancel_After")).Text;
        
        objAdmin = new Base_BLL_AdminSettings();
        objAdmin.Priority_ID = DayID;
        objAdmin.Start_Priority_After = Priority_From;
        objAdmin.Add_Priority_Appoint_After =Convert.ToInt32( Appointment_After);
        objAdmin.Priority_To = Convert.ToInt32(Priority_To);
        objAdmin.Reschedule_After = Convert.ToInt32(Rescheduling_After);
        objAdmin.Cancel_After = Convert.ToInt32(Cancel_After);

        objAdmin.Priority_Setting_SAVE();
        
        grd_Priority_Setting.EditIndex = -1;
        FillSettings_PriorityData();

    }
    protected void grd_Priority_Setting_Edit(object sender, GridViewEditEventArgs e)
    {
        objAdmin = new Base_BLL_AdminSettings();
        grd_Priority_Setting.EditIndex = e.NewEditIndex;
        FillSettings_PriorityData();
    }
    protected void grd_Priority_Setting_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void grd_Priority_Setting_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            

            DropDownList drpPriority = (DropDownList)e.Row.FindControl("cmbPriority_To");
           int s= (int)DataBinder.Eval(e.Row.DataItem, "Priority_To");
           drpPriority.SelectedValue = s.ToString();
           drpPriority.Attributes.Add("readonly", "readonly");
        }
    }

    protected void FillSettings_BlockTime()
    {
        objAdmin = new Base_BLL_AdminSettings();
        DataSet ds = objAdmin.Appointment_Limit_Get();
        txtBlock_Time_New_Patient.Text = ds.Tables[0].Rows[0]["BlockTime_New"].ToString();
        txtBlock_Time_Old_Patient.Text = ds.Tables[0].Rows[0][1].ToString();
        //objAdmin = new Base_BLL_AdminSettings();
        //DataSet ds_priority = objAdmin.Priority_Setting_GET();
        //grd_Priority_Setting.DataSource = ds_priority;
        //grd_Priority_Setting.DataBind();
    }
    protected void grd_SessionSetting_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

    }
    protected void grd_SessionSetting_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
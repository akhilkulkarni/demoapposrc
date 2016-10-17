using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ICSBLL.BLL.Appointment;
using ICSBLL.BLL.Admin;
using System.Data;
public partial class UI_Appointment_appointment_patientQueue : System.Web.UI.Page
{
    Base_BLL_PatientQueue objPatQ = new Base_BLL_PatientQueue();
    Base_BLL_AdminSettings obj;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Header.DataBind();
        //uc_header.FillMenu(ICSBLL.Base_BLL_Constants.Modules.Appointments);
        LoadData();
        ScriptManager.RegisterStartupScript(this, this.GetType(), "Close", "fn_FilColorScheme();", true);
  }
    protected void LoadData()
    { 
        FillAppointmentQueue();
        FillSearchQueue();
        FillCancledQueue();
      
        FillTockenStatus();
        FillSettings();
    }
    protected void FillSettings()
    {

        DataSet ds;

        obj = new Base_BLL_AdminSettings();
        //uc_header.FillMenu(ICSBLL.Base_BLL_Constants.Modules.Appointments);
        ds = obj.TOdaysSchedule_Get();
        lbl_TodayDate.Text = System.DateTime.Today.ToLongDateString();

        lbl_session1.Text = ds.Tables[0].Rows[0]["Session1_Start"].ToString() + " - " + ds.Tables[0].Rows[0]["Session1_End"].ToString();
        lbl_session2.Text = ds.Tables[0].Rows[0]["Session2_Start"].ToString() + " - " + ds.Tables[0].Rows[0]["Session2_End"].ToString();

        lbl_PriorityFrom.Text = ds.Tables[0].Rows[0]["Start_After"].ToString();
        lbl_RescAfter.Text = ds.Tables[0].Rows[0]["Reschedule_After"].ToString()+" Appo.";
        lbl_CancelAfter.Text = ds.Tables[0].Rows[0]["Cancel_After"].ToString() + " Resc.";

        lbl_limit.Text = "";
    //   lbl_approx.Text = "";
        
            if(ds.Tables[0].Rows[0]["FLAG"].ToString()=="1")
            {
                lbl_limit.Text = "Upto " + ds.Tables[0].Rows[0]["DailyPatientLimit"].ToString() + " Patients.";
            }
            else if(ds.Tables[0].Rows[0]["FLAG"].ToString()=="2")
            {
                lbl_limit.Text = "Upto " + ds.Tables[0].Rows[0]["DailyTimeLimit"].ToString();
                
            }
            else
            {
                lbl_limit.Text ="--,,--";
            }
        
    }
    protected void FillAppointmentQueue()
    {
        grd_patientQueue.DataSource = objPatQ.AppointmentsQueue();
        grd_patientQueue.DataBind();
    }
    protected void FillCancledQueue()
    {
        grd_CancledAppointment.DataSource = objPatQ.CancledAppointments();
        grd_CancledAppointment.DataBind();
    }
    protected void FillSearchQueue()
    {
        int tockenId=0;
        int patientID=0;

        if(txt_search_tockenNo.Text.Trim()!="")
            tockenId=Convert.ToInt32(txt_search_tockenNo.Text.Trim());

        if (txt_search_PatientID.Text.Trim() != "")
            patientID = Convert.ToInt32(txt_search_PatientID.Text.Trim());
        
         DataSet ds=   objPatQ.AppointmentsSearch(tockenId, patientID, txt_search_Name.Text.Trim());
         lbl_result.Text = "Result : " + ds.Tables[0].Rows.Count+" record(s) found!!";

        grd_searchResult.DataSource = ds;
        grd_searchResult.DataBind();

            
    }
    protected void FillTockenStatus()
    {
        DataSet ds = objPatQ.Appointment_CurrentTockenSTATUS();
        if (ds != null && ds.Tables[0].Rows.Count > 0)
        {
            lbl_prevNo.Text = ds.Tables[0].Rows[0]["PrevID"].ToString();
            lbl_prevText.Text = ds.Tables[0].Rows[0]["PrevName"].ToString();

            lbl_currentNo.Text = ds.Tables[0].Rows[0]["CurrID"].ToString();
            lbl_currentText.Text = ds.Tables[0].Rows[0]["CurrName"].ToString();

            lbl_nextNo.Text = ds.Tables[0].Rows[0]["NextID"].ToString();
            lbl_nextText.Text = ds.Tables[0].Rows[0]["NextName"].ToString();
            lbl_status.Text = ds.Tables[0].Rows[0]["CurrStatus"].ToString();
        }


    }
    protected void img_search_Click(object sender, ImageClickEventArgs e)
    {
        FillSearchQueue();
    }
    protected void btn_IN_Click(object sender, EventArgs e)
    {
        int status = 0;
        int Token = 0;

        if (lbl_status.Text == "IN")
        {

            if (lbl_nextNo.Text == "0")
            {
                Token = Convert.ToInt32(lbl_currentNo.Text);
                status = -9999;
            }
            else
            {
                status = 1;
                Token = Convert.ToInt32(lbl_nextNo.Text);
            }
            

        }
        else
        {
            status = 0;

            if (lbl_currentNo.Text=="0" && lbl_nextNo.Text!="0")
              Token = Convert.ToInt32(lbl_nextNo.Text);
            else if(lbl_currentNo.Text!="0" && lbl_nextNo.Text!="0")
              Token = Convert.ToInt32(lbl_currentNo.Text);
            else
              Token = Convert.ToInt32(lbl_currentNo.Text);

        }

        objPatQ.Appointments_PatientIN(Token,status);
        //FillTockenStatus();
        LoadData();

    }
    protected void btn_SKIP_Click(object sender, EventArgs e)
    {
        objPatQ.Appointments_PatientSKIP(Convert.ToInt32(lbl_currentNo.Text));
        FillTockenStatus();
        LoadData();

    }
    protected void btn_Cancel_Click(object sender, EventArgs e)
    {
        objPatQ.Appointments_PatientCANCEL(Convert.ToInt32(lbl_currentNo.Text));
        FillTockenStatus();
        LoadData();
    }
}
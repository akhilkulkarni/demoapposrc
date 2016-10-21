using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ICSBLL.BLL.Appointment;
using ICSBLL.BLL.Admin;
using System.Data;
using ICSBLL.BLL.PatientManagement;
using System.Globalization;
using System.Web.Services;
public partial class UI_Appointment_appointment_patientQueue : System.Web.UI.Page
{
    Base_BLL_PatientQueue objPatQ = new Base_BLL_PatientQueue();
    Base_BLL_AdminSettings obj;

    Base_BLL_Patient objPatient;
    //Base_BLL_PatientQueue objPatQ = new Base_BLL_PatientQueue();
    //Base_BLL_AdminSettings obj;

    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Header.DataBind();
        //uc_header.FillMenu(ICSBLL.Base_BLL_Constants.Modules.Appointments);
        if (!Page.IsPostBack)
        {
            LoadData();
        }
           //ScriptManager.RegisterStartupScript(this, this.GetType(), "Close", "fn_FilColorScheme();", true);
  }
    protected void LoadData()
    { 
        FillAppointmentQueue();
        FillAppointmentFutureQueue();
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

            IMG_Curr.ImageUrl = ds.Tables[0].Rows[0]["CurrIMG"].ToString();
            IMG_Next.ImageUrl = ds.Tables[0].Rows[0]["NextIMG"].ToString();
            IMG_Prev.ImageUrl = ds.Tables[0].Rows[0]["PrevIMG"].ToString();

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

    //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
  
    public void EditMode_FILLDATA(int id)
    {

        //rdo_new.Enabled = true;
        //rdo_old.Enabled = true;

        //rdo_local.Enabled = true;
        //rdo_outside.Enabled = true;

        objPatient = new Base_BLL_Patient();
        objPatient.GetPatient(id);

        txtPatient_ID.Text = Convert.ToString(id);

        txtPatient_Name.Text = objPatient.FullName;

        if (objPatient.IsNew == 1)
        {
            rdo_new.Checked = true;
            rdo_old.Checked = false;

        }
        else
        {
            rdo_new.Checked = false;
            rdo_old.Checked = true;
        }

        if (objPatient.IsLocalite == 1)
        {
            rdo_local.Checked = true;
            rdo_outside.Checked = false;
        }
        else
        {
            rdo_local.Checked = false;
            rdo_outside.Checked = true;
        }
        rdo_new.Enabled = false;
        rdo_old.Enabled = false;

        rdo_local.Enabled = false;
        rdo_outside.Enabled = false;

        txt_appointmentDate.Text = objPatient.AppointmentDate;
        //Testing

    }

    protected void FillAppointmentFutureQueue()
    {
        grd_AppoSchedule.DataSource = objPatQ.AppointmentsQueue_Schedule();
        grd_AppoSchedule.DataBind();
    }

    protected void btn_AppointmentSaveAppoint_Click(object sender, EventArgs e)
    {
        try
        {

            //========================================================================================
            //    ADD MODE
            //========================================================================================
            DataSet ds_AppoInfo = new DataSet();
            DateTimeFormatInfo dtfi;

            objPatient = new Base_BLL_Patient();

            objPatient.PK_PatientID = txtPatient_ID.Text != "" ? Convert.ToInt32(txtPatient_ID.Text) : 0;
            objPatient.FullName = txtPatient_Name.Text;

            if (rdo_new.Checked)
                objPatient.IsNew = 1;
            else
                objPatient.IsNew = 0;

            if (rdo_local.Checked)
                objPatient.IsLocalite = 1;
            else
                objPatient.IsLocalite = 0;


            dtfi = new DateTimeFormatInfo();
            dtfi.ShortDatePattern = "dd-MM-yyyy";
            dtfi.DateSeparator = "-";
            DateTime objDate = Convert.ToDateTime(txt_appointmentDate.Text, dtfi);


            objPatient.AppointmentDate = objDate.ToString("MM-dd-yyyy");



            if (chk_demandTime.Checked)
            {
                objPatient.IsDemandTimeAppointment = 1;
                objPatient.AppointmentTime = txt_appointmentTime.Text;
                String s = objPatient.Appointment_Validate();
                ds_AppoInfo = objPatient.InsertAndAppoint_DimandTimeAppo();
            }
            else if (!chk_demandTime.Checked)
            {
                objPatient.IsDemandTimeAppointment = 0;
                objPatient.AppointmentTime = "";
                ds_AppoInfo = objPatient.InsertAndAppoint();
            }


            if (ds_AppoInfo != null && ds_AppoInfo.Tables[0].Rows.Count > 0)
            {
                lbl_INFO_PatientId.Text = ds_AppoInfo.Tables[0].Rows[0]["Patient_ID"].ToString();
                lbl_INFO_Patientname.Text = ds_AppoInfo.Tables[0].Rows[0]["FullName"].ToString();
                lbl_INFO_TockenNo.Text = ds_AppoInfo.Tables[0].Rows[0]["Tocken_No"].ToString();
                lbl_INFO_appoDate.Text = txt_appointmentDate.Text;
                lbl_INFO_appTime.Text = ds_AppoInfo.Tables[0].Rows[0]["ApproxTime"].ToString();
                lbl_INFO_fees.Text = ds_AppoInfo.Tables[0].Rows[0]["Fees"].ToString();

                // .Text = ds_AppoInfo.Tables[0].Rows[0]["Fees"].ToString();

                uc_footer1.ShowMessage(MessageType.Success,"Appointment Saved Succesffully",true,MessagePosition.Top,false);
            }

            ClearControl();

            LoadData();
            //}
            //else
            //{
            //    //========================================================================================
            //    //    EDIT MODE
            //    //========================================================================================

            //    objPatient = new Base_BLL_Patient();
            //    objPatient.PK_PatientID = Convert.ToInt32(txtPatient_ID.Text);

            //    objPatient.FullName = txtPatient_Name.Text;

            //    if (rdo_new.Checked)
            //        objPatient.IsNew = 1;
            //    else
            //        objPatient.IsNew = 0;

            //    if (rdo_local.Checked)
            //        objPatient.IsLocalite = 1;
            //    else
            //        objPatient.IsLocalite = 0;
            //    FillAppointmentQueue();
            //    objPatient.Update();
            //    ScriptManager.RegisterStartupScript(this, this.GetType(), "CloseAA", "Fn_CLosePopUp();", true);

            //}
        }
        catch (Exception ex)
        {
            uc_footer1.ShowMessage(MessageType.Error, "Error: " + ex.Message + " Please Contact System Administrator!", true, MessagePosition.Top, true);
           
        }
    }
    public void ClearControl()
    {
        txtPatient_ID.Text = "";
        txtPatient_Name.Text = "";
        txt_appointmentDate.Text = "";
        rdo_local.Checked = false;
        rdo_new.Checked = false;
        rdo_old.Checked = false;
        rdo_outside.Checked = false;
        chk_demandTime.Checked = false;
        txt_appointmentTime.Text = "";
    }
    protected void btnAppontment_Clear_Click(object sender, EventArgs e)
    {

    }
    protected void txt_appointmentDate_TextChanged(object sender, EventArgs e)
    {

    }

    [WebMethod]

    public static List<Base_BLL_DTO_PatientAutoComplete> GetPatientList(string SearchText)
    {
        List<Base_BLL_DTO_PatientAutoComplete> result = new List<Base_BLL_DTO_PatientAutoComplete>();

        DataSet Ds = (new Base_BLL_Patient()).GetPatientList(SearchText);

        foreach (DataRow dr in Ds.Tables[0].Rows)
        {
            Base_BLL_DTO_PatientAutoComplete objTemp = new Base_BLL_DTO_PatientAutoComplete();


            objTemp.PK_PatientID = dr["PK_PatientID"].ToString();
            objTemp.FullName = dr["FullName"].ToString();
            objTemp.ImageUrl = ResolveUrl(dr["ImageUrl"].ToString());
            objTemp.Location = dr["Location"].ToString();
            objTemp.MobileNo = dr["MobileNo"].ToString();

            result.Add(objTemp);

        }

        return result;
    }
    public static string ResolveUrl(string originalUrl)
    {
        if (originalUrl == null)
            return null;

        // *** Absolute path - just return
        if (originalUrl.IndexOf("://") != -1)
            return originalUrl;

        // *** Fix up image path for ~ root app dir directory
        if (originalUrl.StartsWith("~"))
        {
            string newUrl = "";
            if (HttpContext.Current != null)
                newUrl = HttpContext.Current.Request.ApplicationPath +
                      originalUrl.Substring(1).Replace("//", "/");
            else
                // *** Not context: assume current directory is the base directory
                throw new ArgumentException("Invalid URL: Relative URL not allowed.");

            // *** Just to be sure fix up any double slashes
            return newUrl;
        }

        return originalUrl;
    }
    protected void btn_LoadData_Click(object sender, EventArgs e)
    {
        int id = txtPatient_ID.Text.Trim() != "" ? Convert.ToInt32(txtPatient_ID.Text) : 0;
        if (id == 0)
            ClearControl();
        else
            EditMode_FILLDATA(id);
    }
     
    protected void imgBtn_Refresh_Click(object sender, ImageClickEventArgs e)
    {
        LoadData();
    }
}
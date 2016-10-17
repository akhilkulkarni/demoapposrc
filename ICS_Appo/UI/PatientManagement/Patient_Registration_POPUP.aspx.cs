using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using System.Data;
using ICSBLL.BLL.PatientManagement;
using ICSBLL.BLL.Appointment;
using ICSBLL.BLL.Admin;
using ICSBLL.BLL.Common;
using System.Web.Services;
public partial class UI_PatientManagement_Patient_Registration_POPUP : System.Web.UI.Page
{
    Base_BLL_Patient objPatient;
    Base_BLL_PatientQueue objPatQ = new Base_BLL_PatientQueue();
    Base_BLL_AdminSettings obj;
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Header.DataBind();
        btnAppontment_Clear.Attributes.Add("onclick", "return fn_clear();");

        if (!IsPostBack)
        {
            FillAppointmentQueue();

            if (Request.QueryString["id"] != null && Request.QueryString["id"] != "")
                EditMode_FILLDATA(Convert.ToInt32(Request.QueryString["id"].ToString()));

            if (Request.QueryString["id"] == "")
            {
                btn_AppointmentSaveAppoint.Visible = false;
                uc_error.ErrorMessage = "Cant edit priority block !";
                uc_error.IsError = true;
            }


        }
    }
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

    protected void FillAppointmentQueue()
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

                    uc_error.ErrorMessage = "Appointment Saved Succesffully";
                    uc_error.IsError = false;
                }

                ClearControl();

                ScriptManager.RegisterStartupScript(this, this.GetType(), "Close", "ClearValues();", true);
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
            uc_error.ErrorMessage = "Error: " + ex.Message + " Please Contact System Administrator!";
            uc_error.IsError = true;
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

        DataSet Ds=(new Base_BLL_Patient()).GetPatientList(SearchText);
        
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
        int id=txtPatient_ID.Text.Trim()!=""?Convert.ToInt32(txtPatient_ID.Text):0;
        if (id == 0)
            ClearControl();
        else
            EditMode_FILLDATA(id);
    }
}
using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ICSBLL.BLL.PatientManagement;

using System.Globalization;
public partial class UI_PatientManagement_Patient_Appointment_Birla_Hosp : System.Web.UI.Page
{
    Base_BLL_Patient objPatient;
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Header.DataBind();
        //uc_header.FillMenu(ICSBLL.Base_BLL_Constants.Modules.Appointments);
        btnAppontment_Clear.Attributes.Add("onclick", "return fn_clear();");
    }
    protected void btn_AppointmentSaveAppoint_Click(object sender, EventArgs e)
    {
        try
        {
            DataSet ds_AppoInfo;
            objPatient = new Base_BLL_Patient();
            objPatient.FullName = txtPatient_Name.Text;

            if (rdo_new.Checked)
                objPatient.IsNew = 1;
            else
                objPatient.IsNew = 0;

            if (rdo_local.Checked)
                objPatient.IsLocalite = 1;
            else
                objPatient.IsLocalite = 0;
            
            
            
            DateTimeFormatInfo dtfi = new DateTimeFormatInfo();
            dtfi.ShortDatePattern = "dd-MM-yyyy";
            dtfi.DateSeparator = "-";
            DateTime objDate = Convert.ToDateTime(txt_appointmentDate.Text, dtfi);


            objPatient.AppointmentDate =objDate.ToString("MM-dd-yyyy");
            ds_AppoInfo = objPatient.InsertAndAppoint();
            if (ds_AppoInfo != null && ds_AppoInfo.Tables[0].Rows.Count > 0)
            {
                lbl_INFO_PatientId.Text = ds_AppoInfo.Tables[0].Rows[0]["Patient_ID"].ToString();
                lbl_INFO_Patientname.Text = ds_AppoInfo.Tables[0].Rows[0]["FullName"].ToString();
                lbl_INFO_TockenNo.Text = ds_AppoInfo.Tables[0].Rows[0]["Tocken_No"].ToString();
                lbl_INFO_appoDate.Text = txt_appointmentDate.Text;
                lbl_INFO_appTime.Text = ds_AppoInfo.Tables[0].Rows[0]["ApproxTime"].ToString();
                lbl_INFO_fees.Text = ds_AppoInfo.Tables[0].Rows[0]["Fees"].ToString();

                uc_error.ErrorMessage = "Appointment Saved Succesffully";
                uc_error.IsError = false;
            }
            ClearControl();
            
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Close", "ClearValues();", true);
        }
        catch (Exception ex)
        {
            uc_error.ErrorMessage = "Error: " + ex.Message + " Please Contact System Administrator!";
            uc_error.IsError = true;
        }
    }
    public void ClearControl()
    { 
    
            txtPatient_Name.Text = "";
            txt_appointmentDate.Text = "";
            rdo_local.Checked=false;
            rdo_new.Checked=false;
            rdo_old.Checked=false;
            rdo_outside.Checked=false;
    }
    protected void btnAppontment_Clear_Click(object sender, EventArgs e)
    {

    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ICSBLL.BLL.Common;
using ICSBLL.BLL.PatientManagement;
 
public partial class UI_PatientManagement_Frm_PatientAddEdit : System.Web.UI.Page
{
    Base_BLL_Patient obj_Patient=new Base_BLL_Patient();
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Header.DataBind();
        if (!Page.IsPostBack)
        { 
        
            if (Request.QueryString["FK_PatientID"] != null)
            {
                if (Session["MSG_TEXT"] != null && Session["MSG_TYPE"] != null)
                {
                    uc_footer1.ShowMessage((MessageType)Session["MSG_TYPE"], Session["MSG_TEXT"].ToString(), true, MessagePosition.Top, false);
                    Session["MSG_TEXT"] = null;
                    Session["MSG_TYPE"] = null;
                }
               
                FillData_EditMode();
            }
            else
            {
                SetButtonMode(0);
                FillData_Dropdown();
            }

        }
    }
    protected void SetButtonMode(int Mode)
    {
        if (Mode == 0)// ADD MODE
        {
            btn_Delete.Enabled = false;
            btn_Delete.CssClass = "Button_Normal_Disabled";

            btn_Print.Enabled = false;
            btn_Print.CssClass = "Button_Normal_Disabled";
        }
        else// EDIT MODE
        { 
        
        }
    
    }
     
    public int save()
    {
        try
        {
           obj_Patient.PK_PatientID= Convert.ToInt32(Request.QueryString["FK_PatientID"]);

           obj_Patient.PatientRegID = "";
            obj_Patient.FirstName = txt_FirstName.Text;
            obj_Patient.MiddleName= txt_MiddelName.Text;
            obj_Patient.LastName=txt_LastName.Text;
            obj_Patient.FullName= obj_Patient.FirstName+" "+obj_Patient.MiddleName+" "+obj_Patient.LastName;
            obj_Patient.LocalAddress=txt_CurrentAddress.Text;
            obj_Patient.PermenentAddress=txt_PermanentAddress.Text;
            obj_Patient.ImageUrl=txt_ImageUrl.Text;
            obj_Patient.Gender= Convert.ToInt32(drp_Gender.SelectedItem.Value);
            obj_Patient.Birthdate= txt_DOB.Text;
            obj_Patient.Age=Convert.ToInt32(txt_Age.Text);
            obj_Patient.BloodGroup=drp_BloodGroup.SelectedValue;
            obj_Patient.PhoneNo=txt_PhoneNumber.Text;
            obj_Patient.MobileNo=txt_MobileNumber.Text;
            obj_Patient.MarritalStatus=drp_MaritalStatus.SelectedValue;
            obj_Patient.IsLocalite=Convert.ToInt32(chk_IsLocalite.Checked);
            obj_Patient.RefferedBy=Convert.ToInt32(drp_ReferredBy.SelectedValue);
            obj_Patient.City=Convert.ToInt32(drp_City.SelectedValue);
            obj_Patient.State=Convert.ToInt32(drp_State.SelectedValue);
            obj_Patient.Country = Convert.ToInt32(drp_Country.SelectedValue); 
            obj_Patient.IsNew=Convert.ToInt32(chk_IsNew.Checked);
            obj_Patient.Note=txt_Note.Text;
            obj_Patient.Weight = Convert.ToDouble(txt_Weight.Text);
            return Convert.ToInt32(obj_Patient.InsertUpdate());

        }
        catch (Exception ex)
        {
            throw ex;
        }
    
    }

    protected void FillData_Dropdown()
    { 
        Base_BLL_CommonFunction.FillCountry(drp_Country, Convert.ToInt32(Session["FK_HospitalID"]));
        Base_BLL_CommonFunction.FillRefferedBy(drp_ReferredBy, Convert.ToInt32(Session["FK_HospitalID"]));
    }

    protected void FillData_EditMode()
    {
        obj_Patient.GetPatient(Convert.ToInt32(Request.QueryString["FK_PatientID"]));
        
        txt_PatientRegNo.Text = obj_Patient.PatientRegID;

        txt_FirstName.Text  = obj_Patient.FirstName;
        txt_MiddelName.Text = obj_Patient.MiddleName;
        txt_LastName.Text   =obj_Patient.LastName;
       
        txt_CurrentAddress.Text     = obj_Patient.LocalAddress; 
        txt_PermanentAddress.Text   = obj_Patient.PermenentAddress; 
        txt_ImageUrl.Text           = obj_Patient.ImageUrl;
        img_PatientImage.ImageUrl   = obj_Patient.ImageUrl;
        drp_Gender.SelectedValue    = obj_Patient.Gender.ToString();
        txt_DOB.Text                = obj_Patient.Birthdate; 
        txt_Age.Text                = obj_Patient.Age.ToString();
        drp_BloodGroup.SelectedValue= obj_Patient.BloodGroup ;
        txt_PhoneNumber.Text        = obj_Patient.PhoneNo;
        txt_MobileNumber.Text       = obj_Patient.MobileNo;

        drp_MaritalStatus.SelectedValue = obj_Patient.MarritalStatus;
        chk_IsLocalite.Checked          = Convert.ToBoolean(obj_Patient.IsLocalite);

        txt_Weight.Text = obj_Patient.Weight.ToString();

        Base_BLL_CommonFunction.FillRefferedBy(drp_ReferredBy, Convert.ToInt32(Session["FK_HospitalID"]));
        drp_ReferredBy.SelectedValue    = obj_Patient.RefferedBy.ToString();


        Base_BLL_CommonFunction.FillCountry(drp_Country, Convert.ToInt32(Session["FK_HospitalID"]));
        drp_Country.SelectedValue       = obj_Patient.Country.ToString();

        Base_BLL_CommonFunction.FillState(drp_State, obj_Patient.Country, Convert.ToInt32(Session["FK_HospitalID"]));
        drp_State.SelectedValue         = obj_Patient.State.ToString();

        Base_BLL_CommonFunction.FillCity(drp_City, obj_Patient.Country, obj_Patient.State, Convert.ToInt32(Session["FK_HospitalID"]));
        drp_City.SelectedValue          = obj_Patient.City.ToString();
         
        chk_IsNew.Checked               = Convert.ToBoolean(obj_Patient.IsNew);
        txt_Note.Text                   = obj_Patient.Note;
            
    }
   
    protected void btn_Search_Click(object sender, EventArgs e)
    {
        Response.Redirect("Frm_PatientSearch.aspx");
    }
    protected void btn_New_Click(object sender, EventArgs e)
    {

    }
    protected void btn_Save_Click(object sender, EventArgs e)
    {
        try
        {
            int result=save();

            if (Request.QueryString["FK_PatientID"] == null)
            {
                Session["MSG_TEXT"] = "Data Saved Successfully!!";
                Session["MSG_TYPE"] = MessageType.Success;
                Response.Redirect("Frm_PatientAddEdit.aspx?FK_PatientID=" + result.ToString());
            }
            else
            {
                uc_footer1.ShowMessage(MessageType.Success, "Data Saved Successfully!!", true, MessagePosition.Top, false);
            }

            
        }
        catch (Exception ex)
        {
            uc_footer1.ShowMessage(MessageType.Error, ex.Message, false, MessagePosition.Top, false);
        }
    }
    protected void btn_Delete_Click(object sender, EventArgs e)
    {

    }
    protected void btn_Print_Click(object sender, EventArgs e)
    {

    }
    protected void btn_FileUpload_Reload_Click(object sender, EventArgs e)
    {
        if (Session["FileName"] != null && Session["FileName"] != "")
        {
            txt_ImageUrl.Text = Session["FileName"].ToString();

            img_PatientImage.ImageUrl = txt_ImageUrl.Text;
            Session["FileName"] = null;
        }
    }
    protected void drp_Country_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            Base_BLL_CommonFunction.FillState(drp_State, Convert.ToInt32(drp_Country.SelectedValue), Convert.ToInt32(Session["FK_HospitalID"]));
        }
        catch (Exception ex)
        {
            uc_footer1.ShowMessage(MessageType.Error, ex.Message, false, MessagePosition.Top, false);
        }
    }
    protected void drp_State_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            Base_BLL_CommonFunction.FillCity(drp_City, Convert.ToInt32(drp_Country.SelectedValue), Convert.ToInt32(drp_State.SelectedValue), Convert.ToInt32(Session["FK_HospitalID"]));
        }
        catch (Exception ex)
        {
            uc_footer1.ShowMessage(MessageType.Error, ex.Message, false, MessagePosition.Top, false);
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ICSBLL;
using ICSBLL.BLL.Admin;
using System.Data;
using ICSBLL.BLL.Common;

public partial class UI_Admin_UserRegistration : System.Web.UI.Page
{
    ICSBLL.BLL.Admin.Base_BLL_User objuser;
    
    DataSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Header.DataBind();
        //uc_header.FillMenu(ICSBLL.Base_BLL_Constants.Modules.Admin);
        objuser = new Base_BLL_User();
        if (!IsPostBack)
        {
            
            try
            {
                FillUser_Master();

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        objuser = new Base_BLL_User();
        try
        {
            objuser.FirstName = txtFirstName.Text;
            objuser.MiddleName = txtMiddleName.Text;
            objuser.LastName = txtLastName.Text;
            objuser.UserRegID = txtUserId.Text;
            objuser.Password = Base_BLL_Cryptography.Encrypt(txtPassword.Text,true);
            if (chkIsactive.Checked)
                objuser.isActive = 1;
            else
                objuser.isActive = 0;

            if (chkIsdeleted.Checked)
                objuser.isDeleted = 1;
            else
               objuser.isDeleted = 0;
            
             
            objuser.RegisterUser();
            FillUser_Master();

            uc_error.ErrorMessage = "User information added successfully........ !";
            uc_error.IsError = false;
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Close", "ClearValues();", true);
           
        }
        catch (Exception Ex)
        {
            uc_error.ErrorMessage = Ex.Message;
            uc_error.IsError = true;
            
        }
 
    }

    public void FillUser_Master()
    {
        ds = objuser.GetRegisteredUser();
        grd_UserMaseter.DataSource = ds;
        grd_UserMaseter.DataBind();
    }


    protected void grd_UserMaseter_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        
    }
    protected void grd_UserMaseter_RowEditing(object sender, GridViewEditEventArgs e)
    {
        grd_UserMaseter.EditIndex = e.NewEditIndex;
        
        FillUser_Master();
        
    }
    protected void grd_UserMaseter_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        grd_UserMaseter.EditIndex = -1;

        FillUser_Master();
        
    }
    protected void grd_UserMaseter_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            int Pk_userId = int.Parse(grd_UserMaseter.DataKeys[e.RowIndex]["PK_UserId"].ToString());
            GridViewRow row = grd_UserMaseter.Rows[e.RowIndex];

            //objuser = new Base_BLL_User();
            objuser.FirstName = "";
            objuser.MiddleName = "";
            objuser.LastName = "";
            objuser.PK_UserID = Pk_userId;
            objuser.UserRegID = ((TextBox)row.FindControl("txtUserNameId_e")).Text;
            objuser.Password ="" ;//Base_BLL_Cryptography.Encrypt(((TextBox)row.FindControl("txtPassword_e")).Text, true);
            if (((CheckBox)row.FindControl("txtIsActive_e")).Checked == false)
                objuser.isActive = 0;
            else
                objuser.isActive = 1;

            if (((CheckBox)row.FindControl("txtIsdeleted_e")).Checked == false)
                objuser.isDeleted = 0;
            else
                objuser.isDeleted = 1;

            //objuser.isActive = Convert.ToInt32(((TextBox)row.FindControl("txtIsActive_e")).Text);
            //objuser.isDeleted = Convert.ToInt32(((TextBox)row.FindControl("txtIsdeleted_e")).Text);
            grd_UserMaseter.EditIndex = -1;
            objuser.RegisterUser();
            FillUser_Master();
            uc_error.ErrorMessage = "User information updated........ !";
            uc_error.IsError = false;
        }
        catch (Exception ex)
        {
            uc_error.ErrorMessage = ex.Message;
            uc_error.IsError = true;
        }
    }
    protected void grd_UserMaseter_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
}
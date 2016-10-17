using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UI_FrmMP_Common_Error : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Header.DataBind();

        if (Session["ErrorSource"] != null && Session["ErrorHeading"] != null && Session["ErrorMessage"] != null && Session["LoginButton"] != null)
        {
            lbl_Message.Text = Session["ErrorMessage"].ToString();
            lbl_ErrorSource.Text = Session["ErrorSource"].ToString();
            lbl_Title.Text = Session["ErrorHeading"].ToString();
        }
        if (Convert.ToBoolean(Session["LoginButton"]))
        {
            btn_Relogin.Visible = true;
        }
        else
        {
            btn_Relogin.Visible = false;
        }
    }
}
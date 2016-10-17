using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UC_Header_New : System.Web.UI.UserControl
{
    public bool MenuShow
    {
        set
        {
            if (value == false)
            {
                nav.Visible = false;
            }
        }
    }
    public bool UserInfoShow
    {
        set
        {
            if (value == false)
            {
                dv_UserInfo.Visible = false;
            }
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
      
        if(!Page.IsPostBack)
        {
            if (Path.GetFileName(Request.Url.AbsolutePath) != "FrmMP_Common_Error.aspx")
            {

                if (Session["Session_UserName"] != null && Session["Session_PK_UserID"] != null && Session["Session_ImageUrl"] != null)
                {
                    Lbl_LoginUser.Text = Convert.ToString(Session["Session_UserName"]);
                    img_UserImage.ImageUrl = Convert.ToString(Session["Session_ImageUrl"]);
                }
                else
                {

                    Session["ErrorSource"] = Path.GetFileName(Request.Url.AbsolutePath);
                    Session["ErrorHeading"] = "Session Expired";
                    Session["ErrorMessage"] = "Trying to access web page without logging in";
                    Session["LoginButton"] = "TRUE";
                    Response.Redirect("~/FrmMP_Common_Error.aspx");

                }
            }
        }
    }
}
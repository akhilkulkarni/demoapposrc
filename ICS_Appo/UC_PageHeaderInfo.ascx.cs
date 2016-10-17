using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UC_PageHeaderInfo : System.Web.UI.UserControl
{
    public String UserName
    {
        get {
            return lbl_UserName.Text;
        }
        set 
        {
            lbl_UserName.Text = value;
        }

    }

    public String FormName
    {
        get
        {
            return lbl_FormName.Text;
        }
        set
        {
            lbl_FormName.Text = value;
        }

    }

    protected void Page_Load(object sender, EventArgs e)
    {

    }
}
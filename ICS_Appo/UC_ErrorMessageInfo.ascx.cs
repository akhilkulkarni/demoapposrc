using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UC_LoginUserInfo : System.Web.UI.UserControl
{
    public String ErrorMessage
    {
        get
        {
            return lbl_ErrorMessage.Text;
        }
        set
        {
            lbl_ErrorMessage.Text = value;
        }

    }

    public bool IsError
    {
        
        set
        {
            if (value == true)
                lbl_ErrorMessage.ForeColor = System.Drawing.Color.Red;
            else
                lbl_ErrorMessage.ForeColor = System.Drawing.ColorTranslator.FromHtml("#3333FF");
        }

    }
    protected void Page_Load(object sender, EventArgs e)
    {

    }
}
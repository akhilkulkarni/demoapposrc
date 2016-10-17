using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UI_Appointment_Appointment_statusQueue : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Header.DataBind();
       // uc_header.FillMenu(ICSBLL.Base_BLL_Constants.Modules.Appointments);
    }
}
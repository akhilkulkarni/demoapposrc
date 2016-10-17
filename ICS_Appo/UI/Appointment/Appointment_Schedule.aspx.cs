using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Globalization;
using System.Threading;
using ICSCommon;
using ICSBLL.BLL.Appointment;
using System.Data;
public partial class UI_Appointment_Appointment_Schedule : System.Web.UI.Page
{
    Base_BLL_AppointmentSchedule objAppoSchedule;
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Header.DataBind();
        //uc_header.FillMenu(ICSBLL.Base_BLL_Constants.Modules.Appointments);
        FillAppointmentSchedule();
    }
    public void FillAppointmentSchedule()
    {
        objAppoSchedule = new Base_BLL_AppointmentSchedule();
        DataSet ds_AppoSchedule = objAppoSchedule.AppointmentSchedule_Get();
        grd_AppoSchedule.DataSource = ds_AppoSchedule;
        grd_AppoSchedule.DataBind();
    }
    
}
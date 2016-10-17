<%@ WebHandler Language="C#" Class="PatientQueue" %>

using System;
using System.Web;
using ICSBLL.BLL.Appointment;
public class PatientQueue : IHttpHandler {
    Base_BLL_PatientQueue objPQ = new Base_BLL_PatientQueue();
    public void ProcessRequest (HttpContext context) {
        try
        {

            context.Response.ContentType = "text/html";

            string id = context.Request.QueryString["id"];
            string Mode = context.Request.QueryString["mode"];

            if (Mode == "1")
            {
                objPQ.AppointmentsCancle(Convert.ToInt32(id));
            }
            else if (Mode == "2")
            {
                objPQ.AppointmentsReschedule(Convert.ToInt32(id));
            }
            else if (Mode == "3")
            {
                objPQ.AppointmentsDelete(Convert.ToInt32(id));
            }
            else if (Mode == "4")
            {
                string isFree = context.Request.QueryString["isFree"];
                string fees = context.Request.QueryString["fees"];
               
                objPQ.Appointments_FeesPayment(Convert.ToInt32(id),Convert.ToInt32(isFree),Convert.ToDouble(fees));
            }
            else if (Mode == "5")
            {
                objPQ.Appointments_SetPatientReportingTime(Convert.ToInt32(id));
            }
            else if (Mode == "6")
            {
                objPQ.AppointmentsCancledReset(Convert.ToInt32(id));
            }
            
            
            context.Response.Write("done "+id);
         }
        catch (Exception ex)
        {
            context.Response.Write(ex.Message);
        }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}
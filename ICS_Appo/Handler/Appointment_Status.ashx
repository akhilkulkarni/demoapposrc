<%@ WebHandler Language="C#" Class="Appointment_Status" %>

using System;
using System.Web;
using System.Web;
using ICSBLL.BLL.Appointment;
using System.Data;
using System.Web.Script.Serialization;
public class Appointment_Status : IHttpHandler {
    Base_BLL_StatusQueue objPS = new Base_BLL_StatusQueue();
    public void ProcessRequest (HttpContext context)
    {
        context.Response.ContentType = "text/plain";

        DataSet DS_AppoStatus = objPS.AppointmentStatus_GET();


        objPS.PrevName = DS_AppoStatus.Tables[0].Rows[0]["PrevName"].ToString();
        objPS.CurrName = DS_AppoStatus.Tables[0].Rows[0]["CurrName"].ToString();
        objPS.NextName = DS_AppoStatus.Tables[0].Rows[0]["NextName"].ToString();

        objPS.PrevID = DS_AppoStatus.Tables[0].Rows[0]["PrevId"].ToString();
        objPS.CurrentID = DS_AppoStatus.Tables[0].Rows[0]["CurrID"].ToString();
        objPS.NextID = DS_AppoStatus.Tables[0].Rows[0]["NextID"].ToString();
        
        //objPS.StatusQueueList=DS_AppoStatus.Tables[1].Rows[0]["LIST"].ToString();
        
        //    if(DS_AppoStatus.Tables[2].Rows.Count>0)
        //        objPS.SelectedElement= DS_AppoStatus.Tables[2].Rows[0]["ID"].ToString();
        //    else
        //        objPS.SelectedElement = "0";

            JavaScriptSerializer obj = new JavaScriptSerializer();
        
        context.Response.Write(obj.Serialize(objPS));
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}
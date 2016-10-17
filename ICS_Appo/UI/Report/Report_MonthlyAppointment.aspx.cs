using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ICSCommon;
using ICSBLL.BLL.Appointment;
using ICSBLL.BLL.Report;
using System.Data;

public partial class UI_Report_Report_MonthlyAppointment : System.Web.UI.Page
{
    Base_BLL_Report_Collection obj = new Base_BLL_Report_Collection();
    Base_BLL_Report_Collection objreport;
    Base_BLL_PatientQueue objtoday;
    DataSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {

        Page.Header.DataBind();
        //uc_header.FillMenu(ICSBLL.Base_BLL_Constants.Modules.Report);

        hdflag.Value = Convert.ToInt32(Request.QueryString["flag"]).ToString();
        //if (Request.QueryString["flag"] == "1")
        //{
        //    fillAppointmentSummary();
        //}
        UC_ListGrid1.LoadDefault();
       
    }
   
    protected void fillAppointmentSummary()
    {
        ds = new DataSet();
        objreport = new Base_BLL_Report_Collection();

       string fromdate=(drp_YearFrom.SelectedValue+"-"+Convert.ToInt32(ddlfromMonth.SelectedValue)+"-1").ToString();
       string todate=(drp_YearTo.SelectedValue +"-"+ Convert.ToInt32(ddltomonth.SelectedValue) + "-1").ToString();
       int flag;
       
       if (ddlfromMonth.SelectedValue == ddltomonth.SelectedValue)
       {
           flag = 1;
       }
       else
       {
           flag = 2;
       }

       ds = objreport.GetMonthlyCollectionReport(fromdate, todate, flag);
        if (ds != null)
        {
            UC_Total_Display.TotalPatient = ds.Tables[0].Rows.Count.ToString();
            UC_Total_Display.TotalAmmount =ds.Tables[0].Compute("Sum(Fees)", "").ToString();

            UC_ListGrid1.Data = ds;
          
        }
    }

  
    protected void btn_Go_Click(object sender, EventArgs e)
    {

        fillAppointmentSummary();
        fn_FillChart();
    }

    
    public void fn_FillChart()
    {

        String s1 = "";
        String s2 = "";
        String s3 = "";
        String s4 = "";
        String s5 = "";
        String s6 = "";
        String s7 = "";
        String s8 = "";
        String s9 = "";
        String s10 = "";

        String Col_Free = "";
        String Col_LOC = "";
        String Col_OUT = "";

        string fromdate = (drp_YearFrom.SelectedValue + "-" + Convert.ToInt32(ddlfromMonth.SelectedValue) + "-1").ToString();
        string todate = (drp_YearTo.SelectedValue + "-" + Convert.ToInt32(ddltomonth.SelectedValue) + "-1").ToString();

        DataSet ds = obj.CollectionReport_Mothly_BetweenDate(fromdate, todate);

        if (ds.Tables[0].Rows.Count > 0)
        {
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                s2 = s2 + "'" + ds.Tables[0].Rows[i][0].ToString() + "',";


                Col_LOC = Col_LOC + ds.Tables[0].Rows[i][4].ToString() + ",";
                Col_OUT = Col_OUT + ds.Tables[0].Rows[i][5].ToString() + ",";
                Col_Free = Col_Free + ds.Tables[0].Rows[i][3].ToString() + ",";

                s7 = s7 + ds.Tables[0].Rows[i][6].ToString() + ",";


            }



            s2 = s2.Substring(0, s2.Length - 1);

            s7 = s7.Substring(0, s7.Length - 1);
            Col_Free = Col_Free.Substring(0, Col_Free.Length - 1);
            Col_LOC = Col_LOC.Substring(0, Col_LOC.Length - 1);
            Col_OUT = Col_OUT.Substring(0, Col_OUT.Length - 1);


            s1 = "<script type='text/javascript'>$(function () {$('#div_MonthlyChart').highcharts({chart: {},title: {text: 'Monthly Collection Report'},xAxis: {categories: ";

            //s2 = "['Date1', 'Date2', 'Date3', 'Date3', 'Date5']";

            s3 = "},tooltip: {formatter: function() {var s; if (this.point.name) { s = ''+this.point.name +': '+ this.y +'';} else {s = ''+this.x  +': '+ this.y;}return s;}},labels: {items:";

            s4 = "[{  html: 'Daily Collection',style: {left: '40px',top: '8px',color: 'black'}}]},series:[";

            s4 = s4 + "{type: 'column',name: 'Free',data: [" + Col_Free + "]},{type: 'column',name: 'LOCAL',data: [" + Col_LOC + "]},{type: 'column',name: 'OUT',data: [" + Col_OUT + "]},";





            s6 = "{ type: 'spline', name: 'Collection', data:";

            // s7 = "[3, 2.67, 3, 6.33, 3.33]";

            s8 = ",marker: {lineWidth: 2,lineColor: Highcharts.getOptions().colors[3],fillColor: 'white'}}]});});" + " </script>";

            s9 = s1 + "[" + s2 + "]" + s3 + s4 + s5 + s6 + "[" + s7 + "]" + s8;

            ClientScript.RegisterStartupScript(Page.GetType(), "sas", s9);


        }
    }

}
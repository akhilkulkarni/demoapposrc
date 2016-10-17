using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using System.Text;
using System.Globalization;
using System.Threading;
using ICSCommon;
using ICSBLL.BLL.Appointment;
using ICSBLL.BLL.Report;
public partial class UI_Report_Report_DailyAppointment : System.Web.UI.Page
{
    Base_BLL_Report_Collection objreport;
    Base_BLL_PatientQueue objtoday;
    DataSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Header.DataBind();
        //uc_header.FillMenu(ICSBLL.Base_BLL_Constants.Modules.Report);
       
        //hdflag.Value = Request.QueryString["flag"].ToString();
        //if (Request.QueryString["flag"] == "1")
        //{
        //    fillAppointmentSummary();
        //}
        UC_ListGrid1.LoadDefault();
      
    }
    protected void btn_Go_Click(object sender, EventArgs e)
    {
        fillAppointmentSummary();
        FillPieChart();
    }

    protected void fillAppointmentSummary()
    {
        ds = new DataSet();
        objtoday = new Base_BLL_PatientQueue();
        int flag=Convert.ToInt32(Request.QueryString["flag"].ToString());

        if (Convert.ToDateTime(txt_appointmentDate.Text).Date== System.DateTime.Today.Date)
            flag = 1;
        ds = objtoday.AppointmentTodaysSummary_Get(txt_appointmentDate.Text,flag );

        
        if (ds != null)
        {
            UC_Total_Display.TotalPatient = ds.Tables[1].Rows[0][0].ToString();
            UC_Total_Display.TotalAmmount = ds.Tables[1].Rows[0][1].ToString();

            UC_ListGrid1.Data = ds;
            
        }
    }
    protected void FillBarchart(string NewAmt,string OldAmt)
    { 
        string s31="";
        string s32="";
        string s33="";
        string s34="";
        string s35="";
        string s36="";
        string s37="";
        string s38="";
        string s39="";
        string s40="";
       
        s31 = "<script type='text/javascript'>$(function () {$('#Div_BarChart').highcharts({chart: {type: 'column'},title: {text: 'Daily Collection'},";
        s32="xAxis: {categories: ['New','Old']},";
        s33="yAxis: {min: 0,title: {text: 'Collection (Rs)'}},";
        s34 = "tooltip:{headerFormat: '<span style=\"font-size:8px\"></span><table>',pointFormat: '<tr><td style=\"color:{series.color};padding:0\">{series.name}: </td>' +'<td style=\"padding:0\"><b>{point.y:.1f} Rs</b></td></tr>',footerFormat: '</table>',shared: true,useHTML: true},";
        //s35="\"<td style=\"padding:0\"><b>{point.y:.1f} mm</b></td></tr>\",footerFormat: \"</table>\",shared: true,useHTML: true},";
        s36="plotOptions: {column: {pointPadding: 0.2,borderWidth: 0}},";
        s37="series: [{name: 'NEW',data: ["+NewAmt+"]},";
        s38 = "{name: 'OLD',data: [" + OldAmt + "]}]";
        s39 = "});});</script>";
        s40=s31+s32+s33+s34+s35+s36+s37+s38+s39;
        ClientScript.RegisterStartupScript(Page.GetType(), "ssasase", s40);
    }
    protected void FillPieChart()
    {
        objreport=new Base_BLL_Report_Collection();

        string s1="";
        string s2="";
        string s3="";
        string s4="";
        string s5="";
        string s6="";
        string s7="";
        string s8="";
        string s9="";
        string s10="";
        string s11="";
        string s12="";
        string s13="";
        string s14="";
        string s15="";
        
        DateTimeFormatInfo dtfi;
        dtfi = new DateTimeFormatInfo();
        dtfi.ShortDatePattern = "dd-MM-yyyy";
        dtfi.DateSeparator = "-";
        DateTime objDate = Convert.ToDateTime(txt_appointmentDate.Text, dtfi);

        int flag=Convert.ToInt32(Request.QueryString["flag"]);

        if (Convert.ToDateTime(txt_appointmentDate.Text).Date == System.DateTime.Today.Date)
            flag = 1;

        DataSet Ds = objreport.CollectionReport_Daily_PieChart(objDate.ToString(), flag);
        
        if (Ds.Tables[0].Rows.Count > 0)
        {


            s1 = "<script type='text/javascript'>$(function (){ $('#Div_PieChart').highcharts({";
            s2 = "chart: { plotBackgroundColor: null, plotBorderWidth: null, plotShadow: false},";
            s3 = "title: {text: 'Todays Appointment'},";
            s4 = "tooltip: {formatter: function() {var s; if (this.point.name) { s = ''+this.point.name +': '+ this.y +'';} else {s = ''+this.x  +': '+ this.y;}return s;}},";
            s5 = "plotOptions: {pie: { allowPointSelect: true, cursor: 'pointer', dataLabels: {enabled: true,color: '#000000',connectorColor: '#000000', formatter: function() {return '<b>'+ this.point.name +'</b>: '+ this.percentage.toFixed(2) +' %';}}}},";
            s6 = "series: [{";
            s7 = "type: 'pie',";
            s8 = "name: 'Browser share',";
            s9 = "data: [";
            s11 = "['New'," +Ds.Tables[0].Rows[0][1] + "],";
            s12 = "['OLD'," + Ds.Tables[0].Rows[0][3] + "],";
            s13 = "['Free'," + Ds.Tables[0].Rows[0][0]+ "]";
            s10 = "]}]});});</script>";

            s14=s1+s2+s3+s4+s5+s6+s7+s8+s9+s11+s12+s13+s10;
            ClientScript.RegisterStartupScript(Page.GetType(), "sas",s14 );
            
            FillBarchart(Ds.Tables[0].Rows[0][2].ToString(), Ds.Tables[0].Rows[0][4].ToString());
        }

    }
      
}
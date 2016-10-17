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

public partial class UI_Report_Report_YearlyAppointment : System.Web.UI.Page
{
       Base_BLL_PatientQueue objtoday;
    Base_BLL_Report_Collection objreport;
    DataSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {

        Page.Header.DataBind();// uc_header.FillMenu(ICSBLL.Base_BLL_Constants.Modules.Report);

        hdflag.Value = Request.QueryString["flag"].ToString();
        //if (Request.QueryString["flag"] == "1")
        //{
        //    fillAppointmentSummary();
        //}
        UC_ListGrid_New.LoadDefault();
    }

    protected void btn_Go_Click(object sender, EventArgs e)
    {
        fillAppointmentSummary();
    }


     protected void fillAppointmentSummary()
    {
        ds = new DataSet();
       
         objreport=new Base_BLL_Report_Collection();
         string year=ddlyear.SelectedValue.ToString()+"-1-1";
        ds = objreport.GetYearlyCollectionReport(year);
        if (ds != null)
        {
            UC_Total_Display.TotalPatient= ds.Tables[0].Rows.Count.ToString();
            UC_Total_Display.TotalAmmount = ds.Tables[0].Compute("Sum(Fees)", "").ToString();
             
            UC_ListGrid_New.Data = ds; 
        }
    }

    protected void btn_print_Click(object sender, EventArgs e)
    {
        clsPrinting objPrint = new clsPrinting();

        ds = new DataSet();
        
        ds = new DataSet();
        
         objreport=new Base_BLL_Report_Collection();
         string year=ddlyear.SelectedValue.ToString()+"-1-1";
        ds = objreport.GetYearlyCollectionReport(year);
        
        DataTable table = new DataTable();
        table = ds.Tables[0];
        // Assign Data Source
        objPrint.DataSource = table;

        //Heading Here
        objPrint.ReportHeading = GetReortHeading();
        objPrint.ReportHeading.SubHeading = "Report for Year  :" + ddlyear.SelectedValue.ToString();
        objPrint.ShowFooter = true;

        // Create Columns Here
        objPrint.Columns.Add(new clsGridColumn("FullName", "FullName", "9%"));
        objPrint.Columns.Add(new clsGridColumn("LocalOutside.", "LocalOutside", "10%"));
        objPrint.Columns.Add(new clsGridColumn("NewOld", "NewOld", "15%"));
        objPrint.Columns.Add(new clsGridColumn("TockenID", "TockenID", "9%"));
        objPrint.Columns.Add(new clsGridColumn("AppoinmentDateTime", "AppoinmentDateTime", "8%"));
        objPrint.Columns.Add(new clsGridColumn("InTime", "InTime", "14%", "Total:"));
        objPrint.Columns.Add(new clsGridColumn("Fees", "Fees", "6%", true));
        //objPrint.Columns.Add(new clsGridColumn("Mobile", "MobileAll", "15%"));
        //objPrint.Columns.Add(new clsGridColumn("Email", "EmailAll", "14%"));
        hdPrint.Value = objPrint.GetGrid();
        ScriptManager.RegisterStartupScript(this, this.GetType(), "Close", "GetPrint();", true);
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

       ds = new DataSet();
       
         objreport=new Base_BLL_Report_Collection();
         string year=ddlyear.SelectedValue.ToString()+"-1-1";
        ds = objreport.GetYearlyCollectionReport(year);

        DataTable table = new DataTable();
        table = ds.Tables[0];
        if (table == null || table.Rows.Count == 0)
        {
            //clsJava.MessageBox("There is no records to export");
            return;
        }
        int[] columnList =
            { 
                table.Columns["FullName"].Ordinal, 
                table.Columns["LocalOutside"].Ordinal, 
                table.Columns["NewOld"].Ordinal,            
                table.Columns["TockenID"].Ordinal, 
                table.Columns["Fees"].Ordinal,
                table.Columns["AppoinmentDateTime"].Ordinal,
                table.Columns["InTime"].Ordinal,
                table.Columns["Fees"].Ordinal,
               
                
            };

        string[] HeadingList =
            { 
                
                 "FullName", 
                 "Local/Outside",  
                 "New/Old",           
                 "TockenId", 
                 "Fees", 
                 "AppoinmenmentDate", 
                 "InTime", 
                 "Fees", 
                 
                  
            };

        RKLib.ExportData.Export objExport = new RKLib.ExportData.Export("Web");
        objExport.ExportDetails(table, columnList, HeadingList, RKLib.ExportData.Export.ExportFormat.Excel, "PatientsReport.xls");
    }

    public clsReportHeading GetReortHeading()
    {
        clsReportHeading objHeading = new clsReportHeading();


        objHeading.ClinicName = "Ojus Ayurveda";
        objHeading.Line1 = "Ring Road";

        objHeading.City = "Jalgaon";
        objHeading.State = "Maharashtra";
        objHeading.Tel = "9987495737";
        objHeading.Mobile = "9987427544";
        objHeading.Email = "info@infocasier.com";

        objHeading.Website = "www.infocasier.com";
        objHeading.Pin = "425001";

        return objHeading;

    }
}

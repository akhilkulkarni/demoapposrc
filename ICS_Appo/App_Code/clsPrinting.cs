using System;
using System.Collections.Generic;
using System.Text;

using System.Data;
using System.Collections;

namespace ICSCommon
{

    public class clsGridColumn
    {

        public clsGridColumn(string HeaderText, string DataField, string Width)
        {
            _HeaderText = HeaderText;
            _DataField = DataField;
            _Width = Width;
        }

        public clsGridColumn(string HeaderText, string DataField, string Width, bool ShowTotal)
        {
            _HeaderText = HeaderText;
            _DataField = DataField;
            _Width = Width;
            _ShowTotal = ShowTotal;
        }

        public clsGridColumn(string HeaderText, string DataField, string Width,string TotalHeading)
        {
            _HeaderText = HeaderText;
            _DataField = DataField;
            _Width = Width;
            _ShowTotal = ShowTotal;
            _TotalHeading = TotalHeading;
        }

        public clsGridColumn()
        {

        }

        private string _HeaderText = string.Empty;
        private string _DataField = string.Empty;
        private string _Width = string.Empty;
        private bool _ShowTotal = false;
        private string _TotalHeading = string.Empty;




        public string HeaderText
        {
            get
            {
                return _HeaderText;
            }
            set
            {
                _HeaderText = value;
            }
        }
        public string DataField
        {
            get
            {
                return _DataField;
            }
            set
            {
                _DataField = value;
            }
        }
        public string Width
        {
            get
            {
                return _Width;
            }
            set
            {
                _Width = value;
            }
        }

        public bool ShowTotal
        {
            get
            {
                return _ShowTotal;
            }
            set
            {
                _ShowTotal = value;
            }
        }

        public string TotalHeading
        {
            get
            {
                return _TotalHeading.Trim();
            }
            set
            {
                _TotalHeading = value;
            }
        }



    }

    public class clsPrinting
    {
        int pageNumber = 1;
        int RowIndex = 0;
        int PageSize = 25;
        int defaultPageSize = 25;

        private int __PageSize
        {
            get
            {
                string temp = "20";
                if (temp == "")
                {
                    temp = "25";
                }

                return Convert.ToInt32(temp);
            }
        }

        private int __defaultPageSize
        {
            get
            {
                return __PageSize;
            }
        }

        //private string pageWidth = "100%";

        private const string TableCSS = "BORDER-RIGHT: darkgray 1px solid; BORDER-TOP: darkgray 1px solid; FONT-SIZE: 11px; BORDER-LEFT: darkgray 1px solid; WIDTH: 190mm;margin:0 auto; BORDER-BOTTOM: darkgray 1px solid; FONT-FAMILY: Verdana";
        private string TableStart = "<table id='table1' style='" + TableCSS + "' cellpadding='7' cellspacing='0' border='0'>";
        private string TableEnd = "</table>";

       

        #region Private Variables
        
        private GridColumnCollection __columns;
        
        private DataTable _DataSource = null;
        private bool _ShowFooter = false;
        private bool _ShowSrNo = false;
        private bool _ShowSrNoP = true;

        private string _ReportFooterText = string.Empty;
        private string _PatientAddress = string.Empty;

        #endregion

        #region Public Properties

        public bool ShowSrNo
        {
            get
            {
                return _ShowSrNo;
            }
            set
            {
                _ShowSrNo = value;
            }
        }

        public string ReportFooterText
        {
            get
            {
                return _ReportFooterText;
            }
            set
            {
                _ReportFooterText = value.Trim();
            }
        }
        public bool ShowFooter
        {
            get
            {
                return _ShowFooter;
            }
            set
            {
                _ShowFooter = value;
            }
        }

        public DataTable DataSource
        {
            get
            {
                return _DataSource;
            }
            set
            {
                _DataSource = value;
            }
        }

        public GridColumnCollection Columns
        {
            get
            {
                if (__columns == null) __columns = new GridColumnCollection();
                return __columns;
            }
            set
            {
                __columns = value;
            }
        }

        


        #endregion

        public string PatientAddress
        {
            get
            {
                return _PatientAddress;
            }
            set
            {
                _PatientAddress = value.ToString();
            }
        }
        private clsReportHeading objReportHeading = null;
        public clsReportHeading ReportHeading
        {
            get
            {
                return objReportHeading;
            }
            set
            {
                objReportHeading = value;
            }
        }

        private string GetGridHeader()
        {
            StringBuilder htm = new StringBuilder("");
            
            htm.Append("<tr class='ValueColumn'>");

            if (this.ShowSrNo == true)
            {
                htm.Append(clsHtml.GetTH("20px", "SNo", "datacell"));
            }

            foreach (clsGridColumn column in __columns)
            {
                htm.Append(clsHtml.GetTH(column.Width, column.HeaderText, "datacell"));
            }
            
            htm.Append("</tr>");

            return htm.ToString();

        }

        private string GetGridHeaderForSrNo()
        {
            StringBuilder htm = new StringBuilder("");

            htm.Append("<tr class='ValueColumn'>");

            if (this._ShowSrNoP == true)
            {
                htm.Append(clsHtml.GetTH("20px", "SNo", "datacell"));
            }

            foreach (clsGridColumn column in __columns)
            {
                htm.Append(clsHtml.GetTH(column.Width, column.HeaderText, "datacell"));
            }

            htm.Append("</tr>");

            return htm.ToString();

        }
        private string GetGridRow(DataRow row,int intSrNo)
        {
            StringBuilder htm = new StringBuilder("");

            htm.Append("<tr class='ValueColumn'>");

            if (this.ShowSrNo == true)
            {
                htm.Append(clsHtml.GetTD("20px", intSrNo.ToString(), "DataCell"));
            }

            foreach (clsGridColumn column in __columns)
            {
                string strData=Convert.ToString(row[column.DataField]);

                if (strData.Trim() == "") strData = "&nbsp;";              
                htm.Append(clsHtml.GetTD(column.Width, strData, "DataCell"));
            }

            htm.Append("</tr>");

            return htm.ToString();
        }

        private string GetGridRowWithSrNo(DataRow row, int intSrNo)
        {
            StringBuilder htm = new StringBuilder("");

            htm.Append("<tr class='ValueColumn'>");


            if (this._ShowSrNoP == true)
            {
                //htm.Append(clsHtml.GetTD("20px", intSrNo.ToString(), "DataCell"));
                htm.Append(clsHtml.GetTD("20px", intSrNo.ToString(), "DataCellForSrno"));
                
            }

            foreach (clsGridColumn column in __columns)
            {

                string strData = Convert.ToString(row[column.DataField]);

                if (strData.Trim() == "") strData = "&nbsp;";
                if (Convert.ToString(column.DataField) == "ToothNo")
                {
                    htm.Append(clsHtml.GetTD(column.Width, strData, "DataCellForSrno"));
                }
                else
                {
                    htm.Append(clsHtml.GetTD(column.Width, strData, "DataCell"));
                }
            }

            htm.Append("</tr>");

            return htm.ToString();
        }
        private string GetGridRowTotal()
        {
            StringBuilder htm = new StringBuilder("");


            htm.Append("<tr class='ValueColumn'>");

            foreach (clsGridColumn column in __columns)
            {
                string strData = string.Empty;
                if (column.ShowTotal == true)
                {
                    strData=this._DataSource.Compute("SUM(" + column.DataField + ")",string.Empty).ToString(); 
                }
                else if(column.TotalHeading!=string.Empty)
                {
                    strData = column.TotalHeading;
                }

                htm.Append(clsHtml.GetTD(column.Width, strData, "GridFooter"));
            }

            htm.Append("</tr>");


            return htm.ToString();
        }

        private int GetPageCount(int rowCount) // Count the Total Number of Pages
        {
            int TotalPageCount = 1;
            decimal TotalPageNo = Convert.ToDecimal(rowCount) / defaultPageSize;
          
            string[] strTemp = TotalPageNo.ToString().Split('.');

           
            if (strTemp.Length == 1)
            {
                TotalPageCount = Convert.ToInt32(TotalPageNo);
            }
            else if (strTemp.Length == 2)
            {
                if (Convert.ToDouble(strTemp.GetValue(1)) > 0)
                {
                    TotalPageCount = Convert.ToInt32(strTemp.GetValue(0)) + 1;
                   
                }
                else
                {
                    TotalPageCount = Convert.ToInt32(TotalPageNo);
                }

            }

            return TotalPageCount;
        }


        private string GetPageBreak(int pageNumber, int AllPages)
        {
            return " <div style=\"page-break-after:always;\"> Page Number: " + pageNumber + " of " + AllPages + " </div><br/>";
        }

        public string GetGrid()
        {
            StringBuilder htm = new StringBuilder("");

            PageSize = __PageSize;
            defaultPageSize = __PageSize;

            int intSrNo = 0;

            // Patient Address here

            if (this.PatientAddress != "")
            {
                htm.Append(this.PatientAddress);
            }

            // Get Report Heading here
            if (ReportHeading != null) htm.Append(objReportHeading.ReportHeading());

            int AllPages = GetPageCount(this._DataSource.Rows.Count);
          

            if (this._DataSource != null && this._DataSource.Rows.Count > 0)
            {

                htm.Append(TableStart);


                // Make Header Here ******************************              
                htm.Append(GetGridHeader());// Get Header Here


                
              

                // Make Rows here **********************************
                foreach (DataRow row in this._DataSource.Rows)
                {
                    intSrNo = intSrNo + 1;

                    if (RowIndex == PageSize)
                    {
                        
                        //htm.Append("</table>");
                        htm.Append(TableEnd);
                        
                        htm.Append(GetPageBreak(pageNumber, AllPages));// Page Break Here


                        htm.Append(TableStart);
                        htm.Append(GetGridHeader());// Get Header Here


                        pageNumber = pageNumber + 1;// Increase pageNumber
                        PageSize = PageSize + defaultPageSize;// Increase PageSize
                    }


                    htm.Append(GetGridRow(row, intSrNo));// Get Row Here

                    RowIndex = RowIndex + 1;// Increase Row Index
                }


                if (this._ShowFooter == true) { htm.Append(GetGridRowTotal()); } // add total here

                htm.Append(TableEnd);

                if (AllPages == 1)// if single page 
                {
                   // htm.Append(GetPageBreak(1, 1));// Page Break Here if single page
                }
                else //if( this._DataSource.Rows.Count % defaultPageSize != 0)
                {
                    htm.Append(GetPageBreak(pageNumber, AllPages));// Page Break for odd last page
                }
               
            }

            if (this.ReportFooterText != "")
            {
                htm.Append(this.ReportFooterText);
            }

            return htm.ToString();
        }

        public string GetGridWithSrNo()
        {
            StringBuilder htm = new StringBuilder("");

            PageSize = __PageSize;
            defaultPageSize = __PageSize;

            int intSrNo = 0;

            // Patient Address here

            if (this.PatientAddress != "")
            {
                htm.Append(this.PatientAddress);
            }

            // Get Report Heading here
            if (ReportHeading != null) htm.Append(objReportHeading.ReportHeading());

            int AllPages = GetPageCount(this._DataSource.Rows.Count);


            if (this._DataSource != null && this._DataSource.Rows.Count > 0)
            {

                htm.Append(TableStart);


                // Make Header Here ******************************              
                htm.Append(GetGridHeaderForSrNo());// Get Header Here





                // Make Rows here **********************************
                foreach (DataRow row in this._DataSource.Rows)
                {
                    intSrNo = intSrNo + 1;

                    if (RowIndex == PageSize)
                    {

                        //htm.Append("</table>");
                        htm.Append(TableEnd);

                        htm.Append(GetPageBreak(pageNumber, AllPages));// Page Break Here


                        htm.Append(TableStart);
                        htm.Append(GetGridHeader());// Get Header Here


                        pageNumber = pageNumber + 1;// Increase pageNumber
                        PageSize = PageSize + defaultPageSize;// Increase PageSize
                    }


                    htm.Append(GetGridRowWithSrNo(row, intSrNo));// Get Row Here

                    RowIndex = RowIndex + 1;// Increase Row Index
                }


                if (this._ShowFooter == true) { htm.Append(GetGridRowTotal()); } // add total here

                htm.Append(TableEnd);

                if (AllPages == 1)// if single page 
                {
                    // htm.Append(GetPageBreak(1, 1));// Page Break Here if single page
                }
                else //if( this._DataSource.Rows.Count % defaultPageSize != 0)
                {
                    htm.Append(GetPageBreak(pageNumber, AllPages));// Page Break for odd last page
                }

            }

            if (this.ReportFooterText != "")
            {
                htm.Append(this.ReportFooterText);
            }

            return htm.ToString();
        }

    }

    public class GridColumnCollection : List<clsGridColumn>
    {

        List<clsGridColumn> __Columns = new List<clsGridColumn>();


    }


    //public class clsReportHeading
    //{
    //    #region Private Variables

    //    private string _ClinicName = string.Empty;
    //    private string _ClinicNameFontSize = "12pt";
    //    private string _Line1 = string.Empty;
    //    private string _Line2 = string.Empty;
    //    private string _Line3 = string.Empty;

    //    private string _City = string.Empty;
    //    private string _State = string.Empty;
    //    private string _Pin = string.Empty;

    //    private string _Tel = string.Empty;
    //    private string _Mobile = string.Empty;
    //    private string _Fax = string.Empty;

    //    private string _Email = string.Empty;
    //    private string _Website = string.Empty;

    //    private string _SubHeading = string.Empty;
    //    private string _SubHeadingFontSize = "10pt";
    //    private string _SubHeadingAlign = TextAlign.Left;
        
    //    // For patients

    //    private string _AddressValue = string.Empty;
    //    private string _Code = string.Empty;


    //    #endregion

    //    #region Public Properties

       
    //    public string ClinicName
    //    {
    //        get { return _ClinicName; }
    //        set{ _ClinicName=value;}
    //    }

     
    //    public string ClinicNameFontSize
    //    {
    //        get { return _ClinicNameFontSize; }
    //        set { _ClinicNameFontSize = value; }
    //    }

      
    //    public string Line1
    //    {
    //        get { return _Line1; }
    //        set { _Line1 = value; }
    //    }

     
    //    public string Line2
    //    {
    //        get { return _Line2; }
    //        set { _Line2 = value; }
    //    }

      
    //    public string Line3
    //    {
    //        get { return _Line3; }
    //        set { _Line3 = value; }
    //    }

      
    //    public string City
    //    {
    //        get { return _City; }
    //        set { _City = value; }
    //    }

      
    //    public string State
    //    {
    //        get { return _State; }
    //        set { _State = value; }
    //    }


    //    public string Pin
    //    {
    //        get { return _Pin; }
    //        set { _Pin = value; }
    //    }

     
    //    public string Tel
    //    {
    //        get { return _Tel; }
    //        set { _Tel = value; }
    //    }


    //    public string Mobile
    //    {
    //        get { return _Mobile; }
    //        set { _Mobile = value; }
    //    }

   
    //    public string Fax
    //    {
    //        get { return _Fax; }
    //        set { _Fax = value; }
    //    }

       
    //    public string Email
    //    {
    //        get { return _Email; }
    //        set { _Email = value; }
    //    }

       
    //    public string Website
    //    {
    //        get { return _Website; }
    //        set { _Website = value; }
    //    }


    //    public string SubHeading
    //    {
    //        get { return _SubHeading; }
    //        set { _SubHeading = value; }
    //    }


    //    public string SubHeadingFontSize
    //    {
    //        get { return _SubHeadingFontSize; }
    //        set { _SubHeadingFontSize = value; }
    //    }

    //    public string SubHeadingAlign
    //    {
    //        get { return _SubHeadingAlign; }
    //        set { _SubHeadingAlign = value; }
    //    }

    //    public struct TextAlign
    //    {
    //        public const string Left = "left";
    //        public const string Right = "right";
    //        public const string Center = "center";
    //    }

    //    //For Patients

    //    public string AddressValue
    //    {
    //        get { return _AddressValue; }
    //        set { _AddressValue = value; }
    //    }


    //    public string Code
    //    {
    //        get { return _Code; }
    //        set { _Code = value; }
    //    }

    //    #endregion


    //    public string ReportHeading()
    //    {
    //        StringBuilder htm = new StringBuilder("");
    //        if (this._SubHeading == "Treatment Card" || this._SubHeading == "Bill")
    //        {
    //            htm.Append(" <table id=\"tblHeader1\" align=\"center\" border=\"0\" style=\"width: 80%; font-family: Verdana; font-size: 11px;\" > ");
    //        }
    //        else
    //        {
    //            htm.Append(" <table id=\"tblHeader1\" border=\"0\" style=\"width: 190mm; margin:40px auto 10px!important; font-family: Verdana; font-size: 11px;\" > ");
    //        }
    //        htm.Append(" <tr>");

    //        // Left hand side part
    //        htm.Append(" <td align=\"left\" valign=\"top\" style=\"width:65%\">");
    //        htm.Append(" <table id=\"tblLeft\" border=\"0\" cellpadding='0' cellspacing='0' style=\"width: 100%; font-family: Verdana; font-size: 11px;\">");

    //        htm.Append(" <tr><td><span style=\"font-size: " + this._ClinicNameFontSize + "\"><strong>" + this._ClinicName + "</strong></span></td></tr> ");
    //        htm.Append(" <tr><td>" + this._Line1 + "</td></tr> ");
    //        htm.Append(" <tr><td>" + this._Line2 + "</td></tr> ");
    //        htm.Append(" <tr><td>" + this._Line3 + "</td></tr> ");
    //        htm.Append(" <tr><td>" + this._City + "," + this._State  + "</td></tr> ");
    //        htm.Append(" <tr><td>Pin: " + this._Pin + ".</td></tr> ");
    //        htm.Append(" </table> ");
    //        htm.Append(" </td> ");

    //        // Right hand side part
    //        htm.Append(" <td align=\"left\" valign=\"top\" style=\"width:35%\"> ");
    //        htm.Append(" <table id=\"tblRight\" border=\"0\" cellpadding='0' cellspacing='0' style=\"width: 100%; font-family: Verdana;font-size: 11px;\"> ");
    //        htm.Append(" <tr ><td style=\"width: 30%;text-align:right;\"><span style=\"font-size: 12pt\"><strong>&nbsp;</strong></span></td><td style=\"width: 70%\"></td></tr> ");
    //        htm.Append(" <tr><td style=\"width: 30%;text-align:right;\" >Tel&nbsp;</td><td style=\"width: 70%\">:&nbsp;" + this._Tel + "</td></tr> ");
    //        htm.Append(" <tr><td style=\"width: 30%;text-align:right;\" >Mobile&nbsp;</td><td style=\"width: 70%\">:&nbsp;" + this._Mobile + " </td></tr> ");
    //        htm.Append(" <tr><td style=\"width: 30%;text-align:right;\" >Fax&nbsp;</td><td style=\"width: 70%\">:&nbsp;" + this._Fax + "</td></tr> ");
    //        htm.Append(" <tr><td style=\"width: 30%;text-align:right;\" >Email&nbsp;</td><td style=\"width: 70%\">:&nbsp;" + this._Email + "</td></tr> ");
    //        htm.Append(" <tr><td style=\"width: 30%;text-align:right;\" >Website&nbsp;</td><td style=\"width: 70%\">:&nbsp;" + this._Website + "</td></tr> ");
            
    //        htm.Append(" </table> ");
    //        htm.Append(" </td> ");
    //        htm.Append(" </tr> ");
    //        htm.Append(" </table> ");

    //        htm.Append(" <br/> ");


    //        // Sub Heading Part
    //        if (this._SubHeading == "Treatment Card" || this._SubHeading == "Bill")
    //        {
    //            htm.Append(" <table class='HeadingRow' align=\"center\" id=\"tblSubHeading\" border=\"0\" style=\"width: 80%; font-family: Verdana; font-size: 11px; border-right: lightgrey 1px solid; border-top: lightgrey 1px solid; border-left: lightgrey 1px solid; border-bottom: lightgrey 1px solid;\"> ");
    //        }
    //        else
    //        {
    //            htm.Append(" <table class='HeadingRow' id=\"tblSubHeading\" border=\"0\" style=\"width: 190mm; margin:0 auto; font-family: Verdana; font-size: 11px; border:darkgray 1px solid; border-bottom:0px;\"> ");
    //        }
    //        htm.Append("  <tr> ");

    //        htm.Append(" <td align=\"" + this._SubHeadingAlign + "\" style=\"width: 100%;background-color: #E9E9EB;\" valign=\"top\"><strong><span style=\"font-size: " + this._SubHeadingFontSize + "\">" + this._SubHeading + " </span></strong></td> ");
            
    //        //htm.Append(" <td align=\"left\" style=\"width: 15%\" valign=\"top\">" + DateTime.Now.Date.ToString("dd-MMM-yyyy")  + "</td> ");
    //        htm.Append(" </tr> ");
    //        htm.Append(" </table> ");
    //        //htm.Append(" <br /> ");
            

    //        return htm.ToString();


    //    }

    //    public string ReportHeadingBill()
    //    {
    //        StringBuilder htm = new StringBuilder("");

    //        // Sub Heading Part.
            
    //        htm.Append(" <table id=\"tblSubHeading\" border=\"0\" style=\"width: 100%; font-family: Verdana; font-size: 11px; border-right: lightgrey 1px solid; border-top: lightgrey 1px solid; border-left: lightgrey 1px solid; border-bottom: lightgrey 1px solid; margin-top:3.5cm \">");
    //        htm.Append("  <tr> ");
    //        htm.Append(" <td align=\"" + this._SubHeadingAlign + "\" style=\"width: 100%\" valign=\"top\"><strong><span style=\"font-size: " + this._SubHeadingFontSize + "\">" + this._SubHeading + " </span></strong></td> ");
    //        //htm.Append(" <td align=\"left\" style=\"width: 15%\" valign=\"top\">" + DateTime.Now.Date.ToString("dd-MMM-yyyy")  + "</td> ");
    //        htm.Append(" </tr> ");
    //        htm.Append(" </table> ");
    //        htm.Append(" <br /> ");

    //        return htm.ToString();
    //    }

    //    public string ReportHeadingPrescription()
    //    {
    //        StringBuilder htm = new StringBuilder("");

    //        // Sub Heading Part
    //        htm.Append(" <table class='HeadingRow' id=\"tblSubHeading\" border=\"0\" style=\"width: 12cm; backgroud-color:white; font-family: Verdana; font-size: 11px; border: lightgrey 1px;margin:3.5cm auto 0;\"> ");
    //        htm.Append("  <tr Style=\" Display:None;\"> ");
    //        htm.Append(" <td  align=\"" + this._SubHeadingAlign + "\" style=\"width: 100%; background-color: #E9E9EB;\" valign=\"top\"><strong><span  style=\"font-size: " + this._SubHeadingFontSize + "\">" + this._SubHeading + " </span></strong></td> ");
    //        //htm.Append(" <td align=\"left\" style=\"width: 15%\" valign=\"top\">" + DateTime.Now.Date.ToString("dd-MMM-yyyy")  + "</td> ");
    //        htm.Append(" </tr> ");
    //        htm.Append(" </table> ");
    //        //htm.Append(" <br /> ");

    //        return htm.ToString();
    //    }

    //    public string ReportHeadingReceipt()
    //    {
    //        StringBuilder htm = new StringBuilder("");

    //        htm.Append(" <table id=\"tblHeader1\" border=\"0\" style=\"width: 190mm; margin:40px auto 10px!important; font-family: Verdana; font-size: 11px\" > ");
    //        htm.Append(" <tr>");

    //        // Left hand side part
    //        htm.Append(" <td align=\"left\" valign=\"top\" style=\"width:65%\">");
    //        htm.Append(" <table id=\"tblLeft\" border=\"0\" cellpadding='0' cellspacing='0' style=\"width: 100%; font-family: Verdana; font-size: 11px;\">");

    //        htm.Append(" <tr><td><span style=\"font-size: " + this._ClinicNameFontSize + "\"><strong>" + this._ClinicName + "</strong></span></td></tr> ");
    //        htm.Append(" <tr><td>" + this._Line1 + "</td></tr> ");
    //        htm.Append(" <tr><td>" + this._Line2 + "</td></tr> ");
    //        htm.Append(" <tr><td>" + this._Line3 + "</td></tr> ");
    //        htm.Append(" <tr><td>" + this._City + "," + this._State + "</td></tr> ");
    //        htm.Append(" <tr><td>Pin: " + this._Pin + ".</td></tr> ");
    //        htm.Append(" </table> ");
    //        htm.Append(" </td> ");

    //        // Right hand side part
    //        htm.Append(" <td align=\"left\" valign=\"top\" style=\"width:35%\"> ");
    //        htm.Append(" <table id=\"tblRight\" border=\"0\" cellpadding='0' cellspacing='0' style=\"width: 100%; font-family: Verdana;font-size: 11px\"> ");
    //        htm.Append(" <tr ><td style=\"width: 30%\"><span style=\"font-size: 12pt\"><strong>&nbsp;</strong></span></td><td style=\"width: 70%\"></td></tr> ");
    //        htm.Append(" <tr><td style=\"width: 30%\" align=\"Right\">Tel:&nbsp;</td><td style=\"width: 70%\">" + this._Tel + "</td></tr> ");
    //        htm.Append(" <tr><td style=\"width: 30%\" align=\"Right\">Mobile:&nbsp;</td><td style=\"width: 70%\">" + this._Mobile + " </td></tr> ");
    //        htm.Append(" <tr><td style=\"width: 30%\" align=\"Right\">Fax:&nbsp;</td><td style=\"width: 70%\">" + this._Fax + "</td></tr> ");
    //        htm.Append(" <tr><td style=\"width: 30%\" align=\"Right\">Email:&nbsp;</td><td style=\"width: 70%\">" + this._Email + "</td></tr> ");
    //        htm.Append(" <tr><td style=\"width: 30%\" align=\"Right\">Website:&nbsp;</td><td style=\"width: 70%\">" + this._Website + "</td></tr> ");
    //        htm.Append(" </table> ");
    //        htm.Append(" </td> ");
    //        htm.Append(" </tr> ");
    //        htm.Append(" </table> ");

    //        htm.Append(" <br/> ");


    //        // Sub Heading Part
    //        htm.Append(" <table id=\"tblSubHeading\" border=\"0\" style=\"width: 190mm; margin:0px auto 0px!important; font-family: Verdana; font-size: 11px; border: 1px solid; border-bottom: lightgrey 0px solid\"> ");
    //        htm.Append("  <tr> ");
    //        htm.Append(" <td align=\"" + this._SubHeadingAlign + "\" style=\"width: 100%\" valign=\"top\"><strong><span style=\"font-size: " + this._SubHeadingFontSize + "\">" + this._SubHeading + " </span></strong></td> ");
    //        //htm.Append(" <td align=\"left\" style=\"width: 15%\" valign=\"top\">" + DateTime.Now.Date.ToString("dd-MMM-yyyy")  + "</td> ");
    //        htm.Append(" </tr> ");
    //        htm.Append(" </table> ");
    //        //htm.Append(" <br /> ");

    //        return htm.ToString();


    //    }
  
    //}


}

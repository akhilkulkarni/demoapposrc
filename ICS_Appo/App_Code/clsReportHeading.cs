using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;



public class clsReportHeading
{
    #region Private Variables

    private string _ClinicName = string.Empty;
    private string _ClinicNameFontSize = "12pt";
    private string _Line1 = string.Empty;
    private string _Line2 = string.Empty;
    private string _Line3 = string.Empty;

    private string _City = string.Empty;
    private string _State = string.Empty;
    private string _Pin = string.Empty;

    private string _Tel = string.Empty;
    private string _Mobile = string.Empty;
    private string _Fax = string.Empty;

    private string _Email = string.Empty;
    private string _Website = string.Empty;

    private string _SubHeading = string.Empty;
    private string _SubHeadingFontSize = "10pt";
    private string _SubHeadingAlign = TextAlign.Left;

    // For patients

    private string _AddressValue = string.Empty;
    private string _Code = string.Empty;
    
    private string _Name = string.Empty;


    #endregion

    #region Public Properties


    public string ClinicName
    {
        get { return _ClinicName; }
        set { _ClinicName = value; }
    }


    public string ClinicNameFontSize
    {
        get { return _ClinicNameFontSize; }
        set { _ClinicNameFontSize = value; }
    }


    public string Line1
    {
        get { return _Line1; }
        set { _Line1 = value; }
    }


    public string Line2
    {
        get { return _Line2; }
        set { _Line2 = value; }
    }


    public string Line3
    {
        get { return _Line3; }
        set { _Line3 = value; }
    }


    public string City
    {
        get { return _City; }
        set { _City = value; }
    }


    public string State
    {
        get { return _State; }
        set { _State = value; }
    }


    public string Pin
    {
        get { return _Pin; }
        set { _Pin = value; }
    }


    public string Tel
    {
        get { return _Tel; }
        set { _Tel = value; }
    }


    public string Mobile
    {
        get { return _Mobile; }
        set { _Mobile = value; }
    }


    public string Fax
    {
        get { return _Fax; }
        set { _Fax = value; }
    }


    public string Email
    {
        get { return _Email; }
        set { _Email = value; }
    }


    public string Website
    {
        get { return _Website; }
        set { _Website = value; }
    }


    public string SubHeading
    {
        get { return _SubHeading; }
        set { _SubHeading = value; }
    }


    public string SubHeadingFontSize
    {
        get { return _SubHeadingFontSize; }
        set { _SubHeadingFontSize = value; }
    }

    public string SubHeadingAlign
    {
        get { return _SubHeadingAlign; }
        set { _SubHeadingAlign = value; }
    }

    public struct TextAlign
    {
        public const string Left = "left";
        public const string Right = "right";
        public const string Center = "center";
    }

    //For Patients

    public string AddressValue
    {
        get { return _AddressValue; }
        set { _AddressValue = value; }
    }


    public string Code
    {
        get { return _Code; }
        set { _Code = value; }
    }

    #endregion


 

    public string ReportHeading()
    {
        StringBuilder htm = new StringBuilder("");
        if (this._SubHeading == "Treatment Card" || this._SubHeading == "Bill")
        {
            htm.Append(" <table id=\"tblHeader1\" align=\"center\" border=\"0\" style=\"width: 80%; font-family: Verdana; font-size: 11px;\" > ");
        }
        else
        {
            htm.Append(" <table id=\"tblHeader1\" border=\"0\" style=\"width: 190mm; margin:40px auto 10px!important; font-family: Verdana; font-size: 11px;\" > ");
        }
        htm.Append(" <tr>");

        // Left hand side part
        htm.Append(" <td align=\"left\" valign=\"top\" style=\"width:65%\">");
        htm.Append(" <table id=\"tblLeft\" border=\"0\" cellpadding='0' cellspacing='0' style=\"width: 100%; font-family: Verdana; font-size: 11px;\">");

        htm.Append(" <tr><td><span style=\"font-size: " + this._ClinicNameFontSize + "\"><strong>" + this._ClinicName + "</strong></span></td></tr> ");
        htm.Append(" <tr><td>" + this._Line1 + "</td></tr> ");
        htm.Append(" <tr><td>" + this._Line2 + "</td></tr> ");
        htm.Append(" <tr><td>" + this._Line3 + "</td></tr> ");
        htm.Append(" <tr><td>" + this._City + "," + this._State + "</td></tr> ");
        htm.Append(" <tr><td>Pin: " + this._Pin + ".</td></tr> ");
        htm.Append(" </table> ");
        htm.Append(" </td> ");

        // Right hand side part
        htm.Append(" <td align=\"left\" valign=\"top\" style=\"width:35%\"> ");
        htm.Append(" <table id=\"tblRight\" border=\"0\" cellpadding='0' cellspacing='0' style=\"width: 100%; font-family: Verdana;font-size: 11px;\"> ");
        htm.Append(" <tr ><td style=\"width: 30%;text-align:right;\"><span style=\"font-size: 12pt\"><strong>&nbsp;</strong></span></td><td style=\"width: 70%\"></td></tr> ");
        htm.Append(" <tr><td style=\"width: 30%;text-align:right;\" >Tel&nbsp;</td><td style=\"width: 70%\">:&nbsp;" + this._Tel + "</td></tr> ");
        htm.Append(" <tr><td style=\"width: 30%;text-align:right;\" >Mobile&nbsp;</td><td style=\"width: 70%\">:&nbsp;" + this._Mobile + " </td></tr> ");
        htm.Append(" <tr><td style=\"width: 30%;text-align:right;\" >Fax&nbsp;</td><td style=\"width: 70%\">:&nbsp;" + this._Fax + "</td></tr> ");
        htm.Append(" <tr><td style=\"width: 30%;text-align:right;\" >Email&nbsp;</td><td style=\"width: 70%\">:&nbsp;" + this._Email + "</td></tr> ");
        htm.Append(" <tr><td style=\"width: 30%;text-align:right;\" >Website&nbsp;</td><td style=\"width: 70%\">:&nbsp;" + this._Website + "</td></tr> ");

        htm.Append(" </table> ");
        htm.Append(" </td> ");
        htm.Append(" </tr> ");
        htm.Append(" </table> ");

        htm.Append(" <br/> ");


        // Sub Heading Part
        if (this._SubHeading == "Treatment Card" || this._SubHeading == "Bill")
        {
            htm.Append(" <table class='HeadingRow' align=\"center\" id=\"tblSubHeading\" border=\"0\" style=\"width: 80%; font-family: Verdana; font-size: 11px; border-right: lightgrey 1px solid; border-top: lightgrey 1px solid; border-left: lightgrey 1px solid; border-bottom: lightgrey 1px solid;\"> ");
        }
        else
        {
            htm.Append(" <table class='HeadingRow' id=\"tblSubHeading\" border=\"0\" style=\"width: 190mm; margin:0 auto; font-family: Verdana; font-size: 11px; border:darkgray 1px solid; border-bottom:0px;\"> ");
        }
        htm.Append("  <tr> ");

        htm.Append(" <td align=\"" + this._SubHeadingAlign + "\" style=\"width: 100%;background-color: #E9E9EB;\" valign=\"top\"><strong><span style=\"font-size: " + this._SubHeadingFontSize + "\">" + this._SubHeading + " </span></strong></td> ");

        //htm.Append(" <td align=\"left\" style=\"width: 15%\" valign=\"top\">" + DateTime.Now.Date.ToString("dd-MMM-yyyy")  + "</td> ");
        htm.Append(" </tr> ");
        htm.Append(" </table> ");
        //htm.Append(" <br /> ");


        return htm.ToString();


    }

    public string ReportHeadingBill()
    {
        StringBuilder htm = new StringBuilder("");

        // Sub Heading Part.

        htm.Append(" <table id=\"tblSubHeading\" border=\"0\" style=\"width: 100%; font-family: Verdana; font-size: 11px; border-right: lightgrey 1px solid; border-top: lightgrey 1px solid; border-left: lightgrey 1px solid; border-bottom: lightgrey 1px solid; margin-top:3.5cm \">");
        htm.Append("  <tr> ");
        htm.Append(" <td align=\"" + this._SubHeadingAlign + "\" style=\"width: 100%\" valign=\"top\"><strong><span style=\"font-size: " + this._SubHeadingFontSize + "\">" + this._SubHeading + " </span></strong></td> ");
        //htm.Append(" <td align=\"left\" style=\"width: 15%\" valign=\"top\">" + DateTime.Now.Date.ToString("dd-MMM-yyyy")  + "</td> ");
        htm.Append(" </tr> ");
        htm.Append(" </table> ");
        htm.Append(" <br /> ");

        return htm.ToString();
    }

    public string ReportHeadingPrescription()
    {
        StringBuilder htm = new StringBuilder("");

        // Sub Heading Part
        htm.Append(" <table class='HeadingRow' id=\"tblSubHeading\" border=\"0\" style=\"width: 12cm; backgroud-color:white; font-family: Verdana; font-size: 11px; border: lightgrey 1px;margin:3.5cm auto 0;\"> ");
        htm.Append("  <tr Style=\" Display:None;\"> ");
        htm.Append(" <td  align=\"" + this._SubHeadingAlign + "\" style=\"width: 100%; background-color: #E9E9EB;\" valign=\"top\"><strong><span  style=\"font-size: " + this._SubHeadingFontSize + "\">" + this._SubHeading + " </span></strong></td> ");
        //htm.Append(" <td align=\"left\" style=\"width: 15%\" valign=\"top\">" + DateTime.Now.Date.ToString("dd-MMM-yyyy")  + "</td> ");
        htm.Append(" </tr> ");
        htm.Append(" </table> ");
        //htm.Append(" <br /> ");

        return htm.ToString();
    }

    public string ReportHeadingReceipt()
    {
        StringBuilder htm = new StringBuilder("");

        htm.Append(" <table id=\"tblHeader1\" border=\"0\" style=\"width: 190mm; margin:40px auto 10px!important; font-family: Verdana; font-size: 11px\" > ");
        htm.Append(" <tr>");

        // Left hand side part
        htm.Append(" <td align=\"left\" valign=\"top\" style=\"width:65%\">");
        htm.Append(" <table id=\"tblLeft\" border=\"0\" cellpadding='0' cellspacing='0' style=\"width: 100%; font-family: Verdana; font-size: 11px;\">");

        htm.Append(" <tr><td><span style=\"font-size: " + this._ClinicNameFontSize + "\"><strong>" + this._ClinicName + "</strong></span></td></tr> ");
        htm.Append(" <tr><td>" + this._Line1 + "</td></tr> ");
        htm.Append(" <tr><td>" + this._Line2 + "</td></tr> ");
        htm.Append(" <tr><td>" + this._Line3 + "</td></tr> ");
        htm.Append(" <tr><td>" + this._City + "," + this._State + "</td></tr> ");
        htm.Append(" <tr><td>Pin: " + this._Pin + ".</td></tr> ");
        htm.Append(" </table> ");
        htm.Append(" </td> ");

        // Right hand side part
        htm.Append(" <td align=\"left\" valign=\"top\" style=\"width:35%\"> ");
        htm.Append(" <table id=\"tblRight\" border=\"0\" cellpadding='0' cellspacing='0' style=\"width: 100%; font-family: Verdana;font-size: 11px\"> ");
        htm.Append(" <tr ><td style=\"width: 30%\"><span style=\"font-size: 12pt\"><strong>&nbsp;</strong></span></td><td style=\"width: 70%\"></td></tr> ");
        htm.Append(" <tr><td style=\"width: 30%\" align=\"Right\">Tel:&nbsp;</td><td style=\"width: 70%\">" + this._Tel + "</td></tr> ");
        htm.Append(" <tr><td style=\"width: 30%\" align=\"Right\">Mobile:&nbsp;</td><td style=\"width: 70%\">" + this._Mobile + " </td></tr> ");
        htm.Append(" <tr><td style=\"width: 30%\" align=\"Right\">Fax:&nbsp;</td><td style=\"width: 70%\">" + this._Fax + "</td></tr> ");
        htm.Append(" <tr><td style=\"width: 30%\" align=\"Right\">Email:&nbsp;</td><td style=\"width: 70%\">" + this._Email + "</td></tr> ");
        htm.Append(" <tr><td style=\"width: 30%\" align=\"Right\">Website:&nbsp;</td><td style=\"width: 70%\">" + this._Website + "</td></tr> ");
        htm.Append(" </table> ");
        htm.Append(" </td> ");
        htm.Append(" </tr> ");
        htm.Append(" </table> ");

        htm.Append(" <br/> ");


        // Sub Heading Part
        htm.Append(" <table id=\"tblSubHeading\" border=\"0\" style=\"width: 190mm; margin:0px auto 0px!important; font-family: Verdana; font-size: 11px; border: 1px solid; border-bottom: lightgrey 0px solid\"> ");
        htm.Append("  <tr> ");
        htm.Append(" <td align=\"" + this._SubHeadingAlign + "\" style=\"width: 100%\" valign=\"top\"><strong><span style=\"font-size: " + this._SubHeadingFontSize + "\">" + this._SubHeading + " </span></strong></td> ");
        //htm.Append(" <td align=\"left\" style=\"width: 15%\" valign=\"top\">" + DateTime.Now.Date.ToString("dd-MMM-yyyy")  + "</td> ");
        htm.Append(" </tr> ");
        htm.Append(" </table> ");
        //htm.Append(" <br /> ");

        return htm.ToString();


    }

}
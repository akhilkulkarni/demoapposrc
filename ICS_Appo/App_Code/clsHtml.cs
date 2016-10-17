using System;
using System.Collections.Generic;
using System.Text;

using System.Data;

namespace ICSCommon
{
    public class clsHtml
    {

        #region Image TAG

        public static string GetImage(string value)
        {
           

            StringBuilder sb = new StringBuilder("");
            sb.Append("<img");
            sb.Append(" src=\"" + value + "\"");
            sb.Append(" style=\"height:77px;width:65px;margin: 3px;");
            sb.Append(" border-width:0px;");
            sb.Append(" border-right: #009999 1px solid;");
            sb.Append(" border-top: #009999 1px solid;");
            sb.Append(" border-left: #009999 1px solid;");
            sb.Append(" border-bottom: #009999 1px solid;\" />");
            return sb.ToString();

        }

        public static string GetImage(string value, string height, string width)
        {


            StringBuilder sb = new StringBuilder("");
            sb.Append("<img");
            sb.Append(" src=\"" + value + "\"");
            sb.Append(" style=\"height:" + height + ";width:" + width + ";");
            sb.Append(" border-width:0px;");
            sb.Append(" border-right: #009999 1px solid;");
            sb.Append(" border-top: #009999 1px solid;");
            sb.Append(" border-left: #009999 1px solid;");
            sb.Append(" border-bottom: #009999 1px solid;\" />");
            return sb.ToString();

        }

        public static string GetImage(string strFunctionName, string imgPath)
        {
            return "<img src=\"" + imgPath + "\" align=\"left\" style=\"cursor: hand;\" onclick=\"" + strFunctionName + "\" />";

        }

        public static string GetImageWithToolTip(string strFunctionName, string imgPath, string toolTip)
        {
            return "<img alt=\"" + toolTip + "\" src=\"" + imgPath + "\" align=\"left\" style=\"cursor: hand;\" onclick=\"" + strFunctionName + "\" />";

        }
        public static string GetImageWithToolTip(string strFunctionName, string imgPath, string toolTip,string height,string width)
        {
            return "<img alt=\"" + toolTip + "\" src=\"" + imgPath + "\" align=\"left\" style=\"width:" + width + ";height: " + height + ";cursor: hand;\"  onclick=\"" + strFunctionName + "\" />";

        }

        #endregion

        #region TD TAG

       
        public static string GetTD(string value)
        {
            StringBuilder sb = new StringBuilder("");
            sb.Append("<td align='centre' valign='top'>");
            sb.Append("" + value);
            sb.Append("</td>");

            return sb.ToString();

        }
        public static string GetTDP(string value)
        {
            StringBuilder sb = new StringBuilder("");
            sb.Append("<td align='centre' valign='top' colspan='3' >");
            sb.Append("" + value);
            sb.Append("</td>");

            return sb.ToString();

        }
        public static string GetTD(string Width, string value)
        {
            StringBuilder sb = new StringBuilder("");
            sb.Append("<td align='centre' valign='top' style='width:" + Width + "'>");
            sb.Append("" + value);
            sb.Append("</td>");

            return sb.ToString();

        }

        public static string GetTD(string Width, string value,string CssClass)
        {
            string align="";
            return GetTD(Width, value, CssClass, align);
        }

        public static string GetTD(string Width, string value, string CssClass,string align)
        {
            StringBuilder sb = new StringBuilder("");
            string temp = string.Empty;

            if (Width.Trim() != "")
            {
                temp = " style='width:" + Width + "'";
            }
            if (align.Trim() != "")
            {
                temp = temp + " align='" + align + "' ";
            }

            if (CssClass == "")
            {
                sb.Append("<td " + temp + " >");
            }
            else
            {
                sb.Append("<td class='" + CssClass + "'" + temp + " >");
            }
           

            sb.Append("" + value);
            sb.Append("</td>");

            return sb.ToString();
        }
        public static string GetTDP(string Width, string value, string CssClass)
        {
            string align = "";
            return GetTDP(Width, value, CssClass, align);
        }

        public static string GetTDP(string Width, string value, string CssClass, string align)
        {
            StringBuilder sb = new StringBuilder("");
            string temp = string.Empty;

            if (Width.Trim() != "")
            {
                temp = " style='width:" + Width + "'";
            }
            if (align.Trim() != "")
            {
                temp = temp + " align='" + align + "' ";
            }

            if (CssClass == "")
            {
                temp = temp + " colspan='3' ";
                sb.Append("<td " + temp + " >");
            }
            else
            {
                temp = temp + " colspan='3' ";
                sb.Append("<td class='" + CssClass + "'" + temp + " >");
            }


            sb.Append("" + value);
            sb.Append("</td>");

            return sb.ToString();
        }


        public static string GetTDCell(string value,string ClassName)
        {
            StringBuilder sb = new StringBuilder("");
            sb.Append("<td align='centre' valign='top' class='" + ClassName + "'>");
            sb.Append("" + value);
            sb.Append("</td>");

            return sb.ToString();

        }
       

        #endregion

        #region TH TAG

        public static string GetTH(string value)
        {
            StringBuilder sb = new StringBuilder("");
            sb.Append("<th align='center' valign='middle'>");
            sb.Append("" + value);
            sb.Append("</th>");

            return sb.ToString();

        }

        public static string GetTH(string Width, string value)
        {
            StringBuilder sb = new StringBuilder("");
            sb.Append("<th align='center' valign='middle' style='width:" + Width + "'>");
            sb.Append("" + value);
            sb.Append("</th>");

            return sb.ToString();

        }

        public static string GetTH(string Width, string value, string ClassName)
        {
            StringBuilder sb = new StringBuilder("");

            if (ClassName == "")
            {
                sb.Append("<th align='center' valign='middle' border='1' style='width:" + Width + ";text-align:center;'>");
            }
            else
            {
                sb.Append("<th align='center' valign='middle' border='1' style='width:" + Width +  ";text-align:center;' class='" + ClassName + "'>");
            }
            


            sb.Append("" + value);
            sb.Append("</th>");

            return sb.ToString();

        }

        #endregion

        #region Anchor TAG

        public static string GetLink(string strFunctionName,string linkName)
        {
            // first parameter is "1" for PatTreatOpt delete (else if 2 then PatTreatOptOr)
            return "<a href=\"javascript:undefined\" onclick=\"" + strFunctionName + ";\" class=\"link\">" + linkName + "</a>";

        }

        #endregion

        #region Ordered List

        //public static string GetOrderedList(DataTable table, string strColumnName)
        //{
        //    string strValue = string.Empty;
        //    StringBuilder htm = new StringBuilder("");
        //    htm.Append("<ol>");
        //    if (table != null && table.Rows.Count > 0)
        //    {
        //        foreach (DataRow row in table.Rows)
        //        {
        //            if (Convert.ToString(row[strColumnName]).Trim() != "")
        //            {
        //                if (!clsCommon.Strings.FindString(strValue, Convert.ToString(row[strColumnName]), ','))
        //                {
        //                    htm.Append("<li>" + Convert.ToString(row[strColumnName]) + "</li>");
        //                    strValue += "," + Convert.ToString(row[strColumnName]);
        //                }
        //            }
        //        }
        //    }

        //    htm.Append("</ol>");


        //    return htm.ToString();
        //}
        //it returns ordered list without any type of Numbers
        //public static string GetOrderedListWithoutNumbers(DataTable table, string strColumnName)
        //{
        //    string strValue = string.Empty;
        //    StringBuilder htm = new StringBuilder("");
        //    //htm.Append("<ol>");
        //    htm.Append("<ol style=\"list-style-type:none;margin: 0;\">");
        //    if (table != null && table.Rows.Count > 0)
        //    {
        //        foreach (DataRow row in table.Rows)
        //        {
        //            if (Convert.ToString(row[strColumnName]).Trim() != "")
        //            {
        //                if (!clsCommon.Strings.FindString(strValue, Convert.ToString(row[strColumnName]), ','))
        //                {
        //                    htm.Append("<li>" + Convert.ToString(row[strColumnName]) + "</li>");
        //                    strValue += "," + Convert.ToString(row[strColumnName]);
        //                }
        //            }
        //        }
        //    }

        //    htm.Append("</ol>");


        //    return htm.ToString();
        //}

        #endregion


        #region CheckBox
 
        public static string GetServerCheckBox(string strCheckBoxId, string strDisplayText, bool IsChecked)
        {
            StringBuilder html = new StringBuilder("");

            string strChecked = "";

            if (IsChecked) strChecked = "checked=\"checked\"";

            html.Append("<span>");
            html.Append("\n <asp:CheckBox " + strChecked + " runat=\"server\" ID=\"" + strCheckBoxId + "\"  />");

            if (strDisplayText.Trim() != "")
            {
                html.Append("\n <label for=\"" + strCheckBoxId + "\">" + strDisplayText + "</label>");
            }

            html.Append("</span>");
            return html.ToString();

        }

        public static string GetCheckBox(string strCheckBoxId,string strDisplayText,bool IsChecked)
        {
            StringBuilder html = new StringBuilder("");
           
            string strChecked = "";

            if (IsChecked) strChecked = "checked=\"checked\"";

            html.Append("<span>");
            html.Append("\n <input " + strChecked + " id=\"" + strCheckBoxId + "\" type=\"checkbox\"  />");

            if (strDisplayText.Trim() != "")
            {
                html.Append("\n <label for=\"" + strCheckBoxId + "\">" + strDisplayText + "</label>");
            }

            html.Append("</span>");
            return html.ToString();

        }
        public static string GetCheckBoxAppt(string strCheckBoxId, string strDisplayText, bool IsChecked, string TreatProcId)
        {
            StringBuilder html = new StringBuilder("");

            string strChecked = "";

            if (IsChecked) strChecked = "checked=\"checked\"";
            
            html.Append("<span>");
            html.Append("\n <input " + strChecked + " id=\"" + strCheckBoxId + "\" type=\"checkbox\" name=\"" + strCheckBoxId + "\" onclick=\"pp( '" + TreatProcId + "',this  )\" />");

            if (strDisplayText.Trim() != "")
            {
                html.Append("\n <label for=\"" + strCheckBoxId + "\">" + strDisplayText + "</label>");
            }

            html.Append("</span>");
            return html.ToString();

        }

        public static string GetCheckBox(string strCheckBoxId, string strDisplayText)
        {
            bool IsChecked=false;
            return GetCheckBox(strCheckBoxId, strDisplayText, IsChecked);
        }

        public static string GetCheckBox(string strCheckBoxId)
        {
            string strDisplayText = string.Empty;
            bool IsChecked = false;
            return GetCheckBox(strCheckBoxId, strDisplayText, IsChecked);
        }
        public static string GetCheckBoxAppt(string strCheckBoxId , string TreatProcId)
        {
            string strDisplayText = string.Empty;
            bool IsChecked = false;
            return GetCheckBoxAppt(strCheckBoxId, strDisplayText, IsChecked, TreatProcId);
        }
        #endregion




    }
}

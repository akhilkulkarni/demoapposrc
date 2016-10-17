<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Report_DailyAppointment.aspx.cs" EnableEventValidation="false" Theme="Default" Inherits="UI_Report_Report_DailyAppointment" %>

<%@ Register TagName="UC_Header" TagPrefix="UC" Src="~/UC_Header_New.ascx" %>
<%@ Register TagName="UC_Footer" TagPrefix="UC" Src="~/UC_Footer.ascx" %>
<%@ Register TagName="UC_FormName" TagPrefix="UC" Src="~/UC_PageHeaderInfo.ascx" %>
<%@ Register TagName="UC_ErrorName" TagPrefix="UC" Src="~/UC_ErrorMessageInfo.ascx" %>
<%@ Register Src="~/UC_Total_Display.ascx" TagPrefix="UC" TagName="UC_Total_Display" %>
<%@ Register Src="~/UC_ListGrid_New.ascx" TagPrefix="UC" TagName="UC_ListGrid" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <script src="<%# Page.ResolveUrl("~/JS/jquery-1.9.1.js")%>" type="text/javascript"></script>
    <script src="<%# Page.ResolveUrl("~/JS/JQuery-ui.js")%>" type="text/javascript"></script>
    <script src="<%# Page.ResolveUrl("~/JS/jquery.uilock.min.js")%>" type="text/javascript"></script>

    <script src="<%# Page.ResolveUrl("~/JS/jquery.uilock.min.js")%>" type="text/javascript"></script>
    <script src="<%# Page.ResolveUrl("~/JS/jquery.colorbox.js")%>" type="text/javascript"></script>

    <link href="<%# Page.ResolveUrl("~/CSS/colorbox.css")%>" rel="stylesheet" type="text/css" />
    <script src="<%# Page.ResolveUrl("~/JS/JQuery_ScrollTo.js")%>" type="text/javascript"></script>
    <script src="<%# Page.ResolveUrl("~/JS/Printing.js")%>" type="text/javascript"></script>
 
   
    <%-- MENU CSS--%>
    <link href="<%# Page.ResolveUrl("~/CSS/MainCommon.css")%>" rel="stylesheet" type="text/css" />
    <link href="<%# Page.ResolveUrl("~/css/dropdown/dropdown.css")%>" media="screen" rel="stylesheet" type="text/css" />
    <link href="<%# Page.ResolveUrl("~/css/dropdown/themes/vimeo.com/default.advanced.css")%>" media="screen" rel="stylesheet" type="text/css" /> 
    <%-- MENU CSS--%>
    <link href="<%# Page.ResolveUrl("~/CSS/DateControl.css")%>" rel="stylesheet" type="text/css" />

    <script src="http://code.highcharts.com/highcharts.js"></script>
    <script src="http://code.highcharts.com/modules/exporting.js"></script>
    <title></title>
    <script type="text/javascript">
        $(function () {
            $("#txt_appointmentDate").datepicker({
                showOn: "button",
                buttonImage: "../../Image/calendar.gif",
                buttonImageOnly: true,
                showAnim: 'slideDown',
                changeMonth: true,
                changeYear: true,
                dateFormat: 'dd-mm-yy'

            });
            var d = new Date();

            var strDate = pad(d.getDate() + "", 2) + "-" + pad((d.getMonth() + 1) + "", 2) + "-" + d.getFullYear();
            if (document.getElementById('hdflag').value == "1") {
                $("#txt_appointmentDate").val(strDate);
            }


        });
        function pad(str, max) {
            return str.length < max ? pad("0" + str, max) : str;
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
            <Scripts>
                <asp:ScriptReference Path="~/JS/ASYNC_Postback/Async_Callback_JS.js" />
            </Scripts>
        </asp:ScriptManager>
        <!--########################################## HEADER SEACTION ##########################################-->
        <UC:UC_Header ID="uc_header1" MenuShow="true" UserInfoShow="true" runat="server" />
        <!--#####################################################################################################-->
        <!--########################################## BODY SEACTION ############################################-->
     
         <div class="Div_MainPage">
            <table>
                <tr>
                    <td>
                        <asp:Label runat="server" ID="label_date" CssClass="label_Header" Text="Date"></asp:Label></td>
                    <td>
                        <asp:Label runat="server" ID="label2" CssClass="label_Header" Text=":"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txt_appointmentDate" runat="server" Width="100px" CssClass="TextBox_Normal"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="btn_Go" runat="server" Text="Go" Width="70px"
                            CssClass="Button_Normal" OnClick="btn_Go_Click" /></td>
                </tr>
            </table>

           
             <div id="Div_PieChart" style="border:1px solid #6d6d6d;width: 49%; height: 200px;padding:2px; margin: 0px; float: right;  "></div>

            <div id="Div_BarChart" style="border:1px solid #6d6d6d; width: 50%; height: 200px;padding:2px; margin: 0px;"></div>
            
              <%--<asp:GridView ID="grd_today_summary" ShowHeaderWhenEmpty="true" runat="server" AutoGenerateColumns="false"
                RowStyle-CssClass="row" CssClass="mGrid" PagerStyle-CssClass="pgr" CellPadding="4" GridLines="None">
                <Columns>
                    <asp:BoundField HeaderText="Name" DataField="FullName" />
                    <asp:BoundField HeaderText="Token Id" DataField="TockenID" />
                    <asp:BoundField HeaderText="Actual Time" DataField="InTime" />
                    <asp:BoundField HeaderText="Appointment Time" DataField="AppoinmentDateTime" />
                    <asp:BoundField HeaderText="Fees" DataField="Fees" />
                    <asp:BoundField HeaderText="Local/City" DataField="LocalOutside" />
                    <asp:BoundField HeaderText="New/Old" DataField="NewOld" />

                </Columns>
                <EmptyDataTemplate>
                    <table style="width: 100%">
                        <tr>
                            <td align="center">
                                <img alt="?" src="../../Image/information.png" height="20px" width="20px" />
                                <asp:Label ID="Label3" Text="No data found" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
            </asp:GridView>--%>

            <UC:UC_ListGrid runat="server" ID="UC_ListGrid1" />
            <UC:UC_Total_Display runat="server" ID="UC_Total_Display" />
              
            <input type="hidden" id="hdflag" runat="server" />
            <input type="hidden" id="hdPrint" runat="server" />
        </div>
              
        <!--#####################################################################################################-->
        <!--########################################## FOOTER SEACTION ##########################################-->
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <UC:UC_Footer ID="uc_footer1" LogoURL="../Image/ICS.PNG" runat="server" />
            </ContentTemplate>
        </asp:UpdatePanel>
        <!--#####################################################################################################-->


    </form>
</body>

</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Report_MonthlyAppointment.aspx.cs" EnableEventValidation="false" Theme="Default" Inherits="UI_Report_Report_MonthlyAppointment" %>

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

        function setmonth(obj) {
            $('#ddltomonth')[0].value = obj.value;
        }

        function fn_validateGo() {
            if ($('#ddlfromMonth')[0].value == 0) {

                alert("Please select from month...!");
                return false;
            }

            if ($('#ddlfromMonth')[0].value > $('#ddltomonth')[0].value) {

                alert("To month cant be less than from month ");
                return false;
            }
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
                        <asp:Label runat="server" ID="label_fromdate" CssClass="label_Header" Text="From Month"></asp:Label></td>
                    <td>
                        <asp:Label runat="server" ID="label2" CssClass="label_Header" Text=":"></asp:Label></td>
                    <td>
                        <%--<asp:TextBox  ID="txt_appointmentDate" runat="server" Width="100px" CssClass="TextBox_Normal"></asp:TextBox>--%>
                        <asp:DropDownList ID="ddlfromMonth" CssClass="DropDown_Normal" Height="22px" Width="100px" runat="server" onchange="setmonth(this);">
                            <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                            <asp:ListItem Text="January" Value="1"></asp:ListItem>
                            <asp:ListItem Text="February" Value="2"></asp:ListItem>
                            <asp:ListItem Text="March" Value="3"></asp:ListItem>
                            <asp:ListItem Text="April" Value="4"></asp:ListItem>
                            <asp:ListItem Text="May" Value="5"></asp:ListItem>
                            <asp:ListItem Text="June" Value="6"></asp:ListItem>
                            <asp:ListItem Text="July" Value="7"></asp:ListItem>
                            <asp:ListItem Text="August" Value="8"></asp:ListItem>
                            <asp:ListItem Text="September" Value="9"></asp:ListItem>
                            <asp:ListItem Text="October" Value="10"></asp:ListItem>
                            <asp:ListItem Text="Novemner" Value="11"></asp:ListItem>
                            <asp:ListItem Text="December" Value="12"></asp:ListItem>
                        </asp:DropDownList>

                    </td>
                    <td>
                        <asp:DropDownList ID="drp_YearFrom" runat="server" Width="100px">
                            <asp:ListItem Text="2013" Value="2013"></asp:ListItem>
                            <asp:ListItem Text="2014" Value="2014"></asp:ListItem>
                            <asp:ListItem Text="2015" Value="2015"></asp:ListItem>
                            <asp:ListItem Text="2016" Value="2016"></asp:ListItem>
                            <asp:ListItem Text="2017" Value="2017"></asp:ListItem>
                            <asp:ListItem Text="2018" Value="2018"></asp:ListItem>
                            <asp:ListItem Text="2019" Value="2019"></asp:ListItem>
                            <asp:ListItem Text="2020" Value="2020"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:Label runat="server" ID="label_todate" CssClass="label_Header" Text="TO Month"></asp:Label></td>
                    <td>
                        <asp:Label runat="server" ID="label5" CssClass="label_Header" Text=":"></asp:Label></td>
                    <td>
                        <%--<asp:TextBox  ID="txt_appointmentDate" runat="server" Width="100px" CssClass="TextBox_Normal"></asp:TextBox>--%>
                        <asp:DropDownList ID="ddltomonth" CssClass="DropDown_Normal" Height="22px" Width="100px" runat="server">
                            <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                            <asp:ListItem Text="January" Value="1" Enabled="true"></asp:ListItem>
                            <asp:ListItem Text="February" Value="2"></asp:ListItem>
                            <asp:ListItem Text="March" Value="3"></asp:ListItem>
                            <asp:ListItem Text="April" Value="4"></asp:ListItem>
                            <asp:ListItem Text="May" Value="5"></asp:ListItem>
                            <asp:ListItem Text="June" Value="6"></asp:ListItem>
                            <asp:ListItem Text="July" Value="7"></asp:ListItem>
                            <asp:ListItem Text="August" Value="8"></asp:ListItem>
                            <asp:ListItem Text="September" Value="9"></asp:ListItem>
                            <asp:ListItem Text="October" Value="10"></asp:ListItem>
                            <asp:ListItem Text="Novemner" Value="11"></asp:ListItem>
                            <asp:ListItem Text="December" Value="12"></asp:ListItem>

                        </asp:DropDownList>

                    </td>
                    <td>
                        <asp:DropDownList ID="drp_YearTo" runat="server" Width="100px">
                            <asp:ListItem Text="2013" Value="2013"></asp:ListItem>
                            <asp:ListItem Text="2014" Value="2014"></asp:ListItem>
                            <asp:ListItem Text="2015" Value="2015"></asp:ListItem>
                            <asp:ListItem Text="2016" Value="2016"></asp:ListItem>
                            <asp:ListItem Text="2017" Value="2017"></asp:ListItem>
                            <asp:ListItem Text="2018" Value="2018"></asp:ListItem>
                            <asp:ListItem Text="2019" Value="2019"></asp:ListItem>
                            <asp:ListItem Text="2020" Value="2020"></asp:ListItem>

                        </asp:DropDownList>
                    </td>

                    <td>
                        <asp:Button ID="btn_Go" runat="server" Text="Go" Width="70px"
                            CssClass="Button_Normal" OnClick="btn_Go_Click" OnClientClick="return fn_validateGo();" /></td>
                </tr>
            </table>

            <div id="div_MonthlyChart" style="width: 98%; margin-left: 10px; margin-right: 10px; height: 250px; background-color: white"></div>
          
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

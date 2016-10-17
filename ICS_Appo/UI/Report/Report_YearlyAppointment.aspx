<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Report_YearlyAppointment.aspx.cs" EnableEventValidation="false"  Theme="Default" Inherits="UI_Report_Report_YearlyAppointment" %>

<%@ Register TagName="UC_Header" TagPrefix="UC" Src="~/UC_Header_New.ascx" %>
<%@ Register TagName="UC_Footer" TagPrefix="UC" Src="~/UC_Footer.ascx" %>
<%@ Register TagName="UC_FormName" TagPrefix="UC" Src="~/UC_PageHeaderInfo.ascx" %>
<%@ Register TagName="UC_ErrorName" TagPrefix="UC" Src="~/UC_ErrorMessageInfo.ascx" %>
<%@ Register Src="~/UC_Total_Display.ascx" TagPrefix="UC" TagName="UC_Total_Display" %>
<%@ Register Src="~/UC_ListGrid_New.ascx" TagPrefix="UC" TagName="UC_ListGrid_New" %>


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

                        <asp:Label runat="server" ID="label_year" CssClass="label_Header" Text="Select Year"></asp:Label></td>
                    <td>
                        <asp:Label runat="server" ID="label2" CssClass="label_Header" Text=":"></asp:Label></td>
                    <td>
                        <%--<asp:TextBox  ID="txt_appointmentDate" runat="server" Width="100px" CssClass="TextBox_Normal"></asp:TextBox>--%>
                        <asp:DropDownList runat="server" ID="ddlyear">
                            <asp:ListItem Value="2013" Text="2013"></asp:ListItem>
                            <asp:ListItem Value="2014" Text="2014"></asp:ListItem>
                            <asp:ListItem Value="2015" Text="2015"></asp:ListItem>
                            <asp:ListItem Value="2016" Text="2016"></asp:ListItem>
                        </asp:DropDownList>

                    </td>
                    <td>
                        <asp:Button ID="btn_Go" runat="server" Text="Go" Width="70px"
                            CssClass="Button_Normal" OnClick="btn_Go_Click" /></td>
                </tr>
            </table>
            <div id="Div_PieChart" style="background-color: Blue; width: 50%; float: right; height: 200px; margin: 0px"></div>

            <div id="Div_BarChart" style="background-color: White; width: 50%; height: 200px; margin: 0px"></div>
            
            <UC:UC_ListGrid_New runat="server" ID="UC_ListGrid_New" />

            <UC:UC_Total_Display runat="server" ID="UC_Total_Display" />

            <asp:Button ID="btn_print" Text="Print" runat="server" Width="110px"
                CssClass="Button_Normal" OnClick="btn_print_Click" />
            <asp:Button ID="Button1" Text="Export to Excel" runat="server" Width="110px"
                CssClass="Button_Normal" OnClick="Button1_Click" />
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

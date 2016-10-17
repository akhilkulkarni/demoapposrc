<%@ Page Language="C#" AutoEventWireup="true" CodeFile="appointment_todaysSchedule.aspx.cs" Theme="Default" Inherits="UI_Appointment_appointment_todaysSchedule" %>

<%@ Register TagName="UC_Header" TagPrefix="UC" Src="~/UC_Header_New.ascx" %>
<%@ Register TagName="UC_Footer" TagPrefix="UC" Src="~/UC_Footer.ascx" %>
<%@ Register TagName="UC_FormName" TagPrefix="UC" Src="~/UC_PageHeaderInfo.ascx" %>
<%@ Register TagName="UC_ErrorName" TagPrefix="UC" Src="~/UC_ErrorMessageInfo.ascx" %>
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
            <table width="100%" border="1">
                <tr>
                    <td style="width: 38%; border: 0" align="center">Limitation on
                    </td>
                    <td style="width: 2%; border: 0">:
                    </td>
                    <td style="width: 60%; border: 0" align="center">
                        <asp:Label ID="lbl_limitation_type" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 38%; border: 0" align="center">Max patient
                    </td>
                    <td style="width: 2%; border: 0">:
                    </td>
                    <td style="width: 60%; border: 0" align="center">
                        <asp:Label ID="lbl_max_patient" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 38%; border: 0" align="center">Max Time
                    </td>
                    <td style="width: 2%; border: 0">:
                    </td>
                    <td style="width: 60%; border: 0" align="center">
                        <asp:Label ID="lbl_max_time" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 38%; border: 0" align="center">Appointment Done
                    </td>
                    <td style="width: 2%; border: 0">:
                    </td>
                    <td style="width: 60%; border: 0" align="center">
                        <asp:Label ID="lbl_appointment_done" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 38%; border: 0" align="center">Canceled
                    </td>
                    <td style="width: 2%; border: 0">:
                    </td>
                    <td style="width: 60%; border: 0" align="center">
                        <asp:Label ID="lbl_canceled" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
            </table>

            <table border="1" width="100%">
                <tr>
                    <td>
                        <table>
                            <tr>
                                <td colspan="3" align="center">Session-I
                                </td>
                            </tr>
                            <tr>
                                <td align="center" style="width: 38%">Start Time
                                </td>
                                <td style="width: 2%">:
                                </td>
                                <td align="center" style="width: 60%">
                                    <asp:Label ID="lbl_session1_starttime" runat="server" Text="Label"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="center">End Time
                                </td>
                                <td>:
                                </td>
                                <td align="center">
                                    <asp:Label ID="lbl_session1_endtime" runat="server" Text="Label"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <table>
                            <tr>
                                <td colspan="3" align="center">Session-II
                                </td>
                            </tr>
                            <tr>
                                <td align="center" style="width: 38%">Start Time
                                </td>
                                <td align="center" style="width: 2%">:
                                </td>
                                <td align="center" style="width: 60%">
                                    <asp:Label ID="lbl_session2_starttime" runat="server" Text="Label"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="center">End Time
                                </td>
                                <td>:
                                </td>
                                <td align="center">
                                    <asp:Label ID="lbl_session2_endtime" runat="server" Text="Label"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>

            <table width="100%">
                <tr>
                    <td align="center" style="width: 38%">Is Holiday
                    </td>
                    <td style="width: 2%" align="center">:
                    </td>
                    <td style="width: 60%" align="center">
                        <asp:Label ID="lbl_isholiday" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
            </table>
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

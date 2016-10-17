<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Appointment_Schedule.aspx.cs"
    Theme="Default" Inherits="UI_Appointment_Appointment_Schedule" %>

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
    <style type="text/css">
    .row_In:hover
    {
            background-color:#E9F28C;    
    }
    </style>
    <script type="text/javascript">

        $(document).ready(function () {
            fn_FilColorScheme_AppointmentDate();
        });
        function fn_FilColorScheme_AppointmentDate() {
            var lnk_Resch;
            var lnk_cancle;

            var $row = $("#grd_AppoSchedule").find("tr");
            var scrollToE;
            for (var i = 1; i < $row.length; i++) {
                
                if ($row[i].cells[1].innerHTML == "&nbsp;") {

                    $($row[i]).removeClass('row');
                    $($row[i]).addClass('row_In');
                }

            }
//            $("#dv_patientQueue").scrollTo(scrollToE, 800);
        }
        function fn_AddAppointment() {
            $.colorbox({ href: "../PatientManagement/Patient_Registration_POPUP.aspx",
                iframe: true, width: "50% ", height: "75%", transition: "none",
                onClosed: function () { fn_RefreshPage(); }
            });
        }
        function fn_EditAppointment(id) {
            // alert(id);

            $.colorbox({ href: "../PatientManagement/Patient_Registration_POPUP.aspx?id=" + id,
                iframe: true, width: "50% ", height: "75%", transition: "none",
                onClosed: function () { fn_RefreshPage(); }
            });
        }

        function fn_RefreshPage() {

            __doPostBack('imgBtn_Refresh', '');

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
       <div style="max-height: 600px; width: 100%; overflow: auto">
                        <asp:GridView ID="grd_AppoSchedule" ShowHeaderWhenEmpty="true" runat="server" AutoGenerateColumns="false"
                            RowStyle-CssClass="row" CssClass="mGrid" PagerStyle-CssClass="pgr" CellPadding="4"
                            GridLines="None">
                            <Columns>
                                <asp:TemplateField HeaderText="Appointment Date" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lbl_AppoTime" Text='<%#Eval("AppoDate")%>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField HeaderText="PK_PostQueueID" HeaderStyle-CssClass="HideColumn" ItemStyle-CssClass="HideColumn"
                                    FooterStyle-CssClass="HideColumn" DataField="PK_PostQueueID" />
                                <asp:BoundField HeaderText="FK_AppointmentID" HeaderStyle-CssClass="HideColumn" ItemStyle-CssClass="HideColumn"
                                    FooterStyle-CssClass="HideColumn" DataField="FK_AppointmentID" />
                                <asp:BoundField HeaderText="FK_PatientID" HeaderStyle-CssClass="HideColumn" ItemStyle-CssClass="HideColumn"
                                    FooterStyle-CssClass="HideColumn" DataField="FK_PatientID" />
                                <asp:BoundField HeaderText="TockenID" DataField="TockenID" />
                                <asp:BoundField HeaderText="FullName" DataField="FullName" />
                                <asp:BoundField HeaderText="NextTockenId" DataField="NextTockenId" />
                                <asp:BoundField HeaderText="NEW/OLD" DataField="NewOld" />
                                <asp:BoundField HeaderText="LOCAL/OUT" DataField="LocalOut" />
                                <asp:BoundField HeaderText="Appo.Time" DataField="ApproxInTime" />
                                <asp:TemplateField HeaderText="#" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                          <asp:Label runat="server" ID="lbl_AppoEdit" Text='<%#Eval("LinkEdit")%>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="#"  ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                         <asp:Label runat="server" ID="lbl_AppoCancel" Text='<%#Eval("LinkCancel")%>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
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
                        </asp:GridView>
                    </div>
    </div>
    <!--#####################################################################################################-->
    <!--########################################## FOOTER SEACTION ##########################################-->
     <asp:UpdatePanel ID="UpdatePanel1" runat="server">
     <ContentTemplate>
          <UC:UC_Footer ID="uc_footer1" LogoURL="../Image/ICS.PNG" runat="server" />
    </ContentTemplate>
    </asp:UpdatePanel>
    <!--#####################################################################################################-->
   
    <input type="hidden" id="hdflag" runat="server" />
    <input type="hidden" id="hdPrint" runat="server" />
    </form>
</body>
</html>

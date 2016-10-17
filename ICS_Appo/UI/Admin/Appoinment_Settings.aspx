<%@ Page Language="C#" AutoEventWireup="true" Theme="Default" CodeFile="Appoinment_Settings.aspx.cs" Inherits="UI_Admin_Appoinment_Settings" %>

<%@ Register TagName="UC_Header" TagPrefix="UC" Src="~/UC_Header_New.ascx" %>
<%@ Register TagName="UC_FormName" TagPrefix="UC" Src="~/UC_PageHeaderInfo.ascx" %>
<%@ Register TagName="UC_ErrorName" TagPrefix="UC" Src="~/UC_ErrorMessageInfo.ascx" %>
<%@ Register TagName="UC_Footer" TagPrefix="UC" Src="~/UC_Footer.ascx" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
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

    <script type="text/javascript">
        $(function () {
            $("[class$='Time']").timeEntry();
            $("[class$='Time']").timeEntry({
                show24Hours: true,
                showSeconds: true,
                spinnerImage: "spinnerSquare.png",
                spinnerSize: [10, 10, 0],
                spinnerBigSize: [30, 30, 0],
                timeSteps: [1, 5, 1],
            });
        });
        //         http: //keith-wood.name/timeEntry.html
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
            <table align="left" width="100%">
                                <tr>
                                    <td class="style1"></td>
                                    <td class="style2">
                                        <asp:Label ID="lblWorkingDays" Text="Holidays Settings" CssClass="label_Header" runat="server"></asp:Label>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td class="style1"></td>
                                    <td class="style2" align="center">
                                        <table style="width: 80%">
                                            <tr>

                                                <td>
                                                    <asp:CheckBox ID="cbSun" Text="Sunday" runat="server" />
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="cbMon" Text="Monday" runat="server" />
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="cbTues" Text="Tuesday" runat="server" />
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="cbWed" Text="Wednesday" runat="server" />
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="cbThur" Text="Thursday" runat="server" />
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="cbFri" Text="Friday" runat="server" />
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="cbSat" Text="Saturday" runat="server" />
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="cbToday" Text="Today" runat="server" />
                                                </td>
                                                <td></td>
                                                <td>
                                                    <asp:Button ID="btnWorking_Days_Setting_Save" runat="server" Text="Save"
                                                        OnClick="btnWorking_Days_Setting_Save_Click" CssClass="Button_Normal"
                                                        Width="100px" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>&nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1">&nbsp;
                                    </td>
                                    <td align="left" class="style2">
                                        <asp:Label ID="lblOffice_Timing" runat="server" CssClass="label_Header" Text="Office Timing"></asp:Label>
                                    </td>
                                    <td align="left">&nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1"></td>
                                    <td align="left" class="style2">
                                        <asp:GridView ID="grd_SessionSetting" runat="server" AutoGenerateColumns="False"
                                            DataKeyNames="ID" OnRowCommand="grd_SessionSetting_RowCommand" OnRowDataBound="grd_SessionSetting_RowDataBound"
                                            OnRowEditing="grd_SessionSetting_RowEditing" OnRowUpdating="grd_SessionSetting_RowUpdating"
                                            CellPadding="4" GridLines="None" OnRowCancelingEdit="grd_SessionSetting_RowCancelingEdit"
                                            RowStyle-CssClass="row" CssClass="mGrid" PagerStyle-CssClass="pgr" OnSelectedIndexChanged="grd_SessionSetting_SelectedIndexChanged">
                                            <Columns>
                                                <asp:TemplateField HeaderText="ID" HeaderStyle-CssClass="HideColumn" ItemStyle-CssClass="HideColumn"
                                                    FooterStyle-CssClass="HideColumn">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_ID_n" Text='<%#Eval("ID")%>'></asp:Label>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_ID_e" Text='<%#Eval("ID")%>'></asp:Label>
                                                    </EditItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Day" HeaderStyle-CssClass="HideColumn" ItemStyle-CssClass="HideColumn"
                                                    FooterStyle-CssClass="HideColumn">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_dayid_n" Text='<%#Eval("Session_Day")%>'></asp:Label>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_dayid_e" Text='<%#Eval("Session_Day")%>'></asp:Label>
                                                    </EditItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Day" ItemStyle-Width="100px" HeaderStyle-Width="100px">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_day_n" Text='<%#Eval("work_Day")%>'></asp:Label>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_day_e" Text='<%#Eval("work_Day")%>'></asp:Label>
                                                    </EditItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Holiday" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="50px"
                                                    HeaderStyle-Width="50px">
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="chk_Holiday" runat="server" Width="40px" Checked='<%#Eval("IsHoliday")%>'
                                                            Enabled="false" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Session-I Start" ItemStyle-Width="110px" HeaderStyle-Width="110px">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_Session1_Start" Text='<%#Eval("Session1_Start")%>'></asp:Label>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:TextBox runat="server" ID="txt_Session1_Start" CssClass="Time" Width="80px"
                                                            Text='<%#Eval("Session1_Start")%>' ClientIDMode="Static"></asp:TextBox>
                                                    </EditItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Session-I End" ItemStyle-Width="110px" HeaderStyle-Width="110px">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_Session1_end" Text='<%#Eval("Session1_End")%>'></asp:Label>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:TextBox runat="server" ID="txt_Session1_end" CssClass="Time" Width="80px" Text='<%#Eval("Session1_End")%>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Session-II Start" ItemStyle-Width="110px" HeaderStyle-Width="110px">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_Session2_Start" Text='<%#Eval("Session2_Start")%>'></asp:Label>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:TextBox runat="server" ID="txt_Session2_Start" CssClass="Time" Width="80px"
                                                            Text='<%#Eval("Session2_Start")%>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Session-II End" ItemStyle-Width="110px" HeaderStyle-Width="110px">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_Session2_end" Text='<%#Eval("Session2_End")%>'></asp:Label>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:TextBox runat="server" ID="txt_Session2_end" CssClass="Time" Width="80px" Text='<%#Eval("Session2_End")%>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Patient Limit" ItemStyle-Width="100px" HeaderStyle-Width="100px">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_Patient_Limit" Text='<%#Eval("DailyPatientLimit")%>'></asp:Label>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:TextBox runat="server" ID="txt_Patient_Limit" Width="100px" Text='<%#Eval("DailyPatientLimit")%>' CssClass="TextBox_Normal"></asp:TextBox>
                                                    </EditItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Time Limit" ItemStyle-Width="110px" HeaderStyle-Width="110px">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_Time_Limit" Text='<%#Eval("DailyTimeLimit")%>'></asp:Label>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:TextBox runat="server" ID="txt_Time_Limit" Width="80px" Text='<%#Eval("DailyTimeLimit")%>' CssClass="Time"></asp:TextBox>
                                                    </EditItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField HeaderText="Flag" DataField="FLAG" HeaderStyle-CssClass="HideColumn"
                                                    ItemStyle-CssClass="HideColumn" FooterStyle-CssClass="HideColumn" />
                                                <asp:TemplateField HeaderText="Limit" ItemStyle-Width="110px" HeaderStyle-Width="110px">
                                                    <ItemTemplate>
                                                        <asp:DropDownList ID="drp_flag" runat="server">
                                                            <asp:ListItem Value="0" Text="None"></asp:ListItem>
                                                            <asp:ListItem Value="1" Text="Patient"></asp:ListItem>
                                                            <asp:ListItem Value="2" Text="Time"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:CommandField ShowEditButton="true" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px"
                                                    HeaderStyle-Width="100px" />
                                            </Columns>
                                            <RowStyle CssClass="row"></RowStyle>

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
                                    </td>
                                    <td align="left">&nbsp;
                                    </td>
                                </tr>

                                <tr>
                                    <td class="style1">&nbsp;
                                    </td>
                                    <td align="left" class="style2">
                                        <asp:Label ID="lblAppointment_Limit" runat="server" Text="Appointment Limit(in Min) & Fees Settings"
                                            CssClass="label_Header"></asp:Label>
                                    </td>
                                    <td align="left">&nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1"></td>
                                    <td align="left" class="style2">
                                        <table style="margin-left: 100px">
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblBlock_Time_New_Patient" Text="New Patient" runat="server"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtBlock_Time_New_Patient" validation="Int" runat="server" CssClass="TextBox_Normal"></asp:TextBox>
                                                </td>
                                                <td></td>
                                                <td>
                                                    <asp:Label ID="lbl_New_Patient_Fees" Text="New Patient Fees" runat="server"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_New_Patient_Fees" validation="Double" runat="server" CssClass="TextBox_Normal"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:Button ID="btnAppoint_Limit_Setting_Save" runat="server" Text="Save"
                                                        OnClick="btnAppoint_Limit_Setting_Save_Click" CssClass="Button_Normal"
                                                        Width="100px" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblBlock_Time_Old_Patient" Text="Old Patient" runat="server"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtBlock_Time_Old_Patient" validation="Int" runat="server" CssClass="TextBox_Normal"></asp:TextBox>
                                                </td>
                                                <td></td>
                                                <td>
                                                    <asp:Label ID="lbl_Old_Patient_Fees" Text="Old Patient Fees" runat="server"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_Old_Patient_Fees" validation="Double" runat="server" CssClass="TextBox_Normal"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:Button ID="btnBlock_Time_Clear" runat="server" Text="Clear"
                                                        CssClass="Button_Normal" Width="100px" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td align="left"></td>
                                </tr>
                                <tr>
                                    <td class="style1">&nbsp;
                                    </td>
                                    <td align="left" class="style2">
                                        <asp:Label ID="Label1" runat="server" Text="Priority Settings"
                                            CssClass="label_Header"></asp:Label>
                                    </td>
                                    <td align="left">&nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>
                                        <asp:GridView ID="grd_Priority_Setting" DataKeyNames="PriorityID" runat="server"
                                            AutoGenerateColumns="False" OnRowCancelingEdit="grd_Priority_Setting_RowCancel"
                                            OnRowEditing="grd_Priority_Setting_Edit" OnRowUpdating="grd_Priority_Setting_Update"
                                            OnSelectedIndexChanged="grd_Priority_Setting_SelectedIndexChanged" CellPadding="4"
                                            GridLines="None" OnRowDataBound="grd_Priority_Setting_RowDataBound" RowStyle-CssClass="row"
                                            CssClass="mGrid" PagerStyle-CssClass="pgr">
                                            <Columns>
                                                <asp:TemplateField HeaderText="ID" HeaderStyle-CssClass="HideColumn" ItemStyle-CssClass="HideColumn"
                                                    FooterStyle-CssClass="HideColumn">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblPriority_ID" Text='<%#Eval("PriorityID") %>' runat="server"></asp:Label>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:Label ID="lblPriority_ID1" Text='<%#Eval("PriorityID") %>' runat="server"></asp:Label>
                                                    </EditItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Day" HeaderStyle-CssClass="HideColumn" ItemStyle-CssClass="HideColumn"
                                                    FooterStyle-CssClass="HideColumn">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblPriority_Day" Text='<%#Eval("Priority_Day") %>' runat="server"></asp:Label>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:Label ID="lblPriority_Day1" Text='<%#Eval("Priority_Day") %>' runat="server"></asp:Label>
                                                    </EditItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Day" ItemStyle-Width="130px" HeaderStyle-Width="130px">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblWorkDay" Text='<%#Eval("Work_Day") %>' runat="server"></asp:Label>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:Label ID="lblWorkDay1" Text='<%#Eval("Work_Day") %>' runat="server"></asp:Label>
                                                    </EditItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Holiday" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="50px"
                                                    HeaderStyle-Width="50px">
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="cbPriority_Holiday" Checked='<%#Eval("IsHoliday") %>' runat="server"
                                                            Width="40px" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Priority From" ItemStyle-Width="110px" HeaderStyle-Width="110px">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblStart_After" Text='<%#Eval("Start_After") %>' runat="server"></asp:Label>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="txtStart_After" CssClass="Time" Text='<%#Eval("Start_After") %>' Width="80px"
                                                            runat="server"></asp:TextBox>
                                                    </EditItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Appointment After" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="130px" HeaderStyle-Width="130px">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblAppoint_After" Text='<%#Eval("Appoint_After") %>' runat="server"></asp:Label>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="txtAppoint_After" Text='<%#Eval("Appoint_After") %>' runat="server" CssClass="TextBox_Normal"></asp:TextBox>
                                                    </EditItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField HeaderText="PriorityTo" HeaderStyle-CssClass="HideColumn" ItemStyle-CssClass="HideColumn"
                                                    FooterStyle-CssClass="HideColumn" DataField="Priority_To" />
                                                <asp:TemplateField HeaderText="Priority To" ItemStyle-Width="110px" HeaderStyle-Width="110px">
                                                    <ItemTemplate>
                                                        <asp:DropDownList ID="cmbPriority_To" runat="server">
                                                            <asp:ListItem Text="None" Value="2"></asp:ListItem>
                                                            <asp:ListItem Text="Local" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="OutSide" Value="0"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Reschedule After" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="130px" HeaderStyle-Width="130px">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblReschedule_After" Text='<%#Eval("Reschedule_After") %>' runat="server"></asp:Label>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="txtReschedule_After" Text='<%#Eval("Reschedule_After") %>' runat="server" Width="130px" CssClass="TextBox_Normal"></asp:TextBox>
                                                    </EditItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Cancel After" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="130px" HeaderStyle-Width="130px">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCancel_After" Text='<%#Eval("Cancel_After") %>' runat="server"></asp:Label>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="txtCancel_After" Text='<%#Eval("Cancel_After") %>' Width="130px" runat="server" CssClass="TextBox_Normal"></asp:TextBox>
                                                    </EditItemTemplate>
                                                </asp:TemplateField>
                                                <asp:CommandField ShowEditButton="true" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px"
                                                    HeaderStyle-Width="100px" />
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
                                    </td>
                                    <td></td>
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

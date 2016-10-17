<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UC_Header_New.ascx.cs" Inherits="UC_Header_New" %>
    
<div class="Div_Header">
    <table style="width: 100%">
        <tr>
            <td>
                <div style="float: left;">
                    <asp:Image ID="Image1" Width="220px" Height="50px" runat="server" ImageUrl="~/Image/Logo_ICON copy.png" />
                </div>
            </td>
            <td>
                <div style="float: right;margin-right:10px;" id="dv_UserInfo" runat="server">
                    <table style="width: 100%">
                        <tr>
                            <td rowspan="2">
                                <asp:Image ID="img_UserImage" Width="50px" CssClass="Image_UserPic" Height="50px" runat="server" ImageUrl="~/Data_Upload/default_user.png" />
                            </td>
                            <td rowspan="2" style="width: 5px;">
                                <div class="Div_Seperator" style="height: 50px;">
                                    &nbsp;
                                </div>
                            </td>
                            <td colspan="5">
                                <asp:Label runat="server" Text="" ID="Lbl_LoginUser" CssClass="Label_LoginUser"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="LinkText_Bold" PostBackUrl="~/UI/Home.aspx" Text="Home"></asp:LinkButton>
                            </td>
                            <td style="width: 5px;">
                                <asp:Label ID="Label1" runat="server" Text="|" CssClass="Label_Bold"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:LinkButton ID="LinkButton2" CssClass="LinkText_Bold" runat="server" PostBackUrl="~/UI/FrmMP_ProfileEdit_AddEdit.aspx" Text="Profile"></asp:LinkButton>
                            </td>
                            <td style="width: 5px;">
                                <asp:Label ID="Label2" runat="server" Text="|" CssClass="Label_Bold"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:LinkButton ID="LinkButton3" runat="server" CssClass="LinkText_Bold" ForeColor="Red" PostBackUrl="~/login.aspx?Logout=true" Text="Logout"></asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
        <tr>
            
                <td colspan="2">
                 
                </td>
         
        </tr>
        
    </table>
    <div id="dv_Menu" runat="server" style="background-color: #172322; width: 100%; position: fixed;margin-top:5px;
        top: 60px;">
        <!-- Beginning of compulsory code below -->
        <ul id="nav" runat="server" style="width: 100%; margin-left: 15px;" class="dropdown dropdown-horizontal">
            <li class="dir">Appointment
                <ul>
                    <li class="first"><a ID="a" href="<%= Page.ResolveUrl("~/UI/Appointment/appointment_patientQueue.aspx")%>">Patient Queue</a></li>
                    <li><a ID="b" href="<%= Page.ResolveUrl("~/UI/PatientManagement/Frm_Status_Queue.aspx")%>">Status Queue</a></li>
                     <li class="last"><a ID="c" href="<%= Page.ResolveUrl("~/UI/Appointment/appointment_todaysSchedule.aspx")%>">Todays Schedule</a></li>
                </ul>
            </li>
            <li class="dir">Patient Management
                <ul>
                    <li class="first"><a id="A1" href="<%= Page.ResolveUrl("~/UI/PatientManagement/Frm_PatientSearch.aspx")%>">Patient Search</a></li>
                    <li class="last"><a id="A2" href="<%= Page.ResolveUrl("~/UI/PatientManagement/Frm_PatientAddEdit.aspx")%>">Patient Add/Edit</a></li>
                </ul>
            </li>

            <li class="dir">Configuration
                <ul>
                    <li class="first"><a ID="d" href="<%= Page.ResolveUrl("~/UI/Admin/CommonSettings.aspx")%>">Common Settings</a></li>
                    <li class="last"><a ID="e"  href="<%= Page.ResolveUrl("~/UI/Admin/Appoinment_Settings.aspx")%>">Appo Settings</a></li>
                </ul>
            </li>
              
             <li><a href="#" class="dir">Report</a>
                <ul>
                    <li  class="first"><a href="#" class="dir">Appointmet</a>
                        <ul>
                            <li class="first"><a ID="f"   href="<%= Page.ResolveUrl("~/UI/Report/Report_DailyAppointment.aspx?flag=2")%>"> Daily</a></li>
                            <li><a ID="g"   href="<%= Page.ResolveUrl("~/UI/Report/Report_MonthlyAppointment.aspx?flag=1")%>"> Monthly</a></li>
                            <li class="last"><a ID="h"   href="<%= Page.ResolveUrl("~/UI/Report/Report_YearlyAppointment.aspx?flag=1")%>">Yearly</a> </li>
                        </ul>
                    </li>
                    <li class="last"><a href="#" class="dir">Collection</a>
                        <ul>
                            <li class="first"><a ID="i"    href="<%= Page.ResolveUrl("~/UI/Appointment/Appointment_TodaysSummary.aspx?flag=1")%>">Today</a></li>
                            <li><a ID="j" href="<%= Page.ResolveUrl("~/UI/Appointment/Appointment_TodaysSummary.aspx?flag=2")%>">Previous</a></li>
                            <li class="last"><a ID="k" href="<%= Page.ResolveUrl("~/UI/Report/Frm_Gross_Report.aspx")%>">Gross</a></li>
                        </ul>
                    </li>
                </ul>
            </li>

             <li class="dir">Help
                <ul>
                    <li class="first"><a  runat="server"  href="../UI/FrmMP_Guruji_AddEdit.aspx">Add</a></li>
                    <li><a  runat="server"  href="../UI/FrmMP_Guruji_Search.aspx">Edit/View</a></li>
                    <li class="last"><a  runat="server"  href="./">Check Status</a></li>
                </ul>
            </li>

        </ul>
        <!-- / END -->
    </div>
</div>

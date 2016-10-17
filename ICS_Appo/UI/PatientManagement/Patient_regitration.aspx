<%@ Page Language="C#" AutoEventWireup="true" Theme="Default" CodeFile="Patient_regitration.aspx.cs"
    Inherits="UI_PatientManagement_Patient_Appointment_Birla_Hosp" %>

<%@ Register TagName="UC_ErrorName" TagPrefix="UC" Src="~/UC_ErrorMessageInfo.ascx" %>
<%@ Register TagName="UC_Header" TagPrefix="UC" Src="~/UC_Header_New.ascx" %>
<%@ Register TagName="UC_Footer" TagPrefix="UC" Src="~/UC_Footer.ascx" %>
<%@ Register TagName="UC_FormName" TagPrefix="UC" Src="~/UC_PageHeaderInfo.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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

    <style type="text/css">
     
input[type=radio] + label {
    display:inline-block;
    margin:-2px;
    padding: 4px 12px;
    margin-bottom: 0;
    font-size: 14px;
    line-height: 20px;
    color: #333;
    text-align: center;
    text-shadow: 0 1px 1px rgba(255,255,255,0.75);
    vertical-align: middle;
    cursor: pointer;
    background-color: #f5f5f5;
    background-image: -moz-linear-gradient(top,#fff,#e6e6e6);
    background-image: -webkit-gradient(linear,0 0,0 100%,from(#fff),to(#e6e6e6));
    background-image: -webkit-linear-gradient(top,#fff,#e6e6e6);
    background-image: -o-linear-gradient(top,#fff,#e6e6e6);
    background-image: linear-gradient(to bottom,#fff,#e6e6e6);
    background-repeat: repeat-x;
    border: 1px solid #ccc;
    border-color: #e6e6e6 #e6e6e6 #bfbfbf;
    border-color: rgba(0,0,0,0.1) rgba(0,0,0,0.1) rgba(0,0,0,0.25);
    border-bottom-color: #b3b3b3;
    filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffffff',endColorstr='#ffe6e6e6',GradientType=0);
    filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
    -webkit-box-shadow: inset 0 1px 0 rgba(255,255,255,0.2),0 1px 2px rgba(0,0,0,0.05);
    -moz-box-shadow: inset 0 1px 0 rgba(255,255,255,0.2),0 1px 2px rgba(0,0,0,0.05);
    box-shadow: inset 0 1px 0 rgba(255,255,255,0.2),0 1px 2px rgba(0,0,0,0.05);
}
 
input[type=radio]:checked + label {
       background-image: none;
        outline: 0;
    -webkit-box-shadow: inset 0 2px 4px rgba(0,0,0,0.15),0 1px 2px rgba(0,0,0,0.05);
    -moz-box-shadow: inset 0 2px 4px rgba(0,0,0,0.15),0 1px 2px rgba(0,0,0,0.05);
    box-shadow: inset 0 2px 4px rgba(0,0,0,0.15),0 1px 2px rgba(0,0,0,0.05);
        background-color:#e0e0e0;
}
        
    </style>

    <title></title>
    <%--//....................    IMP     http: //keith-wood.name/timeEntry.html....................................//////////////--%>
    <script type="text/javascript">

        function fn_clear() {
            document.forms[0].reset();
            return false;
        }

        function validation() {
            document.getElementById("txt_appointmentDate").style.backgroundColor = "white";
            document.getElementById("txtPatient_Name").style.backgroundColor = "white";
            if (document.getElementById("txtPatient_Name").value == "") {
                alert("Pleas Enter Name Firsrt");
                document.getElementById("txtPatient_Name").focus();
                document.getElementById("txtPatient_Name").style.backgroundColor = "red";
                return false;
            }
            if (document.getElementById("txt_appointmentDate").value == "") {
                alert("Please Enter Date");
                document.getElementById("txt_appointmentDate").focus();
                document.getElementById("txt_appointmentDate").style.backgroundColor = "red";
                return false;
            }

            return true;
        }
    </script>
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

        });

   
    </script>
    <script type="text/javascript">
    $(function () {
    $("#txt_appointmentTime").timeEntry();
       $("#txt_appointmentTime").timeEntry({
                 show24Hours: true,
                 showSeconds: true,
                 spinnerImage: "spinnerSquare.png",
                 spinnerSize: [20, 20, 0], 
                 spinnerBigSize: [40, 40, 0],
                 timeSteps: [1, 5, 1]
                 //,minTime: '08:30AM', maxTime: '05:30PM' 
            });
         });
//         http: //keith-wood.name/timeEntry.html
    </script>

    <style type="text/css">
        .style2
        {
            width: 108px;
        }
        .style3
        {
            width: 16px;
        }
        .style4
        {
            width: 94px;
        }
        .style5
        {
            width: 278px;
        }
        .style6
        {
            width: 6px;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="sc_mgr" runat="server">
        <Scripts>
            <asp:ScriptReference ScriptMode="Auto" Path="~/JS/PageLock_UP.js" />
        </Scripts>
    </asp:ScriptManager>
    <div id="dv_mainBackground" class="MainBackgroundScreen">
        <table class="Table_MainTable" cellspacing="0" cellpadding="0">
            <tr class="Row_Header">
                <td class="Row_Header">
                    <UC:UC_Header ID="uc_header" ShowModule="true" runat="server" />
                </td>
            </tr>
            <tr style="height: 25px">
                <td>
                    <UC:UC_FormName ID="uc_FormName" FormName="" runat="server" />
                </td>
            </tr>
            <tr>
                <td valign="top" align="center">
                <div class="Div_PatientAdd">
                    <table class="" cellpadding="5px" style="margin-top:20px;">
                        <tr>
                            <td align="left">
                                <asp:Label ID="lblPatient_Name" Text="Patient Name" runat="server"></asp:Label>
                            </td>
                            <td class="style6" align="center">
                                <asp:Label ID="lblPatient_Name0" Text=":" runat="server"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtPatient_Name" CssClass="TextBox_Normal" runat="server" Width="228px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="lblLocality" Text="Locality" runat="server"></asp:Label>
                            </td>
                            <td class="style6" align="center">
                                <asp:Label ID="lblPatient_Name1" Text=":" runat="server"></asp:Label>
                            </td>
                            <td>
                                <table>
                                    <tr>
                                        <td>
                                            <asp:RadioButton ID="rdo_local" GroupName="isLocal" runat="server" Text="Localite" Checked="true"/>
                                        </td>
                                        <td>
                                            <asp:RadioButton ID="rdo_outside" GroupName="isLocal" runat="server" Text="Outside" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                           <td align="left">
                                <asp:Label ID="lblPatient_Type" Text="Patient Type" runat="server"></asp:Label>
                            </td>
                            <td class="style6" align="center">
                                <asp:Label ID="lblPatient_Name2" Text=":" runat="server"></asp:Label>
                            </td>
                            <td>
                                <table>
                                    <tr>
                                        <td>
                                            <asp:RadioButton ID="rdo_new" GroupName="patientType" runat="server" Text="New" Checked="true"/>
                                        </td>
                                        <td>
                                            <asp:RadioButton ID="rdo_old" GroupName="patientType" runat="server" Text="Old" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                          <td align="left">
                                <asp:Label ID="lblPatient_Type0" runat="server" Text="Appointment Date"></asp:Label>
                            </td>
                            <td class="style6">
                                <asp:Label ID="lblPatient_Name3" runat="server" Text=":"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txt_appointmentDate" runat="server" Width="228px" CssClass="TextBox_Normal"></asp:TextBox>
                                <%--     <asp:TextBox ID="TextBox1" runat="server" Width="228px"></asp:TextBox>--%>
                            </td>
                        </tr>
                        <tr><td align="left">
                                <asp:Label ID="Label1" runat="server" Text="Appointment Time"></asp:Label>
                            </td>
                            <td class="style6">
                                <asp:Label ID="Label2" runat="server" Text=":"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txt_appointmentTime" runat="server" Width="228px" CssClass="TextBox_Normal"></asp:TextBox>
                                
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <asp:UpdatePanel ID="up_patientEnt" runat="server">
                                    <ContentTemplate>
                                        <table align="center">
                                            <tr>
                                                <td>
                                                    <asp:Button ID="btn_AppointmentSaveAppoint" runat="server" CssClass="Button_Normal"
                                                        Text="Save &amp; Appoint" Width="120px" OnClick="btn_AppointmentSaveAppoint_Click"
                                                        OnClientClick="return validation();" />
                                                </td>
                                                <td>
                                                    <asp:Button ID="btnAppontment_Clear" CssClass="Button_Normal" runat="server" Text="Clear"
                                                        Width="88px" OnClick="btnAppontment_Clear_Click" />
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                    </table>
                    </div>
                </td>
            </tr>
            <tr>
                <td align="center" valign="top">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <table class="Table_patientTocken" style="width: 530px;" 
                                cellpadding="5px" style="margin-top: 20px;">
                                <tr>
                                    <td align="left" class="style2">
                                        <asp:Label ID="Label5" runat="server" CssClass="label_Header" Text="Token No"></asp:Label>
                                    </td>
                                    <td align="left" colspan="3">
                                        <asp:Label ID="Label9" runat="server" CssClass="label_Header" Text="Appointment Information"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" valign="middle" class="style2" rowspan="3">
                                    
                                    <div class="DIV_patientTocken" style="width:100px;height:100px;">
                                       <table class="Table_Full"><tr><td valign="middle" align="center">
                                        <asp:Label ID="lbl_INFO_TockenNo" runat="server" CssClass="Label_TockenNo" Text=""></asp:Label>
                                       </td></tr></table>
                                       
                                       
                                        </div>
                                    </td>
                                    <td align="left" class="style4">
                                        <asp:Label ID="Label12" runat="server" Text="Patient ID"></asp:Label>
                                    </td>
                                    <td class="style3" align="center">
                                        <asp:Label ID="Label13" Text=":" runat="server"></asp:Label>
                                    </td>
                                    <td class="style5" align="left">
                                        <asp:Label ID="lbl_INFO_PatientId" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" class="style4">
                                        <asp:Label ID="Label3" runat="server" Text="Patient Name"></asp:Label>
                                    </td>
                                    <td class="style3" align="center">
                                        <asp:Label ID="Label4" Text=":" runat="server"></asp:Label>
                                    </td>
                                    <td class="style5" align="left">
                                        <asp:Label ID="lbl_INFO_Patientname" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" class="style4">
                                        <asp:Label ID="Label14" runat="server" Text="Appo.Date"></asp:Label>
                                    </td>
                                    <td class="style3" align="center">
                                        <asp:Label ID="Label15" Text=":" runat="server"></asp:Label>
                                    </td>
                                    <td class="style5" align="left">
                                        <asp:Label ID="lbl_INFO_appoDate" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" class="style2">
                                        &nbsp;</td>
                                    <td align="left" class="style4">
                                        <asp:Label ID="Label7" runat="server" Text="Approx. Time"></asp:Label>
                                    </td>
                                    <td class="style3" align="center">
                                        <asp:Label ID="Label8" Text=":" runat="server"></asp:Label>
                                    </td>
                                    <td class="style5" align="left">
                                        <asp:Label ID="lbl_INFO_appTime" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" class="style2">
                                        &nbsp;</td>
                                    <td align="left" class="style4">
                                        <asp:Label ID="Label10" runat="server" Text="Fees"></asp:Label>
                                    </td>
                                    <td class="style3" align="center">
                                        <asp:Label ID="Label11" Text=":" runat="server"></asp:Label>
                                    </td>
                                    <td class="style5" align="left">
                                        <asp:Label ID="lbl_INFO_fees" runat="server"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btn_AppointmentSaveAppoint" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr style="height: 25px">
                <td>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <UC:UC_ErrorName ID="uc_error" runat="server" ErrorMessage="* marked fields are mandetory" />
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btn_AppointmentSaveAppoint" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr class="Row_Footer">
                <td class="Row_Footer">
                    <UC:UC_Footer ID="uc_footer" LogoURL="../../Image/ICS.PNG" runat="server" />
                </td>
                
            </tr>
        </table>
    </div>
    <asp:HiddenField ID="MSG" runat="server" Value="Patient Information Saving....!" />
    </form>
</body>
</html>

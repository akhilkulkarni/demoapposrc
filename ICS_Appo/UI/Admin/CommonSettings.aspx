<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CommonSettings.aspx.cs" Theme="Default" Inherits="UI_Admin_CommonSettings" %>

<%@ Register TagName="UC_ErrorName" TagPrefix="UC" Src="~/UC_ErrorMessageInfo.ascx" %>
<%@ Register TagName="UC_Header" TagPrefix="UC" Src="~/UC_Header_New.ascx" %>
<%@ Register TagName="UC_Footer" TagPrefix="UC" Src="~/UC_Footer.ascx" %>
<%@ Register TagName="UC_FormName" TagPrefix="UC" Src="~/UC_PageHeaderInfo.ascx" %>
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
                timeSteps: [1, 5, 1],
            });
        });
        //         http: //keith-wood.name/timeEntry.html
    </script>
    <script language="javascript" type="text/javascript">
        $(document).ready(function () {
            $(".iframe").colorbox({ iframe: true, width: "80%", height: "80%" });

            $("#click").click(function () {
                $('#click').css({ "background-color": "#416CE5", "color": "#526CE5", "cursor": "inherit" }).text("Open this window again and this message will still be here.");
                return false;
            });


            //        $("#btnAppontment_Clear").click(function ()
            //        {
            //            $.colorbox({ 
            //                  iframe: true, 
            //                   width: "80%", 
            //                  height: "80%", 
            //              transition: "fade" 
            //                        });
            //         });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="sc_mgr" runat="server">
            <Scripts>
                <asp:ScriptReference ScriptMode="Auto" Path="~/JS/PageLock_UP.js" />
                  <asp:ScriptReference Path="~/JS/ASYNC_Postback/Async_Callback_JS.js" />
            </Scripts>
        </asp:ScriptManager>
           
    <!--########################################## HEADER SEACTION ##########################################-->
        <UC:UC_Header ID="uc_header1" MenuShow="true" UserInfoShow="true" runat="server" />
    <!--#####################################################################################################-->
    <!--########################################## BODY SEACTION ############################################-->
    <div class="Div_MainPage">
           <table class="" cellpadding="5px" style="margin-top: 20px;">
                                <tr>
                                    <td align="left">
                                        <asp:Label ID="lblPatient_Name" Text="Theme" runat="server"></asp:Label>
                                    </td>
                                    <td class="style1" align="center">
                                        <asp:Label ID="lblPatient_Name0" Text=":" runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="drp_themeList" CssClass="DropDown_Normal" runat="server" Width="200px">
                                        </asp:DropDownList>
                                    </td>
                                    <td class="style1" align="center">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <asp:Label ID="lblPatient_Type" Text="Old Password" runat="server"></asp:Label>
                                    </td>
                                    <td class="style1" align="center">
                                        <asp:Label ID="lblPatient_Name2" Text=":" runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtOldPassword" CssClass="TextBox_Normal" runat="server"
                                            Width="200px" TextMode="Password"></asp:TextBox>
                                    </td>
                                    <td class="style1" align="center">
                                        <asp:Label ID="Label4" Text="*" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <asp:Label ID="lblPatient_Type0" runat="server" Text="New Password"></asp:Label>
                                    </td>
                                    <td class="style1">
                                        <asp:Label ID="lblPatient_Name3" runat="server" Text=":"></asp:Label>
                                    </td>
                                    <td>
                                        <%--     <asp:TextBox ID="TextBox1" runat="server" 
                    Width="228px"></asp:TextBox>--%>
                                        <asp:TextBox ID="txtNewPassword" CssClass="TextBox_Normal" runat="server"
                                            Width="200px" TextMode="Password"></asp:TextBox>
                                    </td>
                                    <td class="style1" align="center">
                                        <asp:Label ID="Label5" Text="*" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <asp:Label ID="Label1" runat="server" Text="Re-enter New Password"></asp:Label>
                                    </td>
                                    <td class="style1">
                                        <asp:Label ID="Label2" runat="server" Text=":"></asp:Label>
                                    </td>
                                    <td>
                                        <%--     <asp:TextBox ID="TextBox1" runat="server" 
                    Width="228px"></asp:TextBox>--%>
                                        <asp:TextBox ID="txtReEnterPassword" CssClass="TextBox_Normal" runat="server"
                                            Width="200px" TextMode="Password"></asp:TextBox>
                                    </td>
                                    <td class="style1" align="center">
                                        <asp:Label ID="Label6" Text="*" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3">
                                        <asp:UpdatePanel ID="up_patientEnt" runat="server">
                                            <ContentTemplate>
                                                <table align="center">
                                                    <tr>
                                                        <td>
                                                            <asp:Button ID="btn_SaveSetting" runat="server" CssClass="Button_Normal"
                                                                Text="Save" Width="100px" OnClick="btn_SaveSetting_Click" />
                                                        </td>
                                                        <td>
                                                            <asp:Button ID="btn_Clear" CssClass="Button_Normal" runat="server" Text="Clear"
                                                                Width="100px" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td colspan="3" align="left">
                                        <asp:Label ID="lblPatient_Name4" CssClass="label_Header" Text="Preview" runat="server"></asp:Label>
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td colspan="3">
                                        <asp:Image ID="Image1" runat="server" Height="135px"
                                            ImageUrl="~/Image/textures-titanium-steel-texture_369486.jpg" Width="250px" />
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>

     <asp:HiddenField ID="MSG" runat="server" Value="Patient Information Saving....!" />
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

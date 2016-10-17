<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Frm_PatientAddEdit.aspx.cs" EnableEventValidation="false" Inherits="UI_PatientManagement_Frm_PatientAddEdit" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="Ajax" %>

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
    <script src="<%# Page.ResolveUrl("~/JS/JQueryValidator.js")%>" type="text/javascript"></script>


    <%-- MENU CSS--%>
    <link href="<%# Page.ResolveUrl("~/CSS/MainCommon.css")%>" rel="stylesheet" type="text/css" />
    <link href="<%# Page.ResolveUrl("~/css/dropdown/dropdown.css")%>" media="screen" rel="stylesheet" type="text/css" />
    <link href="<%# Page.ResolveUrl("~/css/dropdown/themes/vimeo.com/default.advanced.css")%>" media="screen" rel="stylesheet" type="text/css" />
    <%-- MENU CSS--%>
    <link href="<%# Page.ResolveUrl("~/CSS/DateControl.css")%>" rel="stylesheet" type="text/css" />

    <title></title>
    <%--//....................    IMP     http: //keith-wood.name/timeEntry.html....................................//////////////--%>


    <script type="text/javascript">

        function fn_validate() {
            var obj = new JSAM();
            var obj1 = new obj.Reload();

            if (!obj1.fn_Validate_TextBoxData())
                return false;

            if (obj1.fn_ValidateNonEmpty())
                return true
            else {
                alert('Please fill all mandatory fields!!');
                return false;
            }

        }
        $(document).ready(function () {
            Page_FormLoad();
        });

        function Page_FormLoad() {
            var obj_S = new JSAM();
            obj_S.Reload();
            //alert('A');
            //$("# ").mask("9999-999999999");
        }

        function fn_UploadPhoto() {
            var PatientImageName = "PI_" + "<%#Request.QueryString["FK_PatientID"]%>"
            $.colorbox({
                href: "../Common/FrmMP_Common_Upload.aspx?FolderPath=/DataUpload/PatientImage/&FileName=" + PatientImageName,
                iframe: true, width: "50% ", height: "40%",
                onClosed: function () { fn_ReloadPhoto(); }
            });


        }
        $.fn.Fn_GetFilePath = function (FilePath) {
            $("#txt_ImageUrl")[0].value = FilePath;
        };

        function fn_ReloadPhoto() {

            __doPostBack('btn_FileUpload_Reload');

        }
    </script>


</head>
<body>
    <form id="form1" runat="server">
        <Ajax:ToolkitScriptManager ID="sc_mgr" runat="server">
            <Scripts>
                <asp:ScriptReference Path="~/JS/ASYNC_Postback/Async_Callback_JS.js" />
            </Scripts>
        </Ajax:ToolkitScriptManager>

        <!--########################################## HEADER SEACTION ##########################################-->
        <UC:UC_Header ID="uc_header1" MenuShow="true" UserInfoShow="true" runat="server" />
        <!--#####################################################################################################-->
        <!--########################################## BODY SEACTION ############################################-->
        <div class="Div_MainPage">
            <asp:UpdatePanel ID="up" runat="server">
                <ContentTemplate>
                    <asp:Button ID="btn_FileUpload_Reload" runat="server" Text="Button"
                        OnClick="btn_FileUpload_Reload_Click" CssClass="Display_None" />

                    <fieldset class="FieldSet_PageHeader">
                        <table style="width: 100%">
                            <tr>
                                <td align="left" style="white-space: nowrap">
                                    <asp:Label ID="Lbl_PageName" runat="server" CssClass="Label_Bold" Text="Patient Information Add/Edit"></asp:Label>
                                </td>
                                <td align="right">
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:Button ID="btn_Search" CssClass="Button_Normal" runat="server" Text="Search"
                                                    Width="80px" OnClick="btn_Search_Click" />
                                            </td>
                                            <td>
                                                <asp:Button ID="btn_New" CssClass="Button_Normal" runat="server" Text="New" Width="80px"
                                                    OnClick="btn_New_Click" />
                                            </td>
                                            <td>
                                                <asp:Button ID="btn_Save" CssClass="Button_Normal" runat="server" Text="Save" Width="80px"
                                                    OnClientClick="return fn_validate();" OnClick="btn_Save_Click" />
                                            </td>
                                            <td>
                                                <asp:Button ID="btn_Delete" CssClass="Button_Normal" runat="server" Text="Delete"
                                                    Width="80px" OnClick="btn_Delete_Click" />
                                            </td>
                                            <td>
                                                <asp:Button ID="btn_Print" CssClass="Button_Normal" runat="server" Text="Print" Width="80px"
                                                    OnClick="btn_Print_Click" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </fieldset>


                    <Ajax:TabContainer ID="TabContainer1" CssClass="Tab" runat="server">
                        <Ajax:TabPanel runat="server" HeaderText="Patient Information">
                            <HeaderTemplate>
                                <table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <img src="../../Image/PM_Patient.png" width="30px" height="30px" style="margin-right: 2px;" /></td>
                                        <td><span class="Label_Normal">Patient Information</span></td>
                                    </tr>
                                </table>
                            </HeaderTemplate>
                            <ContentTemplate>
                                <fieldset class="FieldSet_WithHeader">
                                    <legend>General Details</legend>
                                    <table style="width: 100%">
                                        <tr>
                                            <td style="width: 20%; vertical-align: top;" align="center" rowspan="6">
                                                <asp:Image ID="img_PatientImage" BackColor="#ffffff" Width="80%" BorderStyle="Groove" Height="200px" ImageUrl="~/Image/maleUser-default.png" runat="server" />
                                                <asp:TextBox ID="txt_ImageUrl" runat="server" Width="100%" CssClass="Display_None"></asp:TextBox>

                                            </td>
                                            <td style="width: 25%"></td>
                                            <td style="width: 25%" align="right"><span class="Label_Normal" style="font-weight:bold;">Registration No :</span></td>
                                            <td style="width: 25%">
                                                <asp:TextBox ID="txt_PatientRegNo" runat="server" Width="98%" Enabled="false" Font-Bold="true" ForeColor="#00ccff" CssClass="TextBox_Normal"></asp:TextBox></td>
                                        </tr>
                                        <tr>
                                            <td style="width: 25%"><span class="Label_Normal">First Name</span></td>
                                            <td style="width: 25%"><span class="Label_Normal">Middel Name</span></td>
                                            <td style="width: 25%"><span class="Label_Normal">Last Name</span></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:TextBox ID="txt_FirstName" runat="server" Width="98%" CssClass="TextBox_Normal"></asp:TextBox></td>
                                            <td>
                                                <asp:TextBox ID="txt_MiddelName" runat="server" Width="98%" CssClass="TextBox_Normal"></asp:TextBox></td>
                                            <td>
                                                <asp:TextBox ID="txt_LastName" runat="server" Width="98%" CssClass="TextBox_Normal"></asp:TextBox></td>
                                        </tr>
                                        <tr>
                                            <td><span class="Label_Normal">Gender</span></td>
                                            <td><span class="Label_Normal">DOB</span></td>
                                            <td><span class="Label_Normal">Age</span></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:DropDownList ID="drp_Gender" validation="Non-Empty-Dropdown" Width="100%" runat="server" CssClass="DropDown_Normal">
                                                    <asp:ListItem Text="--Select--" Value="-1"></asp:ListItem>
                                                    <asp:ListItem Text="Male" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="Female" Value="0"></asp:ListItem>
                                                </asp:DropDownList></td>
                                            <td style="white-space: nowrap;">
                                                <asp:TextBox ID="txt_DOB" runat="server" Width="90%" CssClass="TextBox_Normal" validation="DatePicker;"></asp:TextBox></td>
                                            <td>
                                                <asp:TextBox ID="txt_Age" runat="server" Width="98%" CssClass="TextBox_Normal"></asp:TextBox></td>
                                        </tr>
                                        <tr>
                                            <td><span class="Label_Normal">Blood Group</span></td>
                                            <td><span class="Label_Normal">Weight</span></td>
                                            <td><span class="Label_Normal">Marital Status</span></td>
                                        </tr>
                                        <tr>
                                            <td align="center">
                                                <asp:Button ID="btn_BrowseImg" runat="server" OnClientClick="fn_UploadPhoto();return false;" CssClass="Button_Normal" Text="Browse.." Width="81%" /></td>
                                            <td>
                                                <asp:DropDownList ID="drp_BloodGroup" Width="100%" runat="server" CssClass="DropDown_Normal">
                                                    <asp:ListItem Text="--Select--" Value="--Select--"></asp:ListItem>
                                                    <asp:ListItem Text="O +ve" Value="O +ve"></asp:ListItem>
                                                    <asp:ListItem Text="O -ve" Value="O -ve"></asp:ListItem>
                                                    <asp:ListItem Text="A +ve" Value="A +ve"></asp:ListItem>
                                                    <asp:ListItem Text="A -ve" Value="A -ve"></asp:ListItem>
                                                    <asp:ListItem Text="B +ve" Value="B +ve"></asp:ListItem>
                                                    <asp:ListItem Text="B -ve" Value="B -ve"></asp:ListItem>
                                                    <asp:ListItem Text="AB +ve" Value="AB +ve"></asp:ListItem>
                                                    <asp:ListItem Text="AB -ve" Value="AB -ve"></asp:ListItem>
                                                </asp:DropDownList></td>
                                            <td>
                                                <asp:TextBox ID="txt_Weight" runat="server" Width="98%" CssClass="TextBox_Normal"></asp:TextBox></td>
                                            <td>
                                                <asp:DropDownList ID="drp_MaritalStatus" Width="100%" runat="server" CssClass="DropDown_Normal">
                                                    <asp:ListItem Text="--Select--" Value="--Select--"></asp:ListItem>
                                                    <asp:ListItem Text="Single" Value="Single"></asp:ListItem>
                                                    <asp:ListItem Text="Married" Value="Married"></asp:ListItem>
                                                    <asp:ListItem Text="Widowed" Value="Widowed"></asp:ListItem>
                                                    <asp:ListItem Text="Divorced" Value="Divorced"></asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                    </table>
                                </fieldset>
                                <fieldset class="FieldSet_WithHeader">
                                    <legend>Contact Details</legend>

                                    <table style="width: 100%">
                                        <tr>
                                            <td style="width: 10%"><span class="Label_Normal">Phone No</span></td>
                                            <td style="width: 2px;"><span class="Label_Bold">:</span></td>
                                            <td style="width: 40%; text-align: left;">
                                                <asp:TextBox ID="txt_PhoneNumber" runat="server" Width="89.5%" CssClass="TextBox_Normal"></asp:TextBox></td>
                                            <td style="width: 20px;"></td>

                                            <td style="width: 10%"><span class="Label_Normal">Mobile No</span></td>
                                            <td style="width: 2px;"><span class="Label_Bold">:</span></td>
                                            <td style="width: 40%; text-align: left;">
                                                <asp:TextBox ID="txt_MobileNumber" runat="server" Width="89.5%" CssClass="TextBox_Normal"></asp:TextBox></td>
                                            <td style="width: 20px;"></td>
                                        </tr>
                                        <tr>
                                            <td style="width: 10%; vertical-align: top;"><span class="Label_Normal">Current Address</span></td>
                                            <td style="width: 2px; vertical-align: top;"><span class="Label_Bold">:</span></td>
                                            <td style="width: 40%; vertical-align: top; text-align: left;">
                                                <asp:TextBox ID="txt_CurrentAddress" runat="server" Width="89%" Height="50px" TextMode="MultiLine" CssClass="TextArea_Normal"></asp:TextBox></td>
                                            <td style="width: 20px;"></td>

                                            <td style="width: 10%; vertical-align: top;"><span class="Label_Normal">Permanent Address</span></td>
                                            <td style="width: 2px; vertical-align: top;"><span class="Label_Bold">:</span></td>
                                            <td style="width: 40%; vertical-align: top; text-align: left;">
                                                <asp:TextBox ID="txt_PermanentAddress" runat="server" Width="89%" Height="50px" TextMode="MultiLine" CssClass="TextArea_Normal"></asp:TextBox></td>
                                            <td style="width: 20px;"></td>
                                        </tr>

                                        <tr>
                                            <td style="width: 10%"><span class="Label_Normal">Country</span></td>
                                            <td style="width: 2px;"><span class="Label_Bold">:</span></td>
                                            <td style="width: 40%; text-align: left;">
                                                <asp:DropDownList ID="drp_Country" validation="Non-Empty-Dropdown" Width="90.2%" runat="server" OnSelectedIndexChanged="drp_Country_SelectedIndexChanged" AutoPostBack="true" CssClass="DropDown_Normal">
                                                </asp:DropDownList>
                                            </td>
                                            <td style="width: 20px;"></td>

                                            <td style="width: 10%"><span class="Label_Normal">State</span></td>
                                            <td style="width: 2px;"><span class="Label_Bold">:</span></td>
                                            <td style="width: 40%; text-align: left;">
                                                <asp:DropDownList ID="drp_State" validation="Non-Empty-Dropdown" Width="90.2%" runat="server" CssClass="DropDown_Normal" OnSelectedIndexChanged="drp_State_SelectedIndexChanged" AutoPostBack="true">
                                                </asp:DropDownList>
                                            </td>
                                            <td style="width: 20px;"></td>
                                        </tr>

                                        <tr>
                                            <td style="width: 10%"><span class="Label_Normal">City</span></td>
                                            <td style="width: 2px;"><span class="Label_Bold">:</span></td>
                                            <td style="width: 40%; text-align: left;">
                                                <asp:DropDownList ID="drp_City" validation="Non-Empty-Dropdown" Width="90.2%" runat="server" CssClass="DropDown_Normal">
                                                </asp:DropDownList>
                                            </td>
                                            <td style="width: 20px;"></td>

                                            <td style="width: 10%"></td>
                                            <td style="width: 2px;"></td>
                                            <td style="width: 40%; text-align: left;"></td>
                                            <td style="width: 20px;"></td>
                                        </tr>
                                        <tr>
                                            <td style="width: 10%"><span class="Label_Normal">Is Localite</span></td>
                                            <td style="width: 2px;"><span class="Label_Bold">:</span></td>
                                            <td style="width: 40%; text-align: left;">
                                                <asp:CheckBox ID="chk_IsLocalite" runat="server" />
                                            </td>
                                            <td style="width: 20px;"></td>

                                            <td style="width: 10%"><span class="Label_Normal">Is New</span></td>
                                            <td style="width: 2px;"><span class="Label_Bold">:</span></td>
                                            <td style="width: 40%; text-align: left;">
                                                <asp:CheckBox ID="chk_IsNew" runat="server" /></td>
                                            <td style="width: 20px;"></td>
                                        </tr>
                                    </table>
                                </fieldset>

                                <fieldset class="FieldSet_WithHeader">
                                    <legend>Reference Details</legend>

                                    <table style="width: 100%">
                                        <tr>
                                            <td style="width: 10%"><span class="Label_Normal">Referred By</span></td>
                                            <td style="width: 2px;"><span class="Label_Bold">:</span></td>
                                            <td style="width: 40%; text-align: left;">
                                                <asp:DropDownList ID="drp_ReferredBy" Width="90.2%" runat="server" CssClass="DropDown_Normal">
                                                </asp:DropDownList>
                                            </td>
                                            <td style="width: 20px;"></td>

                                            <td style="width: 10%"></td>
                                            <td style="width: 2px;"></td>
                                            <td style="width: 40%;"></td>
                                            <td style="width: 20px;"></td>
                                        </tr>
                                    </table>

                                </fieldset>
                                <fieldset class="FieldSet_WithHeader">
                                    <legend>Extra</legend>

                                    <table style="width: 100%">
                                        <tr>
                                            <td style="width: 10%"><span class="Label_Normal">Note</span></td>
                                            <td style="width: 2px;"><span class="Label_Bold">:</span></td>
                                            <td style="width: 40%; text-align: left;">
                                                <asp:TextBox ID="txt_Note" runat="server" Width="89%" Height="50px" TextMode="MultiLine" CssClass="TextArea_Normal"></asp:TextBox>
                                            </td>
                                            <td style="width: 20px;"></td>

                                            <td style="width: 10%"></td>
                                            <td style="width: 2px;"></td>
                                            <td style="width: 40%;"></td>
                                            <td style="width: 20px;"></td>
                                        </tr>
                                    </table>

                                </fieldset>
                            </ContentTemplate>
                        </Ajax:TabPanel>
                        <Ajax:TabPanel runat="server" HeaderText="Appointment History">
                            <HeaderTemplate>
                                <table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <img src="../../Image/PM_Appointment.png" width="30px" height="30px" style="margin-right: 2px;" /></td>
                                        <td><span class="Label_Normal">Appointment History</span></td>
                                    </tr>
                                </table>
                            </HeaderTemplate>
                            <ContentTemplate></ContentTemplate>
                        </Ajax:TabPanel>
                        <Ajax:TabPanel runat="server" HeaderText="Treatment History">
                            <HeaderTemplate>

                                <table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <img src="../../Image/PM_Treatment.png" width="30px" height="30px" style="margin-right: 2px;" /></td>
                                        <td><span class="Label_Normal">Treatment History</span></td>
                                    </tr>
                                </table>
                            </HeaderTemplate>
                            <ContentTemplate></ContentTemplate>
                        </Ajax:TabPanel>

                    </Ajax:TabContainer>


                </ContentTemplate>
            </asp:UpdatePanel>

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

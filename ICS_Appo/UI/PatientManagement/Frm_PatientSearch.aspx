<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Frm_PatientSearch.aspx.cs" Inherits="UI_PatientManagement_Frm_PatientSearch" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="Ajax" %>

<%@ Register TagName="UC_ErrorName" TagPrefix="UC" Src="~/UC_ErrorMessageInfo.ascx" %>
<%@ Register TagName="UC_Header" TagPrefix="UC" Src="~/UC_Header_New.ascx" %>
<%@ Register TagName="UC_Footer" TagPrefix="UC" Src="~/UC_Footer.ascx" %>
<%@ Register TagName="UC_FormName" TagPrefix="UC" Src="~/UC_PageHeaderInfo.ascx" %>
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

        function Page_FormLoad()
        {
            var obj_S = new JSAM();
            obj_S.Reload();
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
            <fieldset class="FieldSet_PageHeader">
                        <table style="width: 100%">
                            <tr>
                                <td align="left" style="white-space: nowrap">
                                    <asp:Label ID="Lbl_PageName" runat="server" CssClass="Label_Bold" Text="Patient Information Search"></asp:Label>
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
            <asp:UpdatePanel ID="up" runat="server">
                <ContentTemplate>
                    <UC:UC_ListGrid_New runat="server" InvisibleColumnIndexes="1,4" UrlBinding="true" URL_ColumnIndex="1" ID="UC_ListGrid_New1" />

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

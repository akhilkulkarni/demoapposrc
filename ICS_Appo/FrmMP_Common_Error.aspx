<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FrmMP_Common_Error.aspx.cs" Inherits="UI_FrmMP_Common_Error" %>

<!DOCTYPE html>
<%@ Register TagName="UC_Header" TagPrefix="UC" Src="~/UC_Header_New.ascx" %>
<%@ Register TagName="UC_Footer" TagPrefix="UC" Src="~/UC_Footer.ascx" %>
<%@ Register TagName="UC_FormName" TagPrefix="UC" Src="~/UC_PageHeaderInfo.ascx" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <%-- MENU CSS--%>
    <link href="<%# Page.ResolveUrl("~/CSS/MainCommon.css")%>" rel="stylesheet" type="text/css" />
    <link href="<%# Page.ResolveUrl("~/css/dropdown/dropdown.css")%>" media="screen" rel="stylesheet" type="text/css" />
    <link href="<%# Page.ResolveUrl("~/css/dropdown/themes/vimeo.com/default.advanced.css")%>" media="screen"
        rel="stylesheet" type="text/css" />


    <script src="<%# Page.ResolveUrl("~/JS/JQuery-ui.js")%>" type="text/javascript"></script>
    <%-- MENU CSS--%>


    <style type="text/css">
        #btn_Login
        {
            margin-right: 10px;
            margin-top: 10px;
        }
    </style>

</head>
<body>
    <form id="form2" runat="server">
     
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
        <asp:UpdatePanel ID="up_Pan" runat="server">
            <ContentTemplate>
              
            <fieldset class="FieldSet_Error_PageHeader">
                            <table style="width: 100%">
                                <tr>
                                    <td style="width: 30px" align="center">
                                        <asp:Image runat="server" ID="img" Width="30px" Height="30px" ImageUrl="~/Image/1402169849_agt_update_critical.png" />
                                    </td>
                                    <td align="left" style="white-space: nowrap">
                                        <asp:Label ID="Lbl_PageName" runat="server" CssClass="Label_Bold" Text="Error Page"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </fieldset>

                        <fieldset class="FieldSet_WithHeader">
                            <table style="width: 100%" cellpadding="5" cellspacing="15">
                                <tr>
                                    <td style="width: 10%; white-space: nowrap;"><span class="Label_Bold">Title</span></td>
                                    <td><span class="Label_Bold">:</span></td>
                                    <td>
                                        <asp:Label runat="server" CssClass="Label_Bold" Text="" ID="lbl_Title"></asp:Label>
                                    </td>
                                </tr>

                                <tr>
                                    <td style="width: 10%; white-space: nowrap;"><span class="Label_Bold">Discription</span></td>
                                    <td><span class="Label_Bold">:</span></td>
                                    <td>
                                        <asp:Label runat="server" CssClass="Label_Normal" Text="" ID="lbl_Message"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 10%; white-space: nowrap;"><span class="Label_Bold">Source</span></td>
                                    <td><span class="Label_Bold">:</span></td>
                                    <td>
                                        <asp:Label runat="server" CssClass="Label_Bold" Text="" ID="lbl_ErrorSource"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Button runat="server" Text="Login" Width="100px" ID="btn_Relogin" CssClass="Button_Normal" PostBackUrl="~/login.aspx" />
                                    </td>
                                </tr>

                            </table>
                        </fieldset>

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

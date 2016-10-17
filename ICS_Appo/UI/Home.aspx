<%@ Page Language="C#" AutoEventWireup="true" Theme="Default" CodeFile="Home.aspx.cs"   Inherits="UI_Home" %>

<!DOCTYPE html>
<%@ Register TagName="UC_Header" TagPrefix="UC" Src="~/UC_Header_New.ascx"%>
<%@ Register TagName="UC_Footer" TagPrefix="UC" Src="~/UC_Footer.ascx"%>
<%@ Register TagName="UC_FormName" TagPrefix="UC" Src="~/UC_PageHeaderInfo.ascx" %>
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

 <style type="text/css">
 #btn_Login
 {
    margin-right:10px;  
    margin-top:10px;   
}
 </style>

</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="scm" runat="server"></asp:ScriptManager>

   <div id="dv_mainBackground" class="MainBackgroundScreen">
        <table class="Table_MainTable" cellspacing="0" cellpadding="0">
            <tr class="Row_Header">
                <td class="Row_Header">
                    <UC:UC_Header ID="uc_header" ShowModule="true" runat="server" />
                </td>
            </tr>
           
            <tr>
                <td>
                 
                </td>
            </tr>
            <tr style="height:25px">
                <td>
             <%--  <UC:UC_ErrorName ID="uc_error" runat="server" ErrorMessage="* marked fields are mandetory" />--%>
                </td>
            </tr>
            <tr class="Row_Footer">
                <td class="Row_Footer">
                    
                    <UC:UC_Footer ID="uc_footer" LogoURL="../Image/ICS.PNG" runat="server" />
                </td>
            </tr>
        </table>
    </div>

    </form>
</body>
</html>

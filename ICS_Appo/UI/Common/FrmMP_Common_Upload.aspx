<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FrmMP_Common_Upload.aspx.cs" Inherits="UI_FrmMP_Common_Upload" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagName="UC_Footer" TagPrefix="UC" Src="~/UC_Footer.ascx" %>
 
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   
        <title>ICS-Appo : File Upload</title>
    <!--########################################## IMPORTANT ON EVERY PAGE ##########################################-->
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
    <!--#############################################################################################################-->
    <script type="text/javascript">
        function Fn_ClosePath() {
            //$("#txt_Reference_Code")[0].value.
            //parent.$.fn.Fn_GetFilePath(Fn_ReturnFilePath());
            parent.$.fn.colorbox.close();
        }
    </script>


     <script type="text/javascript">
         function uploadComplete(sender) {
             Fn_ShowMessage('success', "File Uploaded Successfully", 1, 'top', 0);
           
         }
         function uploadError(sender) {
             Fn_ShowMessage('success', "File Uploaded failed!!", 1, 'top', 0);
         }
    </script>

</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager runat="server" ID="sc_1">

    </asp:ScriptManager>

 
 <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
   
    <ajax:AsyncFileUpload UploaderStyle="Modern"  OnClientUploadError="uploadError" OnClientUploadComplete="uploadComplete"
                                    runat="server" ID="AsyncFileUpload1" Width="400px"  CompleteBackColor="White"
                                    UploadingBackColor="#CCFFFF" ThrobberID="imgLoader" OnUploadedComplete="AsyncFileUpload1_UploadedComplete" />
            <div style="float: right;bottom:0px;">
                
                <asp:Button runat="server" Text="Done" Width="150px" OnClientClick="Fn_ClosePath();return false;" CssClass="Button_Normal" />

            </div>
            <div style="display:none">
            <UC:UC_Footer ID="UC_Footer1" runat="server" />
               
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    
         
    </form>
</body>
</html>

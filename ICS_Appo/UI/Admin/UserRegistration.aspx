<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserRegistration.aspx.cs" Theme="Default"
    Inherits="UI_Admin_UserRegistration" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagName="UC_Header" TagPrefix="UC" Src="~/UC_Header_New.ascx" %>
<%@ Register TagName="UC_Footer" TagPrefix="UC" Src="~/UC_Footer.ascx" %>
<%@ Register TagName="UC_FormName" TagPrefix="UC" Src="~/UC_PageHeaderInfo.ascx" %>
<%@ Register TagName="UC_ErrorName" TagPrefix="UC" Src="~/UC_ErrorMessageInfo.ascx" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
        function validation() {


            if (document.getElementById("txtRePassword").value != document.getElementById("txtPassword").value) {
                alert("Password doesn't match Retype Password");
                return false;
            }

            if (document.getElementById("txtUserId").value == "") {
                alert("UserId Can't be Empty");
                return false;
            }

            if (document.getElementById("txtPassword").value == "") {
                alert("Password Can't be Empty");
                return false;
            }

            return true;
        }

        function ClearValues() {
            document.forms[0].reset();
            //            document.getElementById('txtFirstName').value = "";
            //            document.getElementById('txtMiddleName').value = "";
            //            document.getElementById('txtLastName').value = "";
            //            document.getElementById('txtUserId').value = "";
            //            document.getElementById('txtUserId').value = "";
            //            document.getElementById('txtPassword').value = "";
            //            document.getElementById('txtRePassword').value = "";
            //            document.getElementById('chkIsActive').checked = false;
            //            document.getElementById('chkIsdeleted').checked = false;
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="sc_mgr" runat="server">
       <%-- <Scripts>
            <asp:ScriptReference ScriptMode="Auto" Path="~/JS/PageLock_UP.js" />
        </Scripts>--%>
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
                    <asp:UpdatePanel ID="up_patientEnt" runat="server">
                        <ContentTemplate>
                            <div>
                                <table align="center">
                                    <tr>
                                        <td align="left">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblPatientName" Text="Name" CssClass="label_Normal" runat="server"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtFirstName" runat="server" Text="" CssClass="TextBox_Normal"></asp:TextBox>
                                            
                                            <asp:TextBox ID="txtMiddleName" runat="server" CssClass="TextBox_Normal"></asp:TextBox>
                                            
                                            <asp:TextBox ID="txtLastName" runat="server" CssClass="TextBox_Normal"></asp:TextBox>
                                             <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblUserId" Text="User ID" runat="server"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtUserId" runat="server" CssClass="TextBox_Normal"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblPassword" Text="Password" runat="server"></asp:Label>
                                        </td>
                                        <td>
                                         <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="TextBox_Normal"></asp:TextBox>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblRepassword" Text="Re Enter Passeword" runat="server" CssClass="label_Normal"></asp:Label>
                                           
                                        </td>
                                        <td>
                                <asp:TextBox ID="txtRePassword" runat="server" TextMode="Password" CssClass="TextBox_Normal"></asp:TextBox>

                                        
                                          
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Status
                                        </td>
                                        <td>
                                            <asp:Label ID="lblIsactive" Text="Is Active" runat="server"></asp:Label>
                                            <input type="checkbox" id="chkIsactive" runat="server" />
                                            <asp:Label ID="lbIsdeleted" Text="Is Deleted" runat="server"></asp:Label>
                                            <input type="checkbox" id="chkIsdeleted" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td>
                                            <asp:Button ID="btnAdd" runat="server" Width="100px" Text="Add" OnClick="btnAdd_Click" OnClientClick="return validation();" CssClass="Button_Normal"/>
                                            <input id="Button1" type="button" value="Clear" style="Width:100px" runat="server" onclick="ClearValues();" class="Button_Normal"/>
                                        </td>
                                    </tr>
                                    
                                    <tr>
                                        <td colspan="2">
                                            <asp:GridView ID="grd_UserMaseter" runat="server" AutoGenerateColumns="False" 
                                                CellPadding="4" DataKeyNames="PK_UserId" ForeColor="#333333" GridLines="None" 
                                                OnRowCancelingEdit="grd_UserMaseter_RowCancelingEdit" 
                                                OnRowDataBound="grd_UserMaseter_RowDataBound" 
                                                OnRowDeleting="grd_UserMaseter_RowDeleting" 
                                                OnRowEditing="grd_UserMaseter_RowEditing" 
                                                OnRowUpdating="grd_UserMaseter_RowUpdating" RowStyle-CssClass="row" CssClass="mGrid"
                                        PagerStyle-CssClass="pgr">
                                              
                                                <Columns>
                                                    <asp:TemplateField HeaderText="PK_UserId">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_Pk_UserID_n" runat="server" Text='<%#Eval("PK_UserId")%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:Label ID="lbl_User_ID_e" runat="server" Text='<%#Eval("Pk_UserId")%>'></asp:Label>
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>
                                                    <%--<asp:TemplateField HeaderText="Sr No">
                                                <ItemTemplate>
                                                <%# Container.DataItemIndex + 1 %>
                                                </ItemTemplate>
                                                </asp:TemplateField>--%>
                                                    <asp:TemplateField HeaderText="User Name">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_UserName_n" runat="server" Text='<%#Eval("UserName")%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <%--<asp:Label ID="lbl_UserName_e" runat="server" Text='<%#Eval("UserName")%>'></asp:Label>--%>
                                                           <asp:TextBox ID="txtUserNameId_e" Text='<%#Eval("UserName") %>' runat="server"></asp:TextBox>
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="UserId">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_UserId_n" runat="server" Text='<%#Eval("UserId")%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:Label runat="server" ID="lbl_UserId_e" Text='<%#Eval("UserId")%>'></asp:Label>
                                                          
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Password">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_Password_n" runat="server" Text='<%#Eval("Password")%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:Label runat="server" ID="lbl_Password_e" Text='<%#Eval("Password")%>'></asp:Label>
                                                            <%--<asp:TextBox ID="txtPassword_e" runat="server" Text='<%#Eval("Password") %>'></asp:TextBox>--%>
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="IsActive">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_IsActive_n" runat="server" Text='<%#Eval("IsActive")%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <%--<asp:Label runat="server" ID="lbl_IsActive_e" Text='<%#Eval("IsActive")%>'></asp:Label>--%>
                                                            <%--<asp:TextBox ID="txtIsActive_e" Text='<%#Eval("IsActive") %>' runat="server"></asp:TextBox>--%>
                                                            <asp:CheckBox ID="txtIsActive_e" runat="server" 
                                                                Checked='<%#Eval("IsActive") %>' />
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="IsDeleted">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_Isdeleted_n" runat="server" Text='<%#Eval("IsDeleted")%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <%--<asp:Label runat="server" ID="lbl_IsActive_e" Text='<%#Eval("IsActive")%>'></asp:Label>--%>
                                                            <%--<asp:TextBox ID="txtIsdeleted_e" Text='<%#Eval("Isdeleted") %>' runat="server"></asp:TextBox>--%>
                                                            <asp:CheckBox ID="txtIsdeleted_e" runat="server" 
                                                                Checked='<%#Eval("IsDeleted") %>' />
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:CommandField ShowEditButton="true" />
                                                </Columns>
                                                
                                            </asp:GridView>
                                        </td>
                                    </tr>
                                    
                                </table>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr style="height: 25px">
                <td>
                    <UC:UC_ErrorName ID="uc_error" runat="server" ErrorMessage="* marked fields are mandetory" />
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

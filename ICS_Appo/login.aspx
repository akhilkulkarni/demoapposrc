<%@ Page Language="C#" AutoEventWireup="true" Theme="Default" CodeFile="login.aspx.cs"
    Inherits="login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ICS-APPO:User Login</title>
    <link href="CSS/MainCommon.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="JS/jquery-1.9.1.js"></script>
    <script type="text/javascript">


        function Fn_Validate() {
            if ($("#txt_UserName")[0].value.trim() != "") {

                if ($("#txt_Password")[0].value.trim() != "") {

                    return true;
                }
                else {
                    alert('Please Enter Password!');
                    return false;
                }
            }
            else {
                alert('Please Enter User Id!');
                return false;
            }


        }
    </script>
    <style type="text/css">
        #Div_PassWordCheck
        {
            display: none;
        }
        #btn_Login
        {
            margin-right: 10px;
            margin-top: 10px;
        }
        
        #layout
        {
            height: 100%;
            width: 100%;
            margin: 0;
            padding: 0;
            overflow: hidden;
            position: fixed;
        }
        #wrapper
        {
            overflow-y: scroll;
            position: relative;
            height: 100%;
        }
        #content
        {
            position: absolute;
        }
        #header
        {
            background-color: #BADBAD;
        }
        #btn_Login0
        {
            margin-right: 10px;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="sc1" runat="server">
        <Scripts>
            <asp:ScriptReference Path="~/JS/LoginVerify_JS.js" />
        </Scripts>
    </asp:ScriptManager>
    <div id="dv_mainBackground" class="Div_MainLoginBack">
        <table class="Table_MainTable" cellspacing="0" cellpadding="0">
            <%--  <tr class="Row_Header">
                <td class="Row_Header">
                    <UC:UC_Header ID="uc_header" ShowModule="false" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                </td>
            </tr>--%>
            <tr>
                <td width="70%" height="100%">
                </td>
            </tr>
            <tr>
                <td>
                        <div class="DIV_LoginComapanyInfo" >
                <div style="float:right;margin:5px;height:65px;"">
                    <table class="Table_Full">
                        <tr>
                            <td valign="middle">
                               
                                            <a onclick="window.open('http://www.infocasier.com')" href="#">
                            <img src="Image/InfocasierSystems.png" width="280px" height="80px" alt="" />                
                                                </a>
                                       
                                
                            </td>
                        </tr>
                    </table>
                </div>
                </div>
                </td>
            </tr>
            <tr class="Row_Footer">
                <td class="Row_Footer">
                    <%--    <UC:UC_Footer ID="uc_footer" runat="server" />--%>
                </td>
            </tr>
        </table>
    </div>
    <div class="LoginDiv">
        <table class="" style="width: 550px">
            <tr>
                <td>
                    <table class="Table_FullWidth">
                        <tr>
                            <td>
                                <img height="30px" width="30px" src="Image/Login.png" alt="?" />
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <table class="Table_FullWidth">
                                    <tr>
                                        <td style="width: 80px;">
                                            <asp:Label ID="Label1" runat="server" CssClass="label_Normal" Text="User Name"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label3" runat="server" CssClass="label_SubHeader" Text=":"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txt_UserName" CssClass="TextBox_Normal" runat="server" Width="150px"></asp:TextBox>
                                        </td>
                                        <td class="style1">
                                        </td>
                                        <td>
                                            <asp:Label ID="Label4" runat="server" Text="Password" CssClass="label_Normal"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label5" runat="server" CssClass="label_SubHeader" Text=":"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txt_Password" CssClass="TextBox_Normal" runat="server" Width="150px"
                                                TextMode="Password"></asp:TextBox>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td align="right">
                    <asp:UpdatePanel ID="up1" runat="server">
                        <ContentTemplate>
                            <div style="margin-right: 16px;">
                                <asp:Button ID="btn_Login" CssClass="Button_Normal" runat="server" Text="Login" Width="60px"
                                    OnClick="btn_Login_Click" OnClientClick="return Fn_Validate();" /></div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
                <td class="style1">
                </td>
            </tr>
            <tr>
                <td align="left">
                    <div id="Div_PassWordCheck" class="DIV_Password" style="margin-right: 16px;">
                        <asp:UpdatePanel ID="Up_label" runat="server">
                            <ContentTemplate>
                                <table style="margin-bottom:5px">
                                    <tr>
                                        <td style="width: 30px; height: 30px;" valign="middle" align="center">
                                            <img id="img_Loading" alt="" width="26px" height="26px" src="Image/loading-blue.gif" />
                                        </td>
                                        <td style="height: 30px;" valign="middle" align="left">
                                            <asp:Label ID="lbl_MessageText" CssClass="Label_LoginMsg" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btn_Login" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </div>
                </td>
                <td class="style1">
                    &nbsp;
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>

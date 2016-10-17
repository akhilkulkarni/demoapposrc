<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UC_Header.ascx.cs"  Inherits="UC_Header" %>


<link href="CSS/StyleSheet.css" rel="stylesheet" type="text/css" />
<%--<asp:UpdatePanel ID="up_Head" UpdateMode="Always" runat="server">
<ContentTemplate>--%>
<script type="text/javascript">

    function fn_Logout() {
        if (confirm('Do you want to logout?')) {
            //window.location=""
        }
    
    }
</script>
<style type="text/css">
    .MenuBar
    {
        font-family: "Trebuchet MS" , Arial, Helvetica, sans-serif;
        float: left;
        margin-left:5px;
    }
    
    .StaticMenuItem
    {
        background-color: #AD97C4;/*#1999cf*/
        -moz-border-radius: 2px;
        -webkit-border-radius: 2px;
        font: 10pt calibri;
        font-family: "Trebuchet MS" , Arial, Helvetica, sans-serif;
    
        vertical-align: middle;
        background-repeat: repeat-x;
        height: 20px;
        text-align: center;
        color: white;
        padding: 1px;
    }
    
    .StaticMenuItemStyle
    {
        color: #ffffff;
        padding: 3px;
    }
    
    
    .StaticHoverStyle
    {
     -moz-border-radius: 5px;
        -webkit-border-radius: 5px;
        background-color: white;
        color: #5f5f5f;
    }
    
    .StaticSelectedStyle
    {
        background-color: #ffe99f;
        color: #5f5f5f;
    }
    
    .DynamicMenuItemStyle
    {
        background-color: #DFC2FC;/*#bdeafe*/
        border-width: 1px;
        border-style: solid;
        border-color: #000000;
        -moz-border-radius: 1px;
        -webkit-border-radius: 1px;
        font: 10pt calibri;
        margin: 0px;
        margin-top: 1px;
        border-left: 0px solid #c1c1c1;
        border-right: 0px solid #c1c1c1;
        border-top: 0px solid #c1c1c1;
        border-bottom: 1px solid #c1c1c1;
        border-spacing: 0px;
        vertical-align: middle;
        background-repeat: repeat-x;
        height: 20px;
        text-align: left;
        color: #5f5f5f;
        padding: 2px;
    }
    
    .DynamicHoverStyle
    {
        background-color: #DF95D6;
        color: #ffffff;
    }
    
    .ImageBack
    {
        
    }
    .ImageBack:hover
    {
        -moz-box-shadow:#FFFFFF 10px 10px 10px;
        -webkit-box-shadow:#FFFFFF 10px 10px 10px;
        box-shadow:#FFFFFF 10px 10px 10px;
     
    }

</style>



 <asp:XmlDataSource runat="server" TransformFile="MenuStyleSheet.xslt" EnableCaching="false"  XPath="MenuItems/MenuItem" ID="xds"></asp:XmlDataSource>


<div class="Div_Header">
    <table class="Table_FullWidth" cellpadding="0" cellspacing="0" style="height: 100px; padding: 0px;border:none;">
        <tr>
            <td valign="top">
                <table style="height: 70px;border-style:none;">
                    <tr>
                        <td align="center" valign="top">
                            <asp:ImageButton ID="img_home" Width="60px" Height="60px" CssClass="ImageBack" ImageAlign="Middle" ImageUrl="~/App_Themes/Default/ICON/Home_C.png"
                                runat="server" onclick="img_home_Click" />
                        </td>
                        <td align="center" valign="top">
                            <asp:ImageButton ID="img_PatientManagement" Width="60px" Height="60px" CssClass="ImageBack" ImageAlign="Middle"
                                ImageUrl="~/App_Themes/Default/ICON/PatientMang_C.png" runat="server" OnClick="img_PatientManagement_Click" />
                        </td>

                          <td align="center" valign="top">
                            <asp:ImageButton ID="img_appointment" Width="60px" Height="60px"  CssClass="ImageBack" 
                                ImageAlign="Middle" ImageUrl="~/App_Themes/Default/ICON/Appo_C.png"
                                runat="server" onclick="img_appointment_Click" />
                        </td>
                          <td align="center" valign="top">
                            <asp:ImageButton ID="img_Report" Width="60px" Height="60px" ImageAlign="Middle" CssClass="ImageBack" ImageUrl="~/App_Themes/Default/ICON/Charts_S.png"
                                runat="server" onclick="img_Report_Click" />
                        </td>
                        <td align="center" valign="top" >
                            <asp:ImageButton ID="img_admin" Width="60px" Height="60px" ImageAlign="Middle" CssClass="ImageBack" ImageUrl="~/App_Themes/Default/ICON/settings_C.png"
                                runat="server" onclick="img_admin_Click" />
                        </td>
                      
                      
                         <td align="center" valign="top">
                            <asp:ImageButton ID="img_Help" Width="60px" Height="60px"  CssClass="ImageBack"
                                 ImageAlign="Middle" ImageUrl="~/App_Themes/Default/ICON/Help_C.png"
                                runat="server" onclick="img_Help_Click"/>
                        </td>
                         <td align="center" valign="top">
                            <asp:ImageButton ID="img_Logout" Width="60px" Height="60px"  CssClass="ImageBack"
                                 ImageAlign="Middle" ImageUrl="~/App_Themes/Default/ICON/logout_C.png"
                                runat="server" onclick="img_Logout_Click"/>
                        </td>
                        
                        <td align="center" valign="top">
                            <asp:ImageButton ID="img_DocDesk" Visible="false" Width="60px" Height="60px" CssClass="ImageBack" 
                                ImageAlign="Middle" ImageUrl="~/Image/Module_DocDesk.png"
                                runat="server" onclick="img_DocDesk_Click" />
                        </td>
                        <td align="center" valign="top">
                            <asp:ImageButton ID="img_HR" Width="60px"  Visible="false"  Height="60px" ImageAlign="Middle" CssClass="ImageBack" ImageUrl="~/Image/Module_HR.png"
                                runat="server" onclick="img_HR_Click" />
                        </td>
                        <td align="center" valign="top">
                            <asp:ImageButton ID="img_SalesPurchase" Width="60px"  Visible="false" CssClass="ImageBack" Height="60px" 
                                ImageAlign="Middle" ImageUrl="~/Image/Module_Sales_Purchase.png"
                                runat="server" onclick="img_SalesPurchase_Click" />
                        </td>
                      
                        
                    </tr>
                </table>
            </td>
            <td align="center" valign="middle">
                <asp:Image ID="img_ClientLogo" Width="200px" Height="70px" ImageAlign="Middle" ImageUrl="~/Image/ojusLogo.png"
                    runat="server" />
            </td>
        </tr>
        <tr style="height: 30px; background-color: #AD97C4;">
            <td align="left" valign="top">
                <asp:Menu ID="menu" EnableTheming="False" IncludeStyleBlock="false" RenderingMode="Table"
                    DataSourceID="xds" runat="server" Orientation="Horizontal" StaticEnableDefaultPopOutImage="false"
                    StaticDisplayLevels="1" 
                  CssClass="MenuBar" MaximumDynamicDisplayLevels="10">
                <StaticMenuStyle CssClass="StaticMenuItem" />
                <StaticMenuItemStyle CssClass="StaticMenuItemStyle" />
                <StaticHoverStyle CssClass="StaticHoverStyle" />  
                <StaticSelectedStyle CssClass="StaticSelectedStyle" />              
                <DynamicMenuItemStyle CssClass="DynamicMenuItemStyle" />
                <DynamicHoverStyle CssClass="DynamicHoverStyle" />
           
                    <DataBindings>
                        <asp:MenuItemBinding NavigateUrlField="NavigateUrl" DataMember="MenuItem" ValueField="PK_MenuID"
                            TextField="MenuName" ToolTipField="ToolTip" />
                    </DataBindings>
                    <DynamicMenuItemStyle Font-Size="Large"  />
                 
                </asp:Menu>

            </td>
            <td style="width: 51px" align="center">
            
            </td>
        </tr>
    </table>
    
</div>

<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UC_PageHeaderInfo.ascx.cs" Inherits="UC_PageHeaderInfo" %>
<style type="text/css">
.TableFL
{
    width:100%;
    height:25px;    
    
}
.TD_FormName
{
    width:70%;
}

.TD_UserInfo
{
    width:30%;
}

</style>
<div class="TableFL FormInfoBack">
<table class="TableFL">
<tr>
<td class="TD_FormName">
<asp:Label ID="lbl_FormName" runat="server" CssClass="Label_FormName" ></asp:Label>
</td><td class="TD_UserInfo">

<asp:Label ID="lbl_UserName" runat="server" CssClass="Label_FormName" ></asp:Label>
</td>
</tr>
</table>
</div>
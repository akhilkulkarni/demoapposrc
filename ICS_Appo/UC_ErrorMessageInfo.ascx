<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UC_ErrorMessageInfo.ascx.cs" Inherits="UC_LoginUserInfo" %>
<style type="text/css">
.TableFL
{
    width:100%;
    height:25px;    
}
.TD_ErrMSG
{
    width:50%;
}

.TD_Control
{
    width:50%;
}

</style>
<div class="TableFL FormInfoBack">
<table class="TableFL">
<tr>
<td class="TD_ErrMSG">
<asp:Label ID="lbl_ErrorMessage" runat="server" CssClass="Label_FormName" 
        ForeColor="#3333FF" ></asp:Label>
</td><td class="TD_Control">


</td>
</tr>
</table>
</div>
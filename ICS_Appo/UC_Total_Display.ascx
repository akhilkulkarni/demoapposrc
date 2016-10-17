<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UC_Total_Display.ascx.cs" Inherits="UC_Total_Display" %>

<script type="text/javascript">
    $(document).ready(function () {


        fn_ShowHide_Load();
    })
    function fn_ShowHide() {

        if ($('#<%= hdn_ShowHideFlag.ClientID%>').val() == "1") {
           
            $('#<%= hdn_ShowHideFlag.ClientID%>').val(0);
            $('#dv_TotalData').hide("slide", { direction: "right" }, "slow");
            $("#img_ShowHide").rotate({
                angle: -180,
                animateTo: 0
            })
        }
        else {
            $('#<%= hdn_ShowHideFlag.ClientID%>').val("1");
            $('#dv_TotalData').show("slide", { direction: "right" }, "slow");
            $("#img_ShowHide").rotate({
                angle: 180,
                animateTo: 0
            })

        }

    }
    function fn_ShowHide_Load() {

        if ($('#<%= hdn_ShowHideFlag.ClientID%>').val() == "1") {

            
            $('#dv_TotalData').show();
            
        }
        else {
          
            $('#dv_TotalData').hide();

        }

    }
</script>
<style type="text/css">
    
    .txt_Big
    {
        height: 25px;
        font-size: 15px;
    }
</style>
<div class="dv_ShowHideIcon" onclick="fn_ShowHide();">
    <asp:Image ClientIDMode="Static" ID="img_ShowHide" ToolTip="Show/Hide Summary" ImageUrl="~/Image/Wheel.png" Height="40px" Width="40px" runat="server" />
</div>
<asp:UpdatePanel runat="server" ID="up1">
    <ContentTemplate>

        <div class="dv_TotalData" id="dv_TotalData" style="display:none;">

            <table>
                <tr>
                    <td>
                        <asp:Label CssClass="Label_Bold" ID="lbl_totalP" runat="server" Text="Total Patient"></asp:Label>
                    </td>
                    <td>:
                    </td>
                    <td>
                        <asp:TextBox ID="txt_totalPatient" runat="server" Width="150px" CssClass="TextBox_Normal txt_Big"></asp:TextBox>
                    </td>

                    <td>
                        <asp:Label CssClass="Label_Bold" ID="Label1" runat="server" Text="Total Collection"></asp:Label>
                    </td>
                    <td>:
                    </td>
                    <td>
                        <asp:TextBox ID="txt_TotalCollection" runat="server" Width="150px" CssClass="TextBox_Normal txt_Big"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <asp:HiddenField ID="hdn_ShowHideFlag" runat="server" Value="1" />

        </div>

    </ContentTemplate>
</asp:UpdatePanel>

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="appointment_patientQueue.aspx.cs"
    Inherits="UI_Appointment_appointment_patientQueue" Theme="Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="Ajax" %>

<%@ Register TagName="UC_Header" TagPrefix="UC" Src="~/UC_Header_New.ascx" %>
<%@ Register TagName="UC_Footer" TagPrefix="UC" Src="~/UC_Footer.ascx" %>
<%@ Register TagName="UC_FormName" TagPrefix="UC" Src="~/UC_PageHeaderInfo.ascx" %>
<%@ Register TagName="UC_ErrorName" TagPrefix="UC" Src="~/UC_ErrorMessageInfo.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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

    <title></title>
    <style type="text/css">
        .readonlyTextbox
        {
            background-color: Gray;
        }

        #header-fixed
        {
            position: fixed;
            top: 0px;
            display: none;
            background-color: white;
        }

        .header
        {
            overflow: auto;
            position: absolute;
            background-color: White;
        }

        .BTN_IN:hover
        {
            background-color: #afe2b3;
        }
        .BTN_IN
        {
            color:white;
            font-family:'Arial Rounded MT';
            font-size:13px;
            background-color: #77cc6d;
            border:1px solid #808080;
            font-weight:bolder;
        }

        .BTN_RESCHEDULE:hover
        {
            background-color: #2ca9bf;
        }
        .BTN_RESCHEDULE
        {
            color:white;
            font-family:'Arial Rounded MT';
            font-size:13px;
            background-color: #2ac4ea;
               border:1px solid #808080;
            font-weight:bold;
        }

          .BTN_CANCEL:hover
        {
            background-color: #ff8f8f;
        }
        .BTN_CANCEL
        {
            color:white;
            font-family:'Arial Rounded MT';
            font-size:13px;
            background-color: #ff6161;
            border:1px solid #808080;  
            font-weight:bold;
        }


    </style>
    <script type="text/javascript">

        var ScrPay;
        function fn_FilColorScheme() {
            fn_FilColorScheme_PatientQueue();
            fn_FilColorScheme_PaymentQueue();
        }

        function fn_FilColorScheme_PatientQueue() {
            var lnk_Resch;
            var lnk_cancle;

            //            if ((jQuery.browser.msie == true && jQuery.browser.version > 7) || ($.browser.webkit == true && jQuery.browser.version > 5) ||
            //                ($.browser.safari == true && $.jQuery.browser.version > 4) || ($.browser.mozilla == true && jQuery.browser.version > 4) ||
            //                ($.browser.safari == true && jQuery.browser.version))
            //            {
            //                lnk_Resch = $row[i].cells[9].firstElementChild;
            //                lnk_cancle = $row[i].cells[10].firstElementChild;
            //            }
            //            else
            //            {
            //                lnk_Resch = $row[i].cells[9].firstChild;
            //                lnk_cancle = $row[i].cells[10].firstChild;
            //            }



            var $row = $("#grd_patientQueue").find("tr");
            var scrollToE;
            for (var i = 1; i < $row.length; i++) {
                //alert($row[i].cells[11].innerHTML + '===' + $row[i].cells[12].innerHTML);
                if ($row[i].cells[11].innerHTML == "True" && $row[i].cells[12].innerHTML == "True") {
                    //OUT ROW

                    $($row[i]).removeClass('row');
                    $($row[i]).addClass('row_Out');

                    $row[i].cells[9].innerHTML = "<u><b>RESCHEDULE</b></u>";
                    $row[i].cells[10].innerHTML = "<u><b>CANCEL</b></u>";
                    //  $row[i].cells[13].innerHTML = "";



                    //                                  k_ $(lnk_Resch).attr("disabled", "disabled");
                    //                                        $(lncancle).attr("disabled", "disabled");
                    ;
                    //$(".openModalLink").attr("disabled", true);
                }
                else if ($row[i].cells[11].innerHTML == "True" && $row[i].cells[12].innerHTML == "False") {
                    //IN ROW
                    $($row[i]).removeClass('row');
                    $($row[i]).addClass('row_In');
                    scrollToE = $($row[i]);
                }

            }

            //$.scrollTo('#target-examples', 800, { easing: 'elasout' });
            $("#dv_patientQueue").scrollTo(scrollToE, 800);

        }

        function fn_FilColorScheme_PaymentQueue() {

            var $row = $("#grd_searchResult").find("tr");
            var scrollToE;
            for (var i = 1; i < $row.length; i++) {
                //alert($row[i].cells[11].innerHTML + '===' + $row[i].cells[12].innerHTML);
                if ($row[i].cells[8].innerHTML == "1") {
                    //OUT ROW
                    $($row[i]).removeClass('row');
                    $($row[i]).addClass('row_PayRemain');


                }

                //     if ($row[i].cells[8].innerHTML != "1") {
                //         $row[i].cells[7].innerHTML = "<b>-,,-</b>";
                //    }


                if ($row[i].cells[9].innerHTML == "1") {
                    //IN ROW
                    $($row[i]).removeClass('row');
                    $($row[i]).removeClass('row_PayRemain');

                    $($row[i]).addClass('row_LastOut');
                    scrollToE = $($row[i]);

                }

            }

            //$.scrollTo('#target-examples', 800, { easing: 'elasout' });
            $("#div_Search").scrollTo(scrollToE, 800);


        }



        function fn_RefreshPage() {

            __doPostBack('imgBtn_Refresh', '');
            fn_FilColorScheme();
        }
        $(document).ready(function () {

            fn_FilColorScheme();

        });

        function fn_AddAppointment() {
            $.colorbox({
                href: "../PatientManagement/Patient_Registration_POPUP.aspx",
                iframe: true, width: "100% ", height: "100%", transition: "none",
                onClosed: function () { fn_RefreshPage(); }
            });
        }

        function fn_EditAppointment(id) {
            // alert(id);
            if (id == "") {
                alert('Cant edit this appointment,It is priority block !');
                return false;
            }
            else {
                $.colorbox({
                    href: "../PatientManagement/Patient_Registration_POPUP.aspx?id=" + id,
                    iframe: true, width: "100% ", height: "100%", transition: "none",
                    onClosed: function () { fn_RefreshPage(); }
                });
            }
        }

        //

        function Fn_ReportTime(obj, pkAppoId) {

            if (confirm('Do you want to change repoting status for this Appointment?')) {
                var url = "../../Handler/PatientQueue.ashx?id=" + pkAppoId + '&mode=5';
                $.ajax({
                    url: url,
                    contentType: "application/json; charset=utf-8",
                    success: function () { /*alert('Reporting status changed successfully!');*/fn_RefreshPage(); },
                    error: function () { alert('Reporting status changing failed!'); fn_RefreshPage(); }
                });
            }
            return false;
        }

        function Fn_CancleApp(id) {

            if (confirm('Do you realy want to cancel this Appointment?')) {
                var url = "../../Handler/PatientQueue.ashx?id=" + id + '&mode=1';
                $.ajax({
                    url: url,
                    contentType: "application/json; charset=utf-8",
                    success: function () { alert('Appointment cancelled successfully!'); fn_RefreshPage(); },
                    error: function () { alert('Appointment cancellation failed!'); fn_RefreshPage(); }
                });
            }
            return false;
        }

        function Fn_RescheduleApp(id) {
            if (confirm('Do you realy want to reschedule this Appointment?')) {
                var url = "../../Handler/PatientQueue.ashx?id=" + id + '&mode=2';
                $.ajax({
                    url: url,
                    contentType: "application/json; charset=utf-8",
                    success: function () { alert('Appointment rescheduled successfully!'); fn_RefreshPage(); },
                    error: function () { alert('Appointment rescheduling failed!'); fn_RefreshPage(); }
                });
            }
            return false;
        }


        function Fn_AppointmentReset(pkTokenID) {

            if (confirm('Do you want to reset this appointment?')) {
                var url = "../../Handler/PatientQueue.ashx?id=" + pkTokenID + '&mode=6';
                $.ajax({
                    url: url,
                    contentType: "application/json; charset=utf-8",
                    success: function () { alert('Appointment reseted successfully!'); fn_RefreshPage(); },
                    error: function () { alert('Appointment resetting failed!'); fn_RefreshPage(); }
                });
            }
            return false;
        }

        function Fn_AppointmentDelete(id) {
            if (confirm('Do you realy want to delete this Appointment?')) {
                var url = "../../Handler/PatientQueue.ashx?id=" + id + '&mode=3';
                $.ajax({
                    url: url,
                    contentType: "application/json; charset=utf-8",
                    success: function () { alert('Appointment deleted successfully!'); fn_RefreshPage(); },
                    error: function () { alert('Appointment deleting successfully!'); fn_RefreshPage(); }
                });
            }
            return false;
        }

        function Fn_Fees(aptID, obj) {
            ScrPay = $(obj);
            var rw = $(obj).closest("tr");
            var freeChk = rw[0].cells[4].firstElementChild.checked;
            var fees = rw[0].cells[5].firstElementChild.value;
            var is_free = 0;

            if (freeChk) {
                is_free = 1;
            }
            var url = "../../Handler/PatientQueue.ashx?id=" + aptID + '&mode=4&fees=' + fees + "&isFree=" + is_free;
            $.ajax({
                url: url,
                contentType: "application/json; charset=utf-8",
                success: function () { /*alert('Fees paid successfully!');*/fn_RefreshPage(); },
                error: function () { alert('Fees paying failed!'); fn_RefreshPage(); }

            });
            return false;

        }
        function Fn_FreeChecked(obj) {
            // debugger;
            var rw = $(obj).closest("tr");
            var txtFees = rw[0].cells[5].firstElementChild;
            if (obj.checked) {
                // $(txtFees).addClass('readonlyTextbox');
                //$(txtFees).val('0.00');
                $(txtFees).attr("disabled", "disabled");
            }
            else {
                $(txtFees).removeClass('readonlyTextbox');
                $(txtFees).removeAttr('disabled');
            }



        }

        function OnComplete(result) {
            alert('Successfully Done...!');
            /*var rw = $(obj).closest("tr");
            rw[0].cells[7].innerHTML = "Paid";*/
            fn_RefreshPage();
        }
        function OnFail(result) {
            alert('Operation Failed ...!');

        }
    </script>
    <style type="text/css">

        .div_Appo_Out
        {
        
            width: 280px;
            height: 150px;
            margin-top:5px;
            
		}
        .div_Appo_Out .count
        {
            
            vertical-align:central;
            text-align:center;
            font-size:70px;
            font-weight:bold;
            color:white;

            width: 280px;
            height: 90px;
            background: #ff6d92;
            background: #ff6d92 radial-gradient(circle at center,#f5b200 0,#fc636b 30%,#ff6d92 70%);
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='darken($gold, 2%)',endColorstr='$brightCoral',GradientType=1);  
		}
        .div_Appo_Out .text
        { 
        width: 280px;
        height: 60px;
        background-color:#eaeaea;

            vertical-align:central;
            text-align:left;
            font-size:15px;
            font-weight:bold;
            color:black;
       
		}

            .div_Appo_Out .text .dvImage
        { 
            width: 60px;
            height: 60px;
            float:left;
        }
        .div_Appo_Out .text .dvInfo
        { 
            margin-top:10px;
            height: 50px;
            width: 220px;
            float:right;
           
        }
            .div_Appo_Out .text .dvInfo .Status
            {
                font-size:12px;
                background-color:#46bfc3;
                color:#eaeaea;
                padding:2px;
                margin-top:10px!important;
            }
/*===============================================================================================*/
          .div_Appo_IN
        {
        
            width: 280px;
            height: 150px;
    
            
		}
        .div_Appo_IN .count
        {
            
            vertical-align:central;
            text-align:center;
            font-size:70px;
            font-weight:bold;
            color:white; 

            width: 280px;
            height: 90px;
             
            background: #9dd53a; /* Old browsers */
            background: -moz-radial-gradient(center, ellipse cover,  #9dd53a 0%, #54ea9d 0%, #0be5ae 21%, #1ced31 33%, #1ced84 43%, #1cea83 65%, #7eeab2 73%); /* FF3.6-15 */
            background: -webkit-radial-gradient(center, ellipse cover,  #9dd53a 0%,#54ea9d 0%,#0be5ae 21%,#1ced31 33%,#1ced84 43%,#1cea83 65%,#7eeab2 73%); /* Chrome10-25,Safari5.1-6 */
            background: radial-gradient(ellipse at center,  #9dd53a 0%,#54ea9d 0%,#0be5ae 21%,#1ced31 33%,#1ced84 43%,#1cea83 65%,#7eeab2 73%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
            filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#9dd53a', endColorstr='#7eeab2',GradientType=1 ); /* IE6-9 fallback on horizontal gradient */

		}
        .div_Appo_IN .text
        { 
        width: 280px;
        height: 60px;
        background-color:#eaeaea;
       
           vertical-align:central;
            text-align:left;
            font-size:15px;
            font-weight:bold;
            color:black;
       
		}
          
        .div_Appo_IN .text .dvImage
        { 
            width: 60px;
            height: 60px;
            float:left;
        }
        .div_Appo_IN .text .dvInfo
        { 
            margin-top:10px;
            height: 50px;
            width: 220px;
            float:right;
           
        }
         .div_Appo_IN .text .dvInfo .Status
            {
                font-size:12px;
                background-color:#b5f782;
                color:#eaeaea;
                padding:2px;
                margin-top:10px!important;
            }
        /*=================================================================================*/
          .div_Appo_Next
        {
        
            width: 280px;
            height: 150px;
        margin-top:5px;
            
		}
        .div_Appo_Next .count
        {
            
            vertical-align:central;
            text-align:center;
            font-size:70px;
            font-weight:bold;
            color:white;
 
            width: 280px;
            height: 90px;
            background: #ff6d92;
            background: #ff6d92 radial-gradient(circle at center,#f5b200 0,#fc636b 30%,#ff6d92 70%);
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='darken($gold, 2%)',endColorstr='$brightCoral',GradientType=1);  
		}
        .div_Appo_Next .text
        { 
        width: 280px;
        height: 60px;
        background-color:#eaeaea;
       
           vertical-align:central;
            text-align:left;
            font-size:15px;
            font-weight:bold;
            color:black;
       
		}
        
        .div_Appo_Next .text .dvImage
        { 
            width: 60px;
            height: 60px;
            float:left;
        }
        .div_Appo_Next .text .dvInfo
        { 
            margin-top:10px;
            height: 50px;
            width: 220px;
            float:right;
             
        }
         .div_Appo_Next .text .dvInfo .Status
            {
                font-size:12px;
                background-color:#2ac4ea;
                color:#eaeaea;
                padding:2px;
                margin-top:10px!important;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server" style="overflow-y: hidden;">
        <Ajax:ToolkitScriptManager ID="scm" runat="server">
            <Scripts>
                <asp:ScriptReference Path="~/JS/AppointmentQ_FillColorScheme.js" />
                <asp:ScriptReference Path="~/JS/ASYNC_Postback/Async_Callback_JS.js" />
            </Scripts>
        </Ajax:ToolkitScriptManager>

        <!--########################################## HEADER SEACTION ##########################################-->
        <UC:UC_Header ID="uc_header1" MenuShow="true" UserInfoShow="true" runat="server" />
        <!--#####################################################################################################-->
        <!--########################################## BODY SEACTION ############################################-->
        <div class="Div_MainPage">
            <asp:UpdatePanel ID="up1" runat="server">
                <ContentTemplate>
                    <div>
                        <table class="Table_Full">
                            <tr>
                                <td rowspan="2" align="center" valign="top">
                                     

                                    <table>
                                        <tr>
                                           <td>
                                                <div class="div_Appo_Out">
                                                    <div class="count">
                                                        <asp:Label ID="lbl_prevNo" runat="server"  Text="0"></asp:Label>
                                                    </div>
                                                    <div class="text">
                                                        <div class="dvImage"></div>
                                                        <div class="dvInfo">
                                                            <span class="Name"> <asp:Label ID="lbl_prevText" runat="server"  Text="Previous Patient"></asp:Label></span>
                                                            <br /><span class="Status"><asp:Label ID="Label4" runat="server" Text="Out.."></asp:Label></span>
                                                        </div>
                                                    </div>
                                                </div> 
                                            </td>
                                            <td align="center">
                                                <div class="div_Appo_IN">
                                                    <div class="count">
                                                          <asp:Label ID="lbl_currentNo" runat="server" Text="1"></asp:Label>
                                                    </div>
                                                    <div class="text">
                                                        <div class="dvImage"></div>
                                                        <div class="dvInfo">
                                                            <span class="Name">
                                                                <asp:Label ID="lbl_currentText" runat="server" Text="Current Patient"></asp:Label>
                                                            </span>
                                                           <br /> <span class="Status">
                                                                 <asp:Label ID="lbl_status" runat="server" Text="Current Patient"></asp:Label>
                                                            </span>
                                                        </div>

                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="div_Appo_Next">
                                                    <div class="count">
                                                         <asp:Label ID="lbl_nextNo" runat="server" Text="2"></asp:Label>
                                                    </div>
                                                    <div class="text">
                                                        <div class="dvImage"></div>
                                                        <div class="dvInfo">
                                                            <span class="Name"><asp:Label ID="lbl_nextText" runat="server" Text="Next Patient"></asp:Label></span>
                                                           <br /> <span class="Status"> <asp:Label ID="lbl_NextStatus" runat="server"  Text="Waiting.."></asp:Label></span>
                                                        </div>

                                                    </div>
                                                </div>
                                            </td>

                                        </tr>
                                        <tr>
                                            <td align="right"></td>
                                            <td>
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <asp:Button ID="btn_IN" runat="server" Text="IN" CssClass="BTN_IN" Width="110px" OnClick="btn_IN_Click"
                                                                Height="35px" />
                                                        </td>
                                                        <td>
                                                            <asp:Button ID="btn_SKIP" runat="server" CssClass="BTN_RESCHEDULE" Text="RESCHEDULE" Width="110px" Height="35px"
                                                                OnClick="btn_SKIP_Click" />
                                                        </td>
                                                        <td>
                                                            <asp:Button ID="btn_Cancel" runat="server" CssClass="BTN_CANCEL" Text="CANCEL" Width="110px" Height="35px"
                                                                OnClick="btn_Cancel_Click" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td></td>
                                        </tr>
                                    </table>
                                </td>
                                <td valign="top" align="right"></td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <div class="DIV_PatientQueue_INFO">
                                        <table style="width: 100%">
                                            <tr>
                                                <td>
                                                    <div style="float: left">
                                                        <table>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="Label5" Text="Date" runat="server"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="Label6" Text=":" runat="server"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lbl_TodayDate" Text="--,,--" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="3"></td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="Label14" Text="Limit" runat="server"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="Label15" Text=":" runat="server"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lbl_limit" Text="--,,--" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                    <div class="Table_LikeDiV">
                                                        <table style="width: 80px; height: 35px;">
                                                            <tr>
                                                                <td>
                                                                    <img id="img_AddAppo" src="../../Image/icn_addAppo.png" width="35px" height="35px"
                                                                        alt="" onclick="fn_AddAppointment();" />
                                                                </td>
                                                                <td>
                                                                    <asp:ImageButton ID="imgBtn_Refresh" Width="38px" Height="38px" ImageUrl="~/Image/refresh.png"
                                                                        runat="server" />
                                                                </td>
                                                                <td></td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="3">
                                                    <hr />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <table style="width: 100%">
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="Label7" Text="Session-I" runat="server"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="Label8" Text=":" runat="server"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lbl_session1" Text="--,,--" runat="server"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="Label9" Text="Session-II" runat="server"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="Label10" Text=":" runat="server"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lbl_session2" Text="--,,--" runat="server"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="3">
                                                                <hr />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="3">
                                                                <table style="width: 100%">
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Label ID="Label11" Text="Priority From" runat="server"></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="Label12" Text="Resc. After" runat="server"></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="Label13" Text="Cancel After" runat="server"></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Label ID="lbl_PriorityFrom" Text="--,,--" runat="server"></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="lbl_RescAfter" Text="--,,--" runat="server"></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="lbl_CancelAfter" Text="--,,--" runat="server"></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <%--  <tr>
                                                                    <td>
                                                                        <asp:Label ID="Label16" Text="Approx." runat="server"></asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label ID="Label17" Text=":" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label ID="lbl_approx" Text="--,,--" runat="server"></asp:Label>
                                                                    </td>
                                                                </tr>--%>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <hr />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <Ajax:TabContainer ID="TabContainer1" CssClass="Tab" runat="server" >
                                        <Ajax:TabPanel ID="TabPanel1" runat="server" HeaderText="Appointment Queue">
                                            <HeaderTemplate>
                                                <table cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td>
                                                            <img src="../../Image/AppointmentQ.png" width="30px" height="30px" style="margin-right: 2px;" /></td>
                                                        <td><span class="Label_Normal">Appointment Queue</span></td>
                                                    </tr>
                                                </table>
                                            </HeaderTemplate>
                                            <ContentTemplate>
                                                <asp:GridView ID="grd_patientQueue" ClientIDMode="Static" ShowHeaderWhenEmpty="true" runat="server" AutoGenerateColumns="false"
                                                    DataKeyNames="PK_QueueID" CellPadding="4" ForeColor="#333333" GridLines="None"
                                                    RowStyle-CssClass="row" CssClass="mGrid" PagerStyle-CssClass="pgr">
                                                    <Columns>
                                                        <asp:BoundField HeaderText="PK_QueueID" DataField="PK_QueueID" HeaderStyle-CssClass="HideColumn"
                                                            ItemStyle-CssClass="HideColumn" FooterStyle-CssClass="HideColumn" />
                                                        <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center"
                                                            HeaderText="Token" DataField="TockenID" />
                                                        <asp:BoundField HeaderText="Name" ItemStyle-Width="180px" DataField="Name" />
                                                        <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center"
                                                            HeaderText="Next Token" DataField="Next_Tocken" />
                                                        <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center"
                                                            HeaderText="Old/New" DataField="Old_New" />
                                                        <asp:BoundField HeaderText="Location" DataField="Location" />
                                                        <asp:BoundField HeaderText="App.Time" DataField="App_Time" />
                                                        <asp:BoundField HeaderText="Apprx.Time" DataField="Approx_Time" />
                                                        <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center"
                                                            HeaderText="Re.Count" DataField="RescheduleCount" />
                                                        <asp:TemplateField HeaderText="#" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate >
                                                                <a onclick="Fn_RescheduleApp('<%#Eval("TockenID")%>');">RESCHEDULE</a>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="#" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <a onclick="Fn_CancleApp('<%#Eval("PK_QueueID")%>');">CANCEL</a>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField HeaderText="IsIn" DataField="IsIn" HeaderStyle-CssClass="HideColumn"
                                                            ItemStyle-CssClass="HideColumn" FooterStyle-CssClass="HideColumn" />
                                                        <asp:BoundField HeaderText="IsOut" DataField="IsOut" HeaderStyle-CssClass="HideColumn"
                                                            ItemStyle-CssClass="HideColumn" FooterStyle-CssClass="HideColumn" />
                                                        <asp:TemplateField HeaderText="#" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" ID="lblReport" Text='<%#Eval("ReportingTime")%>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="#" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <img onclick="fn_EditAppointment('<%#Eval("PK_PatientID")%>');" src="../../Image/edit_Notes.png" alt="" width="25px" height="20px" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <EmptyDataTemplate>
                                                        <table style="width: 100%">
                                                            <tr>
                                                                <td align="center">
                                                                    <img alt="?" src="../../Image/information.png" height="20px" width="20px" />
                                                                    <asp:Label ID="Label3" Text="No data found" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </EmptyDataTemplate>
                                                </asp:GridView>


                                            </ContentTemplate>
                                        </Ajax:TabPanel>
                                        
                                        <Ajax:TabPanel ID="TabPanel2" runat="server" HeaderText="Canceled Appointments">
                                            <HeaderTemplate>
                                                <table cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td>
                                                            <img src="../../Image/CanceledQ.png" width="30px" height="30px" style="margin-right: 2px;" /></td>
                                                        <td><span class="Label_Normal">Canceled Appointments</span></td>
                                                    </tr>
                                                </table>
                                            </HeaderTemplate>
                                            <ContentTemplate>
                                                <asp:GridView ID="grd_CancledAppointment" ClientIDMode="Static" ShowHeaderWhenEmpty="true" runat="server"
                                                    AutoGenerateColumns="False" DataKeyNames="PK_QueueID" CellPadding="4" ForeColor="#333333"
                                                    GridLines="None" RowStyle-CssClass="row" CssClass="mGrid" PagerStyle-CssClass="pgr">
                                                    <Columns>
                                                        <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center"
                                                            HeaderText="Tocken ID" DataField="PK_QueueID" HeaderStyle-CssClass="HideColumn"
                                                            ItemStyle-CssClass="HideColumn" FooterStyle-CssClass="HideColumn" />
                                                        <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center"
                                                            HeaderText="Token" DataField="TockenID" />
                                                        <asp:BoundField HeaderText="Full Name" ItemStyle-Width="160px" DataField="FullName" />
                                                        <asp:BoundField HeaderText="Re.Count" DataField="RescheduleCount" />
                                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center"
                                                            HeaderText="#">
                                                            <ItemTemplate>
                                                                <a onclick="Fn_AppointmentReset('<%#Eval("TockenID")%>');">Reset</a>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center"
                                                            HeaderText="#">
                                                            <ItemTemplate>
                                                                <a onclick="Fn_AppointmentDelete('<%#Eval("PK_QueueID")%>');">Delete</a>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <EmptyDataTemplate>
                                                        <table style="width: 100%">
                                                            <tr>
                                                                <td align="center">
                                                                    <img alt="?" src="../../Image/information.png" height="20px" width="20px" />
                                                                    <asp:Label ID="Label3" Text="No data found" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </EmptyDataTemplate>
                                                </asp:GridView>

                                            </ContentTemplate>
                                        </Ajax:TabPanel>

                                        <Ajax:TabPanel ID="TabPanel3" runat="server" HeaderText="Fees Collection">
                                            <HeaderTemplate>
                                                <table cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td>
                                                            <img src="../../Image/FeesCollection.png" width="30px" height="30px" style="margin-right: 2px;" /></td>
                                                        <td><span class="Label_Normal">Fees Collection</span></td>
                                                    </tr>
                                                </table>
                                            </HeaderTemplate>
                                            <ContentTemplate>
                                                
                                                <table style="margin-left: 10px;float:right; margin: 3px;">
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="Label16" Text="Tocken No :" runat="server"></asp:Label>
                                                            </td>
                                                             <td>
                                                                <asp:TextBox ID="txt_search_tockenNo" runat="server" Width="70px" CssClass="TextBox_Normal"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="Label17" Text="Patient No :" runat="server"></asp:Label>
                                                            </td>
                                                             <td>
                                                                <asp:TextBox ID="txt_search_PatientID" runat="server" Width="70px" CssClass="TextBox_Normal"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="Label18" Text="Name :" runat="server"></asp:Label>
                                                            </td>
                                                              <td>
                                                                <asp:TextBox ID="txt_search_Name" runat="server" CssClass="TextBox_Normal" Width="200px"></asp:TextBox>
                                                            </td>
                                                              <td>
                                                                <asp:ImageButton ID="img_search" runat="server" Height="25px" ImageUrl="~/Image/search.png"
                                                                    Width="25px" OnClick="img_search_Click" />
                                                            </td>
                                                              
                                                        </tr>
                                                    </table>
                                                 
                                                <asp:GridView AutoGenerateColumns="false" ClientIDMode="Static" ShowHeaderWhenEmpty="true" ID="grd_searchResult"
                                                    runat="server" ForeColor="#333333" GridLines="None" RowStyle-CssClass="row" CssClass="mGrid"
                                                    PagerStyle-CssClass="pgr">
                                                    <Columns>
                                                        <asp:BoundField HeaderText="Queue ID" DataField="PK_QueueID" HeaderStyle-CssClass="HideColumn"
                                                            ItemStyle-CssClass="HideColumn" FooterStyle-CssClass="HideColumn" />
                                                        <asp:BoundField HeaderText="AppointmentId" DataField="FK_AppointmentID" HeaderStyle-CssClass="HideColumn"
                                                            ItemStyle-CssClass="HideColumn" FooterStyle-CssClass="HideColumn" />
                                                        <asp:BoundField HeaderText="Token" ItemStyle-Width="10%"  ItemStyle-HorizontalAlign="Center" DataField="TockenID" />
                                                        <asp:BoundField HeaderText="Name" ItemStyle-Width="40%" DataField="FullName" />
                                                        <asp:TemplateField HeaderText="Free" ItemStyle-Width="10%" >
                                                            <ItemTemplate>
                                                                <input type="checkbox" id="chkFree" onclick="Fn_FreeChecked(this);" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Fees" ItemStyle-Width="10%" >
                                                            <ItemTemplate>
                                                                <asp:TextBox ID="txt_fees" Text='<%#Eval("Fees")%>' runat="server" Width="90%" CssClass="TextBox_Normal"></asp:TextBox>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField HeaderText="Status" DataField="FeesStatus" ItemStyle-Width="10%"  ItemStyle-HorizontalAlign="Center" />
                                                        <asp:TemplateField HeaderText="#" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="10%" >
                                                            <ItemTemplate>
                                                                <a onclick="Fn_Fees('<%#Eval("FK_AppointmentID")%>',this);">Pay</a>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center"
                                                            HeaderText="PayRemain" DataField="PayRemain" HeaderStyle-CssClass="HideColumn"
                                                            ItemStyle-CssClass="HideColumn" FooterStyle-CssClass="HideColumn" />
                                                        <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center"
                                                            HeaderText="LastOut" DataField="LastOut" HeaderStyle-CssClass="HideColumn" ItemStyle-CssClass="HideColumn"
                                                            FooterStyle-CssClass="HideColumn" />
                                                        <asp:BoundField HeaderText="IsIn" DataField="IsIn" HeaderStyle-CssClass="HideColumn"
                                                            ItemStyle-CssClass="HideColumn" FooterStyle-CssClass="HideColumn" />
                                                    </Columns>
                                                    <EmptyDataTemplate>
                                                        <table style="width: 100%">
                                                            <tr>
                                                                <td align="center">
                                                                    <img alt="?" src="../../Image/information.png" height="20px" width="20px" />
                                                                    <asp:Label ID="Label3" Text="No data found" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </EmptyDataTemplate>
                                                </asp:GridView>
                                                <asp:Label ID="lbl_result" Text="Result :" runat="server"></asp:Label>
                                            </ContentTemplate>
                                        </Ajax:TabPanel>

                                    </Ajax:TabContainer>


                                </td>
                            </tr>
                        </table>
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btn_IN" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="btn_SKIP" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="btn_Cancel" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="imgBtn_Refresh" EventName="Click" />
                </Triggers>
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

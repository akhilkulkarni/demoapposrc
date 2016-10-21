<%@ Page Language="C#" AutoEventWireup="true" CodeFile="appointment_patientQueue.aspx.cs" EnableEventValidation="false"
    Inherits="UI_Appointment_appointment_patientQueue" Theme="Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="Ajax" %>

<%@ Register TagName="UC_Header" TagPrefix="UC" Src="~/UC_Header_New.ascx" %>
<%@ Register TagName="UC_Footer" TagPrefix="UC" Src="~/UC_Footer.ascx" %>
<%@ Register TagName="UC_FormName" TagPrefix="UC" Src="~/UC_PageHeaderInfo.ascx" %>
<%@ Register TagName="UC_ErrorName" TagPrefix="UC" Src="~/UC_ErrorMessageInfo.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="<%# Page.ResolveUrl("~/JS/jquery-1.12.4.js")%>" type="text/javascript"></script>
    <script src="<%# Page.ResolveUrl("~/JS/jquery-ui.1.12.1.js")%>" type="text/javascript"></script>
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

    <link href="<%# Page.ResolveUrl("~/CSS/jquery.timeentry.css")%>" rel="stylesheet" type="text/css" />
    <script src="<%# Page.ResolveUrl("~/JS/jquery.timeentry.js")%>" type="text/javascript"></script>
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
            color: white;
            font-family: 'Arial Rounded MT';
            font-size: 13px;
            background-color: #77cc6d;
            border: 1px solid #808080;
            font-weight: bolder;
        }

        .BTN_RESCHEDULE:hover
        {
            background-color: #2ca9bf;
        }

        .BTN_RESCHEDULE
        {
            color: white;
            font-family: 'Arial Rounded MT';
            font-size: 13px;
            background-color: #2ac4ea;
            border: 1px solid #808080;
            font-weight: bold;
        }

        .BTN_CANCEL:hover
        {
            background-color: #ff8f8f;
        }

        .BTN_CANCEL
        {
            color: white;
            font-family: 'Arial Rounded MT';
            font-size: 13px;
            background-color: #ff6161;
            border: 1px solid #808080;
            font-weight: bold;
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

          

            if ($row != null && $row != undefined && $row.length >1 )
            {
                for (var i = 1; i < $row.length; i++) {
                    
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
        }

        function fn_FilColorScheme_PaymentQueue() {

            var $row = $("#grd_searchResult").find("tr");
            var scrollToE;
            if ($row != null && $row != undefined && $row.length >1) {
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

        }



        function fn_RefreshPage() {

            __doPostBack('imgBtn_Refresh', '');
            Page_FormLoad();
        }
        $(document).ready(function () {
             
            Page_FormLoad();
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
            margin-top: 5px;
             -webkit-box-shadow: 0 8px 6px -6px black;
     -moz-box-shadow: 0 8px 6px -6px black;
          box-shadow: 0 8px 6px -6px black;
        }

            .div_Appo_Out .count
            {
                vertical-align: central;
                text-align: center;
                font-size: 70px;
                font-weight: bold;
                font-family:'Arial Rounded MT';
                color: white;
                width: 280px;
                height: 90px;
                background: #e01384;
            }

            .div_Appo_Out .text
            {
                width: 280px;
                height: 60px;
                background-color: #eaeaea;
                vertical-align: central;
                text-align: left;
                font-size: 15px;
                font-weight: bold;
                color: black;
            }

                .div_Appo_Out .text .dvImage
                {
                    width: 60px;
                    height: 60px;
                    float: left;
                    vertical-align:central;
                    text-align:center;
                }

                .div_Appo_Out .text img
                {
                    margin-top:5px;
                    width: 50px;
                    height: 50px;
                    border:1px solid #79ad7d;

                    -moz-border-radius: 25px;
                    -webkit-border-radius: 25px;
                    border-radius: 25px; /* future proofing */
                    -khtml-border-radius: 25px; /* for old Konqueror browsers */
                    
                }
                .div_Appo_Out .text .dvInfo
                {
                    margin-top: 10px;
                    height: 50px;
                    width: 220px;
                    float: right;
                }

                    .div_Appo_Out .text .dvInfo .Status
                    {
                          font-size: 11px;
                          font-family:'Arial Rounded MT';
                              font-weight:bolder;
                        background-color: #ce1b09;
                        color: #eaeaea;
                        padding: 3px;
                        margin-top: 5px!important;
                        padding-left:15px;
                        padding-right:15px;display: inline-block;

                        -moz-border-radius: 5px;
                        -webkit-border-radius: 5px;
                        border-radius: 5px; /* future proofing */
                        -khtml-border-radius: 5px; /* for old Konqueror browsers */
                    }
        /*===============================================================================================*/
        .div_Appo_IN
        {
            width: 280px;
            height: 150px;
        -webkit-box-shadow: 0 8px 6px -6px black;
     -moz-box-shadow: 0 8px 6px -6px black;
          box-shadow: 0 8px 6px -6px black;
 
        }

            .div_Appo_IN .count
            {
                vertical-align: central;
                text-align: center;
                font-size: 70px;
                font-family:'Arial Rounded MT';
                font-weight: bold;
                color: white;
                width: 280px;
                height: 90px;
                background: #65d58a; /* Old browsers */
            }

            .div_Appo_IN .text
            {
                width: 280px;
                height: 60px;
                background-color: #eaeaea;
                vertical-align: central;
                text-align: left;
                font-size: 15px;
                font-weight: bold;
                color: black;
            }

                .div_Appo_IN .text .dvImage
                 {
                    width: 60px;
                    height: 60px;
                    float: left;
                    vertical-align:central;
                    text-align:center;
                }

                .div_Appo_IN .text img
                {
                    margin-top:5px;
                    width: 50px;
                    height: 50px;
                    border:1px solid #79ad7d;

                    -moz-border-radius: 25px;
                    -webkit-border-radius: 25px;
                    border-radius: 25px; /* future proofing */
                    -khtml-border-radius: 25px; /* for old Konqueror browsers */
                    
                }
                .div_Appo_IN .text .dvInfo
                {
                    margin-top: 10px;
                    height: 50px;
                    width: 220px;
                    float: right;
                }

                    .div_Appo_IN .text .dvInfo .Status
                    {
                       
                          font-size: 11px;
                          font-family:'Arial Rounded MT';
                              font-weight:bolder;
                        background-color: #1fdc63;
                        color: #FFF;
                        padding: 3px;
                        margin-top: 5px!important;
                        padding-left:25px;
                        padding-right:25px;display: inline-block;

                        
                        -moz-border-radius: 5px;
                        -webkit-border-radius: 5px;
                        border-radius: 5px; /* future proofing */
                        -khtml-border-radius: 5px; /* for old Konqueror browsers */
                    }
        /*=================================================================================*/
        .div_Appo_Next
        {
            width: 280px;
            height: 150px;
            margin-top: 5px;
             -webkit-box-shadow: 0 8px 6px -6px black;
     -moz-box-shadow: 0 8px 6px -6px black;
          box-shadow: 0 8px 6px -6px black;
        }

            .div_Appo_Next .count
            {
                vertical-align: central;
                text-align: center;
                font-size: 70px;
                font-family:'Arial Rounded MT';
                font-weight: bold;
                color: white;
                width: 280px;
                height: 90px;
                background: #e01384;
            }

            .div_Appo_Next .text
            {
                width: 280px;
                height: 60px;
                background-color: #eaeaea;
                vertical-align: central;
                text-align: left;
                font-size: 15px;
                font-weight: bold;
                color: black;
            }

                .div_Appo_Next .text .dvImage
                   {
                    width: 60px;
                    height: 60px;
                    float: left;
                    vertical-align:central;
                    text-align:center;
                }

                .div_Appo_Next .text img
                {
                    margin-top:5px;
                    width: 50px;
                    height: 50px;
                    border:1px solid #79ad7d;

                    -moz-border-radius: 25px;
                    -webkit-border-radius: 25px;
                    border-radius: 25px; /* future proofing */
                    -khtml-border-radius: 25px; /* for old Konqueror browsers */
                    
                }
                .div_Appo_Next .text .dvInfo
                {
                    margin-top: 10px;
                    height: 50px;
                    width: 220px;
                    float: right;
                }

                    .div_Appo_Next .text .dvInfo .Status
                    {
                       
                          font-size: 11px;
                          font-family:'Arial Rounded MT';
                              font-weight:bolder;
                        background-color: #2566cc;
                        color: #FFF;
                        padding: 3px;
                        margin-top: 5px!important;
                        padding-left:10px;
                        padding-right:10px;display: inline-block;

                        
                        -moz-border-radius: 5px;
                        -webkit-border-radius: 5px;
                        border-radius: 5px; /* future proofing */
                        -khtml-border-radius: 5px; /* for old Konqueror browsers */
                    }
    </style>

    <%-- ###################################################################################################################### --%>
    <style type="text/css">
        .style1
        {
            width: 1px;
        }

        .style2
        {
            width: 108px;
        }

        .style3
        {
            width: 16px;
        }

        .style4
        {
            width: 94px;
        }

        input[type=checkbox]
        {
            display: none;
        }

            input[type=checkbox] + label
            {
                border-left: 1px solid #e6e6e6;
                border-right: 1px solid #e6e6e6;
                border-top: 1px solid #e6e6e6;
                border-bottom: 1px solid #b3b3b3;
                display: inline-block;
                padding: 4px 12px;
                margin-bottom: 0;
                font-size: 14px;
                line-height: 25px;
                color: #333;
                text-align: center;
                text-shadow: 0 1px 1px rgba(255,255,255,0.75);
                vertical-align: middle;
                cursor: pointer;
                background-color: #f5f5f5;
                background-repeat: repeat-x;
                -webkit-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05);
                -moz-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05);
                box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05);
                background-image: linear-gradient(to bottom,#fff,#e6e6e6);
                margin-left: -2px;
                margin-right: -2px;
                margin-top: -2px;
                height:25px;
                       min-width:133px;
            }

            input[type=checkbox]:checked + label
            {
                background-image: none;
                outline: 0;
                -webkit-box-shadow: inset 0 2px 4px rgba(0,0,0,0.15),0 1px 2px rgba(0,0,0,0.05);
                -moz-box-shadow: inset 0 2px 4px rgba(0,0,0,0.15),0 1px 2px rgba(0,0,0,0.05);
                box-shadow: inset 0 2px 4px rgba(0,0,0,0.15),0 1px 2px rgba(0,0,0,0.05);
                background-color: #CCC1DA;
            }



        input[type=radio]
        {
            display: none;
        }

            input[type=radio] + label
            {
                border-left: 1px solid #e6e6e6;
                border-right: 1px solid #e6e6e6;
                border-top: 1px solid #e6e6e6;
                border-bottom: 1px solid #b3b3b3;
                display: inline-block;
                padding: 4px 12px;
                margin-bottom: 0;
                font-size: 14px;
                line-height: 25px;
                color: #333;
                text-align: center;
                text-shadow: 0 1px 1px rgba(255,255,255,0.75);
                vertical-align: middle;
                cursor: pointer;
                background-color: #f5f5f5;
                background-repeat: repeat-x;
                -webkit-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05);
                -moz-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05);
                box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05);
                background-image: linear-gradient(to bottom,#fff,#e6e6e6);
                margin-left: -2px;
                margin-right: -2px;
                margin-top: -2px;
                 height:25px;
                 min-width:150px;
            }

            input[type=radio]:checked + label
            {
                background-image: none;
                outline: 0;
                -webkit-box-shadow: inset 0 2px 4px rgba(0,0,0,0.15),0 1px 2px rgba(0,0,0,0.05);
                -moz-box-shadow: inset 0 2px 4px rgba(0,0,0,0.15),0 1px 2px rgba(0,0,0,0.05);
                box-shadow: inset 0 2px 4px rgba(0,0,0,0.15),0 1px 2px rgba(0,0,0,0.05);
                background-color: #CCC1DA;
            }

        .style6
        {
            width: 4px;
        }

        .style7
        {
            width: 450px;
        }

        .Display_Table
        {
            padding: 0px;
        }

            .Display_Table tr
            {
                height: 35px;
            }

                .Display_Table tr th
                {
                    font-size: 14px!important;
                    font-weight: bolder;
                    font-family: Verdana,sans-serif;
                }

                .Display_Table tr .HeadTD
                {
                    background-color: #e6e6e6;
                    width: 25%;
                    text-wrap: none;
                    font-size: 12px;
                    font-weight: bold;
                    padding-left: 10px;
                    border-left: 0.5px solid #e2e2e2;
                    border-top: 0.5px solid #e2e2e2;
                }

                .Display_Table tr .Colon
                {
                    border-right: 1px solid #e2e2e2;
                    border-top: 1px solid #e2e2e2;
                    background-color: #e6e6e6;
                    width: 2%;
                }

                .Display_Table tr .TextTD
                {
                    border: 1px solid #e2e2e2;
                    white-space: nowrap;
                    border-bottom-style: none;
                    padding-left:15px!important;
                  
                }
    </style>
    <script type="text/javascript">
        function Fn_CLosePopUp() {

            parent.jQuery.colorbox.close();
        }

        function Page_FormLoad() {
            

            $("#txtPatient_Name").focus();
            $("#txtPatient_Name").select();

            $("#txtPatient_Name").keypress(function (evt) {
                console.log("Handler for .keypress() called.");
                if (evt.charCode == 13) {

                    return false;
                }
            })
            $("#txtPatient_Name").autocomplete({
                minLength: 0,
                source: function (request, response) {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "appointment_patientQueue.aspx/GetPatientList",
                        data: "{'SearchText':'" + $('#txtPatient_Name').val() + "'}",
                        dataType: "json",
                        success: function (data) {
                            response(data.d);
                        },
                        error: function (result) {
                            alert("Error");
                        }
                    });
                },
                focus: function (event, ui) {
                    //$("#txtPatient_Name").val(ui.item.FullName);
                    // $("#txtPatient_ID").val(ui.item.PK_PatientID);
                    return false;
                },
                response: function (event, ui) {
                    if (ui.content.length == 1) {
                        $("#txtPatient_Name").val(ui.content[0].FullName);
                        $("#txtPatient_ID").val(ui.content[0].PK_PatientID);
                        $(this).autocomplete("close");
                        __doPostBack("btn_LoadData");

                    }
                    else if (ui.content.length == 0) {
                        //$("#txtPatient_Name").val("");
                        //$("#txtPatient_ID").val("");
                        //__doPostBack("btn_LoadData");
                    }

                },
                select: function (event, ui) {
                    $("#txtPatient_Name").val(ui.item.FullName);
                    $("#txtPatient_ID").val(ui.item.PK_PatientID);
                    __doPostBack("btn_LoadData");
                    return false;
                },
                success: function (response) {
                    $("#txtPatient_Name").autocomplete({ source: JSON.stringify(response) });

                },
                error: function (result) {
                    alert("Error");
                }
            })
            .autocomplete("instance")._renderItem = function (ul, item) {


                //.append("<div>" + + "<br>" + + "<br>" + item.Location + "</div>")
                return $("<li class='AutocompleteLI'>")
                  .append("<table class='AutoCompleteTabel' style='width:100%'><tr><td class='ImageTD' rowspan='3'><img class='PatientImage' src= '" + item.ImageUrl + "'></td><td><span class='Name'>" + item.FullName + "</span></td></tr><tr><td>" + item.MobileNo + "</td></tr><tr><td>" + item.Location + "</td></tr></table>")
                  .appendTo(ul);
            };

            //*****************************************************************************************************
            $("#txt_appointmentTime").timeEntry({
                show24Hours: true,
                showSeconds: true,
                spinnerImage: "spinnerSquare.png",
                spinnerSize: [20, 20, 0],
                spinnerBigSize: [40, 40, 0],
                timeSteps: [1, 5, 1]
                //,minTime: '08:30AM', maxTime: '05:30PM' 
            });
            //*****************************************************************************************************

            //===========================================================================
            //Date Picker
            //===========================================================================

            $("#txt_appointmentDate").datepicker({
                showOn: "button",
                buttonImage: "../../Image/calendar.gif",
                buttonImageOnly: true,
                showAnim: 'slideDown',
                changeMonth: true,
                changeYear: true,
                dateFormat: 'dd-mm-yy',
                minDate: -0,
                currentText: 'Now'
            });

            //*****************************************************************************************************
            fn_FilColorScheme();
        }

        function fn_ReloadControls() {
            //===========================================================================
            // Time Picker  
            //===========================================================================

            $("#txt_appointmentTime").timeEntry();
            $("#txt_appointmentTime").timeEntry({
                show24Hours: true,
                showSeconds: true,
                spinnerImage: "spinnerSquare.png",
                spinnerSize: [20, 20, 0],
                spinnerBigSize: [40, 40, 0],
                timeSteps: [1, 5, 1]
                //,minTime: '08:30AM', maxTime: '05:30PM' 
            });


            //===========================================================================
            //Date Picker
            //===========================================================================

            $("#txt_appointmentDate").datepicker({
                showOn: "button",
                buttonImage: "../../Image/calendar.gif",
                buttonImageOnly: true,
                showAnim: 'slideDown',
                changeMonth: true,
                changeYear: true,
                dateFormat: 'dd-mm-yy',
                minDate: -0,
                currentText: 'Now'
            });

            var d = new Date();

            var strDate = pad(d.getDate() + "", 2) + "-" + pad((d.getMonth() + 1) + "", 2) + "-" + d.getFullYear();

            $("#txt_appointmentDate").val(strDate);


        }
       
    </script>
    <script type="text/javascript">
        $(function () {
            $("#txt_appointmentDate").datepicker({
                showOn: "button",
                buttonImage: "../../Image/calendar.gif",
                buttonImageOnly: true,
                showAnim: 'slideDown',
                changeMonth: true,
                changeYear: true,
                dateFormat: 'dd-mm-yy',
                minDate: -0,
                currentText: 'Now'
            });

            var d = new Date();

            var strDate = pad(d.getDate() + "", 2) + "-" + pad((d.getMonth() + 1) + "", 2) + "-" + d.getFullYear();

            $("#txt_appointmentDate").val(strDate);

        });

        function pad(str, max) {
            return str.length < max ? pad("0" + str, max) : str;
        }
    </script>
    <script type="text/javascript">

        function fn_clear() {
            document.forms[0].reset();
            return false;
        }

        function validation() {
            document.getElementById("txt_appointmentDate").style.backgroundColor = "white";
            document.getElementById("txtPatient_Name").style.backgroundColor = "white";
            if (document.getElementById("txtPatient_Name").value == "") {
                alert("Pleas Enter Name Firsrt");
                document.getElementById("txtPatient_Name").focus();
                document.getElementById("txtPatient_Name").style.backgroundColor = "red";
                return false;
            }
            if (document.getElementById("txt_appointmentDate").value == "") {
                alert("Please Enter Date");
                document.getElementById("txt_appointmentDate").focus();
                document.getElementById("txt_appointmentDate").style.backgroundColor = "red";
                return false;
            }

            if (document.getElementById("rdo_local").checked == false && document.getElementById("rdo_outside").checked == false) {
                alert("Please Select Patient Local/Outside");
                return false;
            }

            if (document.getElementById("rdo_new").checked == false && document.getElementById("rdo_old").checked == false) {
                alert("Please Select Patient New/old");
                return false;
            }
            if (document.getElementById("chk_demandTime").checked == true && document.getElementById("txt_appointmentTime").value == '') {
                alert("Please enter demand time!");
                return false;
            }
            return true;
        }
    </script>

    <style type="text/css">
        .AutocompleteLI
        {
            border-top: 1px solid #808080;
            padding: 1px;
            background-color: #efefef;
            background: -webkit-gradient(linear, 0 0, 0 bottom, from(#f2f2f2), to(#efefef));
            background: -moz-linear-gradient(#f2f2f2, #efefef);
            background: linear-gradient(#f2f2f2, #efefef);
            -pie-background: linear-gradient(#f2f2f2, #efefef);
        }

            .AutocompleteLI:hover
            {
                border: none!important;
                border-top: 1px solid #808080!important;
                padding: 1px!important;
                background-color: #CCC1DA!important;
            }

        .AutoCompleteTabel
        {
            text-align: left;
            font-family: Calibri;
            font-size: 13px;
        }

            .AutoCompleteTabel img
            {
                border: 1px solid #808080;
                width: 40px;
                height: 50px;
                background-color: #FFF;
            }

        .ImageTD
        {
            width: 35px;
            height: 50px;
        }

        .AutoCompleteTabel .Name
        {
            color: #6696ed;
            font-weight: bold;
            font-size: 14px;
            white-space: nowrap;
        }

        .ui-autocomplete
        {
            width: 300px;
            max-height: 50%;
            overflow-y: auto;
            /* prevent horizontal scrollbar */
            overflow-x: hidden;
        }

        .ui-menu-item-wrapper:hover
        {
            border: none;
        }

        .dv_AppointmentAdd
        {
            width: 95%;
            border: 1px solid #e1e1e1;
            float: left;
            margin-top:5px;
    -webkit-box-shadow:0 1px 4px rgba(0, 0, 0, 0.3), 0 0 40px rgba(0, 0, 0, 0.1) inset;
       -moz-box-shadow:0 1px 4px rgba(0, 0, 0, 0.3), 0 0 40px rgba(0, 0, 0, 0.1) inset;
            box-shadow:0 1px 4px rgba(0, 0, 0, 0.3), 0 0 40px rgba(0, 0, 0, 0.1) inset;
        }

        .dv_TokenData
        {
            width: 100%;
               -webkit-box-shadow:0 1px 4px rgba(0, 0, 0, 0.3), 0 0 40px rgba(0, 0, 0, 0.1) inset;
       -moz-box-shadow:0 1px 4px rgba(0, 0, 0, 0.3), 0 0 40px rgba(0, 0, 0, 0.1) inset;
            box-shadow:0 1px 4px rgba(0, 0, 0, 0.3), 0 0 40px rgba(0, 0, 0, 0.1) inset;
        }
    </style>
    <%-- ###################################################################################################################### --%>
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
                    <asp:ImageButton ID="imgBtn_Refresh" ClientIDMode="Static" OnClick="imgBtn_Refresh_Click" CssClass="Display_None" Width="38px" Height="38px" ImageUrl="~/Image/refresh.png"
                        runat="server" />
                   <asp:Button ID="btn_LoadData" ClientIDMode="Static" runat="server" CssClass="Display_None" OnClick="btn_LoadData_Click" />
                    <table style="width: 100%">
                        <tr>
                            <td>
                                <table>
                                    <tr>
                                        <td style="vertical-align: top">
                                            <div class="div_Appo_Out">
                                                <div class="count">
                                                    <asp:Label ID="lbl_prevNo" runat="server" Text="0"></asp:Label>
                                                </div>
                                                <div class="text">
                                                    <div class="dvImage">
                                                        <asp:Image runat="server" ID="IMG_Prev" />
                                                    </div>
                                                    <div class="dvInfo">
                                                        <span class="Name">
                                                            <asp:Label ID="lbl_prevText" runat="server" Text="Previous Patient"></asp:Label></span>
                                                        <br />
                                                        <span class="Status">
                                                            <asp:Label ID="Label4" runat="server" Text="Out.."></asp:Label></span>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                        <td align="center" style="vertical-align: top">
                                            <div class="div_Appo_IN">
                                                <div class="count">
                                                    <asp:Label ID="lbl_currentNo" runat="server" Text="1"></asp:Label>
                                                </div>
                                                <div class="text">
                                                    <div class="dvImage">
                                                        <asp:Image runat="server" ID="IMG_Curr" />
                                                    </div>
                                                    <div class="dvInfo">
                                                        <span class="Name">
                                                            <asp:Label ID="lbl_currentText" runat="server" Text="Current Patient"></asp:Label>
                                                        </span>
                                                        <br />
                                                        <span class="Status">
                                                            <asp:Label ID="lbl_status" runat="server" Text="Current Patient"></asp:Label>
                                                        </span>
                                                    </div>

                                                </div>
                                            </div>
                                        </td>
                                        <td style="vertical-align: top">
                                            <div class="div_Appo_Next">
                                                <div class="count">
                                                    <asp:Label ID="lbl_nextNo" runat="server" Text="2"></asp:Label>
                                                </div>
                                                <div class="text">
                                                    <div class="dvImage">
                                                        <asp:Image runat="server" ID="IMG_Next"/>
                                                    </div>
                                                    <div class="dvInfo">
                                                        <span class="Name">
                                                            <asp:Label ID="lbl_nextText" runat="server" Text="Next Patient"></asp:Label></span>
                                                        <br />
                                                        <span class="Status">
                                                            <asp:Label ID="lbl_NextStatus" runat="server" Text="Waiting.."></asp:Label></span>
                                                    </div>

                                                </div>
                                            </div>
                                        </td>
                                        <td rowspan="2" style="vertical-align: top">
                                            <Ajax:TabContainer ID="TabContainer2" CssClass="Tab" runat="server">
                                                <Ajax:TabPanel ID="TabPanel4" runat="server" HeaderText="Appointment Queue">
                                                    <HeaderTemplate>
                                                        <table cellpadding="0" cellspacing="0">
                                                            <tr>
                                                                <td>
                                                                    <img src="../../Image/Schedule.png" width="30px" height="30px" style="margin-right: 2px;" /></td>
                                                                <td><span class="Label_Normal">Schedule</span></td>
                                                            </tr>
                                                        </table>
                                                    </HeaderTemplate>
                                                    <ContentTemplate>

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
                                                                        <div class="Table_LikeDiV" style="display: none;">
                                                                            <table style="width: 80px; height: 35px;">
                                                                                <tr>
                                                                                    <td>
                                                                                        <img id="img_AddAppo" src="../../Image/icn_addAppo.png" width="35px" height="35px"
                                                                                            alt="" onclick="fn_AddAppointment();" />
                                                                                    </td>
                                                                                    <td></td>
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

                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </div>


                                                    </ContentTemplate>
                                                </Ajax:TabPanel>
                                                <Ajax:TabPanel ID="TabPanel5" runat="server" HeaderText="Notifications">

                                                    <HeaderTemplate>
                                                        <table cellpadding="0" cellspacing="0">
                                                            <tr>
                                                                <td>
                                                                    <img src="../../Image/Notification.png" width="30px" height="30px" style="margin-right: 2px;" /></td>
                                                                <td><span class="Label_Normal">Notifications</span></td>
                                                            </tr>
                                                        </table>
                                                    </HeaderTemplate>
                                                    <ContentTemplate>
                                                    </ContentTemplate>
                                                </Ajax:TabPanel>
                                                <Ajax:TabPanel ID="TabPanel6" runat="server" HeaderText="Notes">

                                                    <HeaderTemplate>
                                                        <table cellpadding="0" cellspacing="0">
                                                            <tr>
                                                                <td>
                                                                    <img src="../../Image/Notes-icon.png" width="30px" height="30px" style="margin-right: 2px;" /></td>
                                                                <td><span class="Label_Normal">Notes</span></td>
                                                            </tr>
                                                        </table>
                                                    </HeaderTemplate>
                                                    <ContentTemplate>
                                                    </ContentTemplate>
                                                </Ajax:TabPanel>
                                            </Ajax:TabContainer>
                                        </td>

                                    </tr>
                                    <tr>

                                        <td colspan="3" align="center">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <asp:Button ID="btn_IN" runat="server" Text="IN" CssClass="Button_Normal" Width="110px" OnClick="btn_IN_Click"
                                                            Height="35px" />
                                                    </td>
                                                    <td>
                                                        <asp:Button ID="btn_SKIP" runat="server" CssClass="Button_Normal" Text="RESCHEDULE" Width="110px" Height="35px"
                                                            OnClick="btn_SKIP_Click" />
                                                    </td>
                                                    <td>
                                                        <asp:Button ID="btn_Cancel" runat="server" CssClass="Button_Normal" Text="CANCEL" Width="110px" Height="35px"
                                                            OnClick="btn_Cancel_Click" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>

                                    </tr>
                                </table>


                            </td>
                        </tr>
                        <tr>
                            <td>
                                <Ajax:TabContainer ID="TabContainer1" CssClass="Tab" runat="server">
                        

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
                                            <asp:GridView ID="grd_patientQueue" ClientIDMode="Static" ShowHeaderWhenEmpty="True" runat="server" AutoGenerateColumns="False"
                                                DataKeyNames="PK_QueueID" CellPadding="4" ForeColor="#333333" GridLines="None" CssClass="mGrid">
                                                <Columns>
                                                    <asp:BoundField HeaderText="PK_QueueID" DataField="PK_QueueID">
                                                        <FooterStyle CssClass="HideColumn" />
                                                        <HeaderStyle CssClass="HideColumn" />
                                                        <ItemStyle CssClass="HideColumn" />
                                                    </asp:BoundField>
                                                    <asp:BoundField
                                                        HeaderText="Token" DataField="TockenID">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField HeaderText="Name" DataField="Name">
                                                        <ItemStyle Width="180px" />
                                                    </asp:BoundField>
                                                    <asp:BoundField
                                                        HeaderText="Next Token" DataField="Next_Tocken">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField
                                                        HeaderText="Old/New" DataField="Old_New">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField HeaderText="Location" DataField="Location" />
                                                    <asp:BoundField HeaderText="App.Time" DataField="App_Time" />
                                                    <asp:BoundField HeaderText="Apprx.Time" DataField="Approx_Time" />
                                                    <asp:BoundField
                                                        HeaderText="Re.Count" DataField="RescheduleCount">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:TemplateField HeaderText="#">
                                                        <ItemTemplate>
                                                            <a onclick="Fn_RescheduleApp('<%#Eval("TockenID")%>');">RESCHEDULE</a>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="#">
                                                        <ItemTemplate>
                                                            <a onclick="Fn_CancleApp('<%#Eval("PK_QueueID")%>');">CANCEL</a>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:BoundField HeaderText="IsIn" DataField="IsIn">
                                                        <FooterStyle CssClass="HideColumn" />
                                                        <HeaderStyle CssClass="HideColumn" />
                                                        <ItemStyle CssClass="HideColumn" />
                                                    </asp:BoundField>
                                                    <asp:BoundField HeaderText="IsOut" DataField="IsOut">
                                                        <FooterStyle CssClass="HideColumn" />
                                                        <HeaderStyle CssClass="HideColumn" />
                                                        <ItemStyle CssClass="HideColumn" />
                                                    </asp:BoundField>
                                                    <asp:TemplateField HeaderText="#">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" ID="lblReport" Text='<%#Eval("ReportingTime")%>' />
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="#">
                                                        <ItemTemplate>
                                                            <img onclick="fn_EditAppointment('<%#Eval("PK_PatientID")%>');" src="../../Image/edit_Notes.png" alt="" width="25px" height="20px" />
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
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
                                                <PagerStyle CssClass="pgr" />
                                                <RowStyle CssClass="row" />
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

                                            <table style="margin-left: 10px; float: right; margin: 3px;">
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
                                                    <asp:BoundField HeaderText="Token" ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Center" DataField="TockenID" />
                                                    <asp:BoundField HeaderText="Name" ItemStyle-Width="40%" DataField="FullName" />
                                                    <asp:TemplateField HeaderText="Free" ItemStyle-Width="10%">
                                                        <ItemTemplate>
                                                            <input type="checkbox" id="chkFree" onclick="Fn_FreeChecked(this);" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Fees" ItemStyle-Width="10%">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="txt_fees" Text='<%#Eval("Fees")%>' runat="server" Width="90%" CssClass="TextBox_Normal"></asp:TextBox>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField HeaderText="Status" DataField="FeesStatus" ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Center" />
                                                    <asp:TemplateField HeaderText="#" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="10%">
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
                                             <Ajax:TabPanel ID="TabPanel7" runat="server" HeaderText="New Appointment">
                                        <HeaderTemplate>
                                            <table cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td>
                                                        <img src="../../Image/NewAppointment.png" width="30px" height="30px" style="margin-right: 2px;" /></td>
                                                    <td><span class="Label_Normal">New Appointment</span></td>
                                                </tr>
                                            </table>
                                        </HeaderTemplate>
                                        <ContentTemplate>
                                            <table style="width: 100%">
                                                <tr>
                                                    <td style="width: 30%; vertical-align: top;">
                                                        <div class="dv_AppointmentAdd">
                                                            <table style="line-height: 25px; margin: 10px; margin-left: 30px;">
                                                                <tr>
                                                                    <td>
                                                                        <asp:Label ID="lblPatient_Name" Text="Patient Name" CssClass="Label_Bold" runat="server"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <asp:TextBox ID="txtPatient_ID" ClientIDMode="Static" CssClass="Display_None" runat="server" Width="230px"></asp:TextBox>
                                                                        <asp:TextBox ID="txtPatient_Name" ClientIDMode="Static" CssClass="TextBox_Normal" runat="server" Width="350px"></asp:TextBox>

                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <asp:Label ID="lblLocality" Text="Locality" CssClass="Label_Bold" runat="server"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <table>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:RadioButton ID="rdo_local" ClientIDMode="Static" GroupName="isLocal" runat="server" Text="Localite"
                                                                                        Checked="true" />
                                                                                </td>
                                                                                <td>
                                                                                    <asp:RadioButton ID="rdo_outside" ClientIDMode="Static" GroupName="isLocal" runat="server" Text="Outside" />
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>

                                                                <tr>
                                                                    <td>

                                                                        <asp:Label ID="lblPatient_Type" Text="Patient Type" CssClass="Label_Bold" runat="server"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <table>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:RadioButton ID="rdo_new" ClientIDMode="Static" GroupName="patientType" runat="server" Text="&nbsp;&nbsp;New&nbsp;&nbsp;&nbsp;" Checked="true" />
                                                                                </td>
                                                                                <td>
                                                                                    <asp:RadioButton ID="rdo_old" ClientIDMode="Static" GroupName="patientType" runat="server" Text="&nbsp;&nbsp;&nbsp;Old&nbsp;&nbsp;&nbsp;" />
                                                                                </td>
                                                                            </tr>
                                                                        </table>

                                                                    </td>
                                                                </tr>

                                                                <tr>
                                                                    <td>
                                                                        <asp:Label ID="lblPatient_Type0" runat="server" CssClass="Label_Bold" Text="Appointment Date"></asp:Label></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <asp:TextBox ID="txt_appointmentDate" ClientIDMode="Static" runat="server" Width="155px" OnTextChanged="txt_appointmentDate_TextChanged"></asp:TextBox></td>
                                                                </tr>

                                                                <tr>
                                                                    <td>
                                                                        <asp:Label ID="Label2" runat="server" CssClass="Label_Bold" Text="Appointment Time"></asp:Label></td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="white-space: nowrap">
                                                                        <asp:TextBox ID="txt_appointmentTime" ClientIDMode="Static" runat="server" Width="155px"></asp:TextBox>&nbsp;&nbsp;&nbsp;<asp:CheckBox ID="chk_demandTime" ClientIDMode="Static" Width="155px" runat="server" Text="Demand Time" /></td>
                                                                </tr>
                                                                <tr align="right">
                                                                    <td><asp:Label ID="Label29" runat="server" CssClass="Label_Normal" Font-Bold="true" ForeColor="#ff0000" Font-Size="Smaller" Text="(Want appointment at Specific time?)"></asp:Label>
                                                                        </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="center">
                                                                        <asp:Button ID="btn_AppointmentSaveAppoint" ClientIDMode="Static" runat="server" CssClass="Button_Normal a-btn"
                                                                            Text="Save &amp; Appoint" Width="120px" OnClick="btn_AppointmentSaveAppoint_Click"
                                                                            OnClientClick="return validation();" />

                                                                        <asp:Button ID="btnAppontment_Clear" ClientIDMode="Static" CssClass="Button_Normal a-btn" runat="server"
                                                                            Text="Clear" Width="88px" OnClick="btnAppontment_Clear_Click" />


                                                                    </td>
                                                                </tr>
                                                            </table>

                                                        </div>
                                                    </td>
                                                    <td style="width: 50%; vertical-align: top;">
                                                        <div class="dv_TokenData">


                                                            <table style="width: 100%;margin-top: 5px;" cellspacing="0" cellpadding="0"  >
                                                                <tr>
                                                                    <td colspan="2" style="padding:0px">
                                                                        <div style="width: 100%; height: 40px; background-color: #424242; color: white; font-family: 'Arial Rounded MT'; font-size: 16px; font-weight: bold; line-height: 40px; text-align: center;"># Appointment Information</div>

                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="width: 30%; vertical-align: top; text-align: left">
                                                                        <div class="DIV_patientTocken" style="width: 100%; height: 175px;">

                                                                            <asp:Label ID="lbl_INFO_TockenNo" runat="server" Text=""></asp:Label>

                                                                        </div>
                                                                    </td>
                                                                    <td style="width: 70%; vertical-align: top; text-align: left">
                                                                        <table class="Display_Table" style="width: 100%" cellpadding="0" cellspacing="0">
                                                                            <tr>

                                                                                <td align="left" class="HeadTD">
                                                                                    <asp:Label ID="Label20" runat="server" Text="Patient ID"></asp:Label>
                                                                                </td>
                                                                                <td class="Colon" align="center">
                                                                                    <asp:Label ID="Label21" Text=":" runat="server"></asp:Label>
                                                                                </td>
                                                                                <td class="TextTD" align="left">
                                                                                    <asp:Label ID="lbl_INFO_PatientId" runat="server"></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="left" class="HeadTD">
                                                                                    <asp:Label ID="Label3" runat="server" Text="Patient Name"></asp:Label>
                                                                                </td>
                                                                                <td class="Colon" align="center">
                                                                                    <asp:Label ID="Label22" Text=":" runat="server"></asp:Label>
                                                                                </td>
                                                                                <td class="TextTD" align="left">
                                                                                    <asp:Label ID="lbl_INFO_Patientname" runat="server"></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="left" class="HeadTD">
                                                                                    <asp:Label ID="Label23" runat="server" Text="Appo.Date"></asp:Label>
                                                                                </td>
                                                                                <td class="Colon" align="center">
                                                                                    <asp:Label ID="Label24" Text=":" runat="server"></asp:Label>
                                                                                </td>
                                                                                <td class="TextTD" align="left">
                                                                                    <asp:Label ID="lbl_INFO_appoDate" runat="server"></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>

                                                                                <td align="left" class="HeadTD">
                                                                                    <asp:Label ID="Label25" runat="server" Text="Approx. Time"></asp:Label>
                                                                                </td>
                                                                                <td class="Colon" align="center">
                                                                                    <asp:Label ID="Label26" Text=":" runat="server"></asp:Label>
                                                                                </td>
                                                                                <td class="TextTD" align="left">
                                                                                    <asp:Label ID="lbl_INFO_appTime" runat="server"></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>

                                                                                <td align="left" class="HeadTD" style="border-bottom: 1px;">
                                                                                    <asp:Label ID="Label27" runat="server" Text="Fees"></asp:Label>
                                                                                </td>
                                                                                <td class="Colon" align="center" style="border-bottom: 1px;">
                                                                                    <asp:Label ID="Label28" Text=":" runat="server"></asp:Label>
                                                                                </td>
                                                                                <td class="TextTD" align="left" style="border-bottom: 1px; border-bottom: 1px solid #e2e2e2;">
                                                                                    <asp:Label ID="lbl_INFO_fees" runat="server"></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                                </table>
                                                        </div>
                                                    </td>
                                                </tr>

                                            </table>

                                        </ContentTemplate>
                                    </Ajax:TabPanel>

                                    <Ajax:TabPanel ID="TabPanel8" runat="server" HeaderText="Future Appointments">
                                        <HeaderTemplate>
                                            <table cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td>
                                                        <img src="../../Image/PM_Appointment.png" width="30px" height="30px" style="margin-right: 2px;" /></td>
                                                    <td><span class="Label_Normal">Future Appointments</span></td>
                                                </tr>
                                            </table>
                                        </HeaderTemplate>
                                        <ContentTemplate>

                                            <asp:GridView ID="grd_AppoSchedule" ShowHeaderWhenEmpty="True" runat="server" AutoGenerateColumns="False"
                                                RowStyle-CssClass="row" CssClass="mGrid" PagerStyle-CssClass="pgr" CellPadding="4"
                                                GridLines="None">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Appointment Date" ItemStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" ID="lbl_AppoTime" Text='<%#Eval("AppoDate")%>' />
                                                        </ItemTemplate>
                                                        <ItemStyle Wrap="false" HorizontalAlign="Center"></ItemStyle>
                                                    </asp:TemplateField>
                                                    <%--    <asp:BoundField HeaderText="Appointment Date"  DataField="AppoDate" />--%>
                                                    <asp:BoundField HeaderText="PK_PostQueueID" HeaderStyle-CssClass="HideColumn" ItemStyle-CssClass="HideColumn"
                                                        FooterStyle-CssClass="HideColumn" DataField="PK_PostQueueID">
                                                        <FooterStyle CssClass="HideColumn"></FooterStyle>
                                                        <HeaderStyle CssClass="HideColumn"></HeaderStyle>
                                                        <ItemStyle CssClass="HideColumn"></ItemStyle>
                                                    </asp:BoundField>
                                                    <asp:BoundField HeaderText="FK_AppointmentID" HeaderStyle-CssClass="HideColumn" ItemStyle-CssClass="HideColumn"
                                                        FooterStyle-CssClass="HideColumn" DataField="FK_AppointmentID">
                                                        <FooterStyle CssClass="HideColumn"></FooterStyle>
                                                        <HeaderStyle CssClass="HideColumn"></HeaderStyle>
                                                        <ItemStyle CssClass="HideColumn"></ItemStyle>
                                                    </asp:BoundField>
                                                    <asp:BoundField HeaderText="FK_PatientID" HeaderStyle-CssClass="HideColumn" ItemStyle-CssClass="HideColumn"
                                                        FooterStyle-CssClass="HideColumn" DataField="FK_PatientID">
                                                        <FooterStyle CssClass="HideColumn"></FooterStyle>
                                                        <HeaderStyle CssClass="HideColumn"></HeaderStyle>
                                                        <ItemStyle CssClass="HideColumn"></ItemStyle>
                                                    </asp:BoundField>
                                                    <asp:BoundField HeaderText="TockenID" ItemStyle-HorizontalAlign="Center" DataField="TockenID" />
                                                    <asp:BoundField HeaderText="Appo.Time" DataField="ApproxInTime">
                                                        <ControlStyle BackColor="#9966FF" />
                                                        <ItemStyle Width="50px" />
                                                    </asp:BoundField>
                                                    <asp:BoundField HeaderText="FullName" DataField="FullName" />
                                                    <asp:BoundField HeaderText="NextTockenId" DataField="NextTockenId" FooterStyle-CssClass="HideColumn"
                                                        HeaderStyle-CssClass="HideColumn" ItemStyle-CssClass="HideColumn">
                                                        <FooterStyle CssClass="HideColumn"></FooterStyle>
                                                        <HeaderStyle CssClass="HideColumn"></HeaderStyle>
                                                        <ItemStyle CssClass="HideColumn"></ItemStyle>
                                                    </asp:BoundField>
                                                    <asp:BoundField HeaderText="NEW/OLD" DataField="NewOld" FooterStyle-CssClass="HideColumn"
                                                        HeaderStyle-CssClass="HideColumn" ItemStyle-CssClass="HideColumn">
                                                        <FooterStyle CssClass="HideColumn"></FooterStyle>
                                                        <HeaderStyle CssClass="HideColumn"></HeaderStyle>
                                                        <ItemStyle CssClass="HideColumn"></ItemStyle>
                                                    </asp:BoundField>
                                                    <asp:BoundField HeaderText="LOCAL/OUT" DataField="LocalOut" FooterStyle-CssClass="HideColumn"
                                                        HeaderStyle-CssClass="HideColumn" ItemStyle-CssClass="HideColumn">
                                                        <FooterStyle CssClass="HideColumn"></FooterStyle>
                                                        <HeaderStyle CssClass="HideColumn"></HeaderStyle>
                                                        <ItemStyle CssClass="HideColumn"></ItemStyle>
                                                    </asp:BoundField>
                                                    <asp:BoundField HeaderText="Appo.Time" DataField="ApproxInTime" FooterStyle-CssClass="HideColumn"
                                                        HeaderStyle-CssClass="HideColumn" ItemStyle-CssClass="HideColumn">
                                                        <FooterStyle CssClass="HideColumn"></FooterStyle>
                                                        <HeaderStyle CssClass="HideColumn"></HeaderStyle>
                                                        <ItemStyle CssClass="HideColumn"></ItemStyle>
                                                    </asp:BoundField>
                                                    <asp:TemplateField HeaderText="#" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center"
                                                        FooterStyle-CssClass="HideColumn" HeaderStyle-CssClass="HideColumn" ItemStyle-CssClass="HideColumn">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" ID="lbl_AppoEdit" Text='<%#Eval("LinkEdit")%>' />
                                                        </ItemTemplate>
                                                        <FooterStyle CssClass="HideColumn"></FooterStyle>
                                                        <HeaderStyle HorizontalAlign="Center" CssClass="HideColumn"></HeaderStyle>
                                                        <ItemStyle HorizontalAlign="Center" CssClass="HideColumn"></ItemStyle>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="#" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center"
                                                        FooterStyle-CssClass="HideColumn" HeaderStyle-CssClass="HideColumn" ItemStyle-CssClass="HideColumn">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" ID="lbl_AppoCancel" Text='<%#Eval("LinkCancel")%>' />
                                                        </ItemTemplate>
                                                        <FooterStyle CssClass="HideColumn"></FooterStyle>
                                                        <HeaderStyle HorizontalAlign="Center" CssClass="HideColumn"></HeaderStyle>
                                                        <ItemStyle HorizontalAlign="Center" CssClass="HideColumn"></ItemStyle>
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
                                                <PagerStyle CssClass="pgr"></PagerStyle>
                                                <RowStyle CssClass="row"></RowStyle>
                                            </asp:GridView>

                                        </ContentTemplate>
                                    </Ajax:TabPanel>

                                </Ajax:TabContainer>
                            </td>
                        </tr>

                    </table>

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
        
                <UC:UC_Footer ID="uc_footer1" LogoURL="../Image/ICS.PNG" runat="server" />
        
        <!--#####################################################################################################-->

    </form>
</body>
</html>

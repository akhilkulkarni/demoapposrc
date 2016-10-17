<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Patient_Registration_POPUP.aspx.cs" EnableEventValidation="false"
    Theme="Default" Inherits="UI_PatientManagement_Patient_Registration_POPUP" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagName="UC_ErrorName" TagPrefix="UC" Src="~/UC_ErrorMessageInfo.ascx" %>
<%@ Register Src="~/UC_ListGrid_New.ascx" TagPrefix="UC" TagName="UC_ListGrid_New" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="<%# Page.ResolveUrl("~/JS/jquery-1.12.4.js")%>" type="text/javascript"></script>
    <script src="<%# Page.ResolveUrl("~/JS/jquery-ui.1.12.1.js")%>" type="text/javascript"></script>
    <script src="<%# Page.ResolveUrl("~/JS/jquery.uilock.min.js")%>" type="text/javascript"></script>

    <script src="<%# Page.ResolveUrl("~/JS/jquery.uilock.min.js")%>" type="text/javascript"></script>
    <script src="<%# Page.ResolveUrl("~/JS/jquery.colorbox.js")%>" type="text/javascript"></script>

    <link href="<%# Page.ResolveUrl("~/CSS/colorbox.css")%>" rel="stylesheet" type="text/css" />
    <script src="<%# Page.ResolveUrl("~/JS/JQuery_ScrollTo.js")%>" type="text/javascript"></script> 
   
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
            line-height: 20px;
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
            line-height: 20px;
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
            
            padding:0px;
        }
        .Display_Table tr
        {
            height:35px;
        }
        .Display_Table tr th
        {
            font-size:14px!important;
            font-weight:bolder;
            font-family:Verdana,sans-serif;
        }
        .Display_Table tr .HeadTD
        {
            background-color:#e6e6e6;
            width:25%;
            text-wrap:none;
            font-size:12px;
            font-weight:bold;
            padding-left:10px;
             border-left:0.5px solid #b3b3b3;
             border-top:0.5px solid #b3b3b3;
              
        }
        .Display_Table tr .Colon
        {
            border-right:1px solid #b3b3b3;
             border-top:1px solid #b3b3b3;
            

            background-color:#e6e6e6;
            width:2%;
        }
            .Display_Table tr .TextTD
            {
             border:1px solid #b3b3b3;
                 white-space: nowrap;
                    border-bottom-style:none;
            }
    </style>
    <script type="text/javascript">
        function Fn_CLosePopUp() {alert('TEST');
            //$.fn.colorbox.close();
            //$.colorbox.close();
            parent.jQuery.colorbox.close();
        }

        $(document).ready(function () {
            Page_FormLoad();
        });

         
        function Page_FormLoad() {
            $("#txtPatient_Name").focus();
            $("#txtPatient_Name").select();

            $("#txtPatient_Name").keypress(function (evt) {
                console.log("Handler for .keypress() called.");
                if (evt.charCode == 13)
                {
                   
                    return false;
                }
            })
            $("#txtPatient_Name").autocomplete({
                minLength: 0,
                source: function (request, response) {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "Patient_Registration_POPUP.aspx/GetPatientList",
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
                response: function(event, ui) {
                    if (ui.content.length == 1)
                    { 
                        $("#txtPatient_Name").val(ui.content[0].FullName);
                        $("#txtPatient_ID").val(ui.content[0].PK_PatientID);
                        $(this).autocomplete("close");
                        __doPostBack("btn_LoadData");
                        
                    }
                    else if (ui.content.length == 0)
                    {
                        //$("#txtPatient_Name").val("");
                        //$("#txtPatient_ID").val("");
                        //__doPostBack("btn_LoadData");
                    }

                },
                select: function (event, ui) {
                    $("#txtPatient_Name").val(ui.item.FullName);
                    $("#txtPatient_ID").val(ui.item.PK_PatientID);
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
        $(function () {
          
        });
        //         http: //keith-wood.name/timeEntry.html
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
            border-top:1px solid #808080;
            padding:1px;
            background-color:#efefef;
            background: -webkit-gradient(linear, 0 0, 0 bottom, from(#f2f2f2), to(#efefef));
            background: -moz-linear-gradient(#f2f2f2, #efefef);
            background: linear-gradient(#f2f2f2, #efefef);
            -pie-background: linear-gradient(#f2f2f2, #efefef);
        }
        
        .AutocompleteLI:hover
        {
            border:none!important;
            border-top:1px solid #808080!important;
            padding:1px!important;
            background-color:#CCC1DA!important;
        }

        .AutoCompleteTabel
        {
            
            text-align:left;
            font-family:Calibri;
            font-size:13px;
        }
        .AutoCompleteTabel img
        {
            border:1px solid #808080;
            width:40px;
            height:50px;
            background-color:#FFF;
        }
        .ImageTD
        {
                width:35px;
                height:50px;
        }
        .AutoCompleteTabel .Name
        {
            color:#6696ed;
            font-weight:bold;
                font-size:14px;
                white-space:nowrap;
        }
        .ui-autocomplete {
            width:300px;
            max-height: 50%;
            overflow-y: auto;
            /* prevent horizontal scrollbar */
            overflow-x: hidden;
        }
        .ui-menu-item-wrapper:hover
        {
            border:none;
        }
    </style>
</head>
<body>
    
    <form id="form1" runat="server">
    <asp:ScriptManager ID="sc_mgr" runat="server" EnablePageMethods="true">
        <Scripts>
            <asp:ScriptReference ScriptMode="Auto" Path="~/JS/PatientRegistration_POPUP.js" />
            <asp:ScriptReference Path="~/JS/ASYNC_Postback/Async_Callback_JS.js" />
        </Scripts>
    </asp:ScriptManager>
        

 <div class="Div_HeaderAtPopup">
     <asp:Label ID="Label1" runat="server" CssClass="Label_PopupHeader" Text="# Appointment Add/Edit"></asp:Label>
     </div>
    <div class="Div_PatientAdd">
        <table class="Table_Full">
            <tr>
                <td align="left" class="style6" valign="top">
                    
                </td>
                <td align="left" class="style7" valign="top">
                  
                </td>
            </tr>
            <tr>
                <td align="center" valign="top" class="style6">
                    <asp:UpdatePanel ID="up_patientEnt" runat="server">
                        <ContentTemplate>
                            <table class="Display_Table" cellpadding="5px" cellspacing="0px" style="margin-top: 20px;">
                                <tr>
                                    <td class="HeadTD" align="left">
                                        <asp:Label ID="lblPatient_Name" Text="Patient Name" runat="server"></asp:Label>
                                    </td>
                                    <td class="Colon" align="center">
                                        <asp:Label ID="lblPatient_Name0" Text=":" runat="server"></asp:Label>
                                    </td>
                                    <td class="TextTD">
                                        <asp:TextBox ID="txtPatient_ID" CssClass="Display_None" runat="server" Width="230px"></asp:TextBox>
                                        <asp:TextBox ID="txtPatient_Name" CssClass="TextBox_Normal" runat="server" Width="230px"></asp:TextBox>
                                        <asp:Button ID="btn_LoadData" runat="server" CssClass="Display_None" OnClick="btn_LoadData_Click" />
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="HeadTD" align="left">
                                        <asp:Label ID="lblLocality" Text="Locality" runat="server"></asp:Label>
                                    </td>
                                    <td class="Colon" align="center">
                                        <asp:Label ID="lblPatient_Name1" Text=":" runat="server"></asp:Label>
                                    </td>
                                    <td class="TextTD">
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:RadioButton ID="rdo_local" GroupName="isLocal" runat="server" Text="Localite"
                                                        Checked="true" />
                                                </td>
                                                <td>
                                                    <asp:RadioButton ID="rdo_outside" GroupName="isLocal" runat="server" Text="Outside" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="HeadTD" align="left">
                                        <asp:Label ID="lblPatient_Type" Text="Patient Type" runat="server"></asp:Label>
                                    </td>
                                    <td class="Colon" align="center">
                                        <asp:Label ID="lblPatient_Name2" Text=":" runat="server"></asp:Label>
                                    </td>
                                    <td class="TextTD">
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:RadioButton ID="rdo_new" GroupName="patientType" runat="server" Text="&nbsp;&nbsp;New&nbsp;&nbsp;&nbsp;" Checked="true" />
                                                </td>
                                                <td>
                                                    <asp:RadioButton ID="rdo_old" GroupName="patientType" runat="server" Text="&nbsp;&nbsp;&nbsp;Old&nbsp;&nbsp;&nbsp;" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="HeadTD" align="left">
                                        <asp:Label ID="lblPatient_Type0" runat="server" Text="Appointment Date"></asp:Label>
                                    </td>
                                    <td class="Colon">
                                        <asp:Label ID="lblPatient_Name3" runat="server" Text=":"></asp:Label>
                                    </td>
                                    <td class="TextTD">
                                        <asp:TextBox ID="txt_appointmentDate" runat="server" Width="155px" OnTextChanged="txt_appointmentDate_TextChanged"></asp:TextBox>
                                        <%--     <asp:TextBox ID="TextBox1" runat="server" Width="228px"></asp:TextBox>--%>
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="HeadTD" align="left">
                                        &nbsp;
                                    </td>
                                    <td class="Colon">
                                        &nbsp;
                                    </td>
                                    <td class="TextTD" align="left">
                                        <asp:CheckBox ID="chk_demandTime" Width="155px" runat="server" Text="&nbsp;&nbsp;&nbsp;&nbsp;Demand Time&nbsp;&nbsp;&nbsp;&nbsp;" />
                                    </td>
                                    <td align="left">
                                        &nbsp;
                                    </td>
                                    <td align="left">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="HeadTD" align="left">
                                        <asp:Label ID="Label2" runat="server" Text="Appointment Time"></asp:Label>
                                    </td>
                                    <td class="Colon">
                                        <asp:Label ID="lblPatient_Name4" runat="server" Text=":"></asp:Label>
                                    </td>
                                    <td class="TextTD">
                                        <asp:TextBox ID="txt_appointmentTime" runat="server" Width="155px"></asp:TextBox>
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3">
                                        <table align="center">
                                            <tr>
                                                <td>
                                                    <asp:Button ID="btn_AppointmentSaveAppoint" runat="server" CssClass="Button_Normal a-btn"
                                                        Text="Save &amp; Appoint" Width="120px" OnClick="btn_AppointmentSaveAppoint_Click"
                                                        OnClientClick="return validation();" />
                                                </td>
                                                <td>
                                                    <asp:Button ID="btnAppontment_Clear" CssClass="Button_Normal a-btn" runat="server"
                                                        Text="Clear" Width="88px" OnClick="btnAppontment_Clear_Click" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
                <td align="center" valign="top" class="style7" rowspan="3">
                    <fieldset class="FieldSet_WithHeaderAndBorder">
                        <legend>Appointment List</legend>
                    <div id="dv_patientQueue" style="height: 550px; overflow: auto">
                       <%-- <UC:UC_ListGrid_New runat="server" ID="UC_ListGrid_New" HTMLColumnIndexes="1," InvisibleColumnIndexes="2," />--%>
                           <asp:GridView ID="grd_AppoSchedule" ShowHeaderWhenEmpty="True" runat="server" AutoGenerateColumns="False"
                            RowStyle-CssClass="row" CssClass="mGrid" PagerStyle-CssClass="pgr" CellPadding="4"
                            GridLines="None">
                            <Columns>
                                <asp:TemplateField HeaderText="Appointment Date" ItemStyle-HorizontalAlign="Center" >
                                    <ItemTemplate >
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
                       
                    </div>
                        
                    </fieldset>
                </td>
            </tr>
            <tr>
                <td align="center" valign="bottom" class="style6">
                    <UC:UC_ErrorName ID="uc_error" runat="server" ErrorMessage="* marked fields are mandetory" />
                </td>
            </tr>
            <tr>
                <td align="center" valign="bottom" class="style6">
              
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <table class="Table_patientTocken Display_Table" style="width: 530px;"  cellspacing="0" style="margin-top: 20px;">
                                <tr>
                                    <th align="center">
                                        <asp:Label ID="Label5" runat="server"  Text="Token No"></asp:Label>
                                    </th>
                                    <th align="left" colspan="3">
                                        <asp:Label ID="Label9" runat="server"  Text="Appointment Information"></asp:Label>
                                    </th>
                                </tr>
                                <tr>
                                    <td align="center" valign="middle" rowspan="3">
                                        <div class="DIV_patientTocken" style="width: 100px; height: 100px;">
                                            <table class="Table_Full">
                                                <tr>
                                                    <td valign="middle" align="center">
                                                        <asp:Label ID="lbl_INFO_TockenNo" runat="server" CssClass="Label_TockenNo" Text=""></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </td>
                                    <td align="left" class="HeadTD">
                                        <asp:Label ID="Label12" runat="server" Text="Patient ID"></asp:Label>
                                    </td>
                                    <td class="Colon" align="center">
                                        <asp:Label ID="Label13" Text=":" runat="server"></asp:Label>
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
                                        <asp:Label ID="Label4" Text=":" runat="server"></asp:Label>
                                    </td>
                                    <td class="TextTD" align="left">
                                        <asp:Label ID="lbl_INFO_Patientname" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" class="HeadTD">
                                        <asp:Label ID="Label14" runat="server" Text="Appo.Date"></asp:Label>
                                    </td>
                                    <td class="Colon" align="center">
                                        <asp:Label ID="Label15" Text=":" runat="server"></asp:Label>
                                    </td>
                                    <td class="TextTD" align="left">
                                        <asp:Label ID="lbl_INFO_appoDate" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" class="style2">
                                        &nbsp;
                                    </td>
                                    <td align="left" class="HeadTD">
                                        <asp:Label ID="Label7" runat="server" Text="Approx. Time"></asp:Label>
                                    </td>
                                    <td class="Colon" align="center" >
                                        <asp:Label ID="Label8" Text=":" runat="server"></asp:Label>
                                    </td>
                                    <td class="TextTD" align="left" >
                                        <asp:Label ID="lbl_INFO_appTime" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" class="style2" >
                                    </td>
                                    <td align="left" class="HeadTD"  style="border-bottom:1px;">
                                        <asp:Label ID="Label10" runat="server" Text="Fees"></asp:Label>
                                    </td>
                                    <td class="Colon" align="center"  style="border-bottom:1px;">
                                        <asp:Label ID="Label11" Text=":" runat="server"></asp:Label>
                                    </td>
                                    <td class="TextTD" align="left"  style="border-bottom:1px;">
                                        <asp:Label ID="lbl_INFO_fees" runat="server"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btn_AppointmentSaveAppoint" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>

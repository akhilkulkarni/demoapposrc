<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Frm_Status_Queue.aspx.cs" Inherits="UI_PatientManagement_Frm_Status_Queue" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
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

    <title></title>
    <%--//....................    IMP     http: //keith-wood.name/timeEntry.html....................................//////////////--%>
    <script type="text/javascript">
        var count=0;
        $(document).ready(function () {
         
            fn_GetLatestTockenList();
          
            myVar = setInterval(function () { fn_GetLatestTockenList(); }, 10000);

            setInterval(function () { call_Audio_Token(); }, 5000);
             
        });


        function fn_GetLatestTockenList() {

            var url = "../../Handler/Appointment_Status.ashx";
            $.ajax({
                url: url,
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (dt_JSON) {
                 
                    if($('.PrevDiv').html()!=dt_JSON.PrevID || $('.InDiv').html()!=dt_JSON.CurrentID ||$('.NextDiv').html()!=dt_JSON.NextID )
                    {
                        fillRecord(dt_JSON);
                    }
                 
                },
                error: function () { alert('Error !'); }
            });

        }
        function fillRecord(json)
        {
        if ($("#hdn_ELM_LIST")[0].value == json.StatusQueueList) {
        
        }
        else {
           
            $("#hdn_ELM_LIST")[0].value = json.StatusQueueList;
        }
       
        $("#hdn_ELM")[0].value = json.SelectedElement;
        //  alert(json.NextName);
        $(".NextDiv_Name").html(json.NextName);
        $(".InDiv_Name").html(json.CurrName);
        $(".PrevDiv_Name").html(json.PrevName);


        $(".NextDiv").html(json.NextID);
        $(".InDiv").html(json.CurrentID);
        $(".PrevDiv").html(json.PrevID);

        count = 0;
              
        }
        function call_Audio_Token()
        {
            var strNextToken = $('.NextDiv').html();
            var hdn_LastTokenAnnounced = $("#hdn_LastTokenAnnounced").val();

            if ((count <= 3 || hdn_LastTokenAnnounced != strNextToken) && (strNextToken != "" && strNextToken != "0"))
            {
                var splitAudio = document.createElement('audio');
                var audioToken = document.createElement('audio');
                var tockenNo = document.createElement('audio');
                
            
                $.get();
                splitAudio.setAttribute('src', '../../TokenAudio/Split.mp3');
                audioToken.setAttribute('src', '../../TokenAudio/NextToken.mp3');
                tockenNo.setAttribute('src', '../../TokenAudio/' + strNextToken + '.mp3');
                splitAudio.play();
                splitAudio.addEventListener("ended", function () {
                    audioToken.play();
                }, false);

                audioToken.addEventListener("ended", function () {
                    tockenNo.play();
                }, false);


                $("#hdn_LastTokenAnnounced").val(strNextToken);

                count = count + 1;

            }
        }
    </script>
      <style type="text/css">

        .MasterDiv_Names
        {
         padding:10px; 
         border:1px solid #0094ff;
         width:100%;
         height:200px;
         white-space:nowrap;
         text-align:center;
         
        }
        .InDiv_Name
        {
              vertical-align:central;
           
         width:30%;
         height:180px;
           border:2px solid #808080;
           background-color:#9de2b3;
           float:left;
           
               font-family:Calibri;
               font-size:20px;
               font-weight:bold;

        }
        .NextDiv_Name
        {
               transform: perspective( 600px ) rotateY( -10deg );
              vertical-align:central;
           
        width:32%;
        height:180px;
         border:2px solid #808080;
          background-color:#ffaa4f;
          float:left;
          margin:10px;
          margin-left:0px;
            font-family:Calibri;
               font-size:20px;
               font-weight:bold;

        }
        .PrevDiv_Name
        {
            vertical-align:central;
          
            float:left;
        width:32%;
        height:180px;
        border:2px solid #808080;
          background-color:#d5d5d5;
          margin:10px;
          margin-right:0px;
           font-family:Calibri;
               font-size:20px;
               font-weight:bold;
                transform: perspective( 600px ) rotateY( 10deg );
        }
    </style>
    <style type="text/css">

        .MasterDiv
        {
         padding:10px;
         padding-top:55px;
         border:1px solid #0094ff;
         width:100%;
         height:380px;
         white-space:nowrap;
         text-align:center;
         
        }
        .InDiv
        {
              vertical-align:central;
            line-height:300px;
         width:30%;
         height:300px;
           border:2px solid #808080;
           background-color:#9de2b3;
           float:left;
               margin:10px;
               font-family:Arial;
               font-size:300px;
               font-weight:bolder;

        }
        .NextDiv
        {
               transform: perspective( 600px ) rotateY( -30deg );
              vertical-align:central;
            line-height:300px;
        width:30%;
        height:300px;
         border:2px solid #808080;
          background-color:#ffaa4f;
          float:left;
          margin:10px;
          font-family:Arial;
               font-size:300px;
               font-weight:bolder;

        }
        .PrevDiv
        {
            vertical-align:central;
            line-height:300px;
            float:left;
        width:30%;
        height:300px;
        border:2px solid #808080;
          background-color:#d5d5d5;
          margin:10px;
          font-family:Arial;
               font-size:300px;
               font-weight:bolder;
                transform: perspective( 600px ) rotateY( 30deg );
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <asp:TextBox runat="server" ID="hdn_ELM_LIST" TextMode="MultiLine"></asp:TextBox>
        <asp:TextBox runat="server" ID="hdn_ELM" TextMode="MultiLine"></asp:TextBox>
         <asp:TextBox runat="server" ID="hdn_LastTokenAnnounced"></asp:TextBox>

        <div class="MasterDiv">


            <div class="PrevDiv">
            </div>
            <div class="InDiv">
            </div>
            <div class="NextDiv">
            </div>
        </div>
         <div class="MasterDiv_Names">


            <div class="PrevDiv_Name">
            </div>
            <div class="InDiv_Name">
            </div>
            <div class="NextDiv_Name">
            </div>
        </div>
    </form>
</body>
</html>

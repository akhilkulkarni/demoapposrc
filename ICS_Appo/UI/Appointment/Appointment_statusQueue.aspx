<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Appointment_statusQueue.aspx.cs"
    Theme="Default" Inherits="UI_Appointment_Appointment_statusQueue" %>

<%@ Register TagName="UC_Header" TagPrefix="UC" Src="~/UC_Header_New.ascx" %>
<%@ Register TagName="UC_Footer" TagPrefix="UC" Src="~/UC_Footer.ascx" %>
<%@ Register TagName="UC_FormName" TagPrefix="UC" Src="~/UC_PageHeaderInfo.ascx" %>
<%@ Register TagName="UC_ErrorName" TagPrefix="UC" Src="~/UC_ErrorMessageInfo.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    
    <title></title>
    <script src="../../Sly_files/jquery.js" type="text/javascript"></script>
    <script src="../../Sly_files/plugins.js" type="text/javascript"></script>
    <script src="../../Sly_files/ospb.js" type="text/javascript"></script>
    <script src="../../Sly_files/sly.js" type="text/javascript"></script>
    <script src="../../Sly_files/main.js" type="text/javascript"></script>
    <link rel="stylesheet" href="../../Sly_files/normalize.css" type="text/css" />
    <link rel="stylesheet" href="../../Sly_files/font-awesome.css" type="text/css" />
    <link rel="stylesheet" href="../../Sly_files/ospb.css" type="text/css" />
    <link rel="stylesheet" href="../../Sly_files/main.css" type="text/css" />
    <script src="../../Sly_files/ga.js" type="text/javascript"></script>
    <script src="../../Sly_files/azcarbon_2_1_0_VERT" async="" type="text/javascript"></script>
    <script src="../../Sly_files/modernizr.js" type="text/javascript"></script>
    <%-- MENU CSS--%>
<link href="<%# Page.ResolveUrl("~/CSS/MainCommon.css")%>" rel="stylesheet" type="text/css" />
<link href="<%# Page.ResolveUrl("~/css/dropdown/dropdown.css")%>" media="screen" rel="stylesheet" type="text/css" />
<link href="<%# Page.ResolveUrl("~/css/dropdown/themes/vimeo.com/default.advanced.css")%>" media="screen"
rel="stylesheet" type="text/css" />

    
<script src="<%# Page.ResolveUrl("~/JS/JQuery-ui.js")%>" type="text/javascript"></script>
<%-- MENU CSS--%>


    <script type="text/javascript">
        function fn_GetLatestTockenList() {

            var url = "../../Handler/Appointment_Status.ashx";
            $.ajax({
                url: url,
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (dt_JSON) {
                    // alert('hoi');
                    // alert($("#hdn_ELM")[0].value + '==' + dt_JSON.SelectedElement + '====' + $("#hdn_ELM_LIST")[0].value + '====' + dt_JSON.StatusQueueList);

                    if ($("#hdn_ELM")[0].value != dt_JSON.SelectedElement || $("#hdn_ELM_LIST")[0].value != dt_JSON.StatusQueueList) {
                        Fn_Fill_SLY(dt_JSON);
                    }
                },
                error: function () { alert('Error !'); }
            });

        }


        $(document).ready(function () {

            //   setInterval(fn_Fill(), 100);
            setInterval(function () { fn_GetLatestTockenList() }, 1000);
        });

        function Fn_Fill_SLY(json) {
            var $example = $('#example');
            var $frame = $example.find('.frame'); window.frr = $frame;
            var sly = new Sly($frame, {
                horizontal: 1,
                itemNav: 'forceCentered',
                activateMiddle: 1,
                smart: 1,
                activateOn: 'click',
                mouseDragging: 1,
                touchDragging: 1,
                releaseSwing: 1,
                startAt: 0,
                scrollBar: $example.find('.scrollbar'),
                scrollBy: 1,
                pagesBar: $example.find('.pages'),
                activatePageOn: 'click',
                speed: 300,
                moveBy: 600,
                elasticBounds: 1,
                dragHandle: 1,
                dynamicHandle: 1,
                clickBar: 1,

                // Buttons
                forward: $example.find('.forward'),
                backward: $example.find('.backward'),
                prev: $example.find('.prev'),
                next: $example.find('.next'),
                prevPage: $example.find('.prevPage'),
                nextPage: $example.find('.nextPage')
            }).init();

            //  sly.add(document.createElement('li'), 5);
            //             alert($("#hdn_ELM_LIST")[0].value);
            //            alert(json.StatusQueueList);
            //  alert($("#hdn_ELM_LIST")[0].value);
            // alert(json.StatusQueueList);

            if ($("#hdn_ELM_LIST")[0].value == json.StatusQueueList) {
                $('#ui_main').html(json.StatusQueueList);
                sly.reload();
                //sly.moveTo(json.SelectedElement);
            }
            else {
                $('#ui_main').html(json.StatusQueueList);
                sly.reload();
                $("#hdn_ELM_LIST")[0].value = json.StatusQueueList;
            }
            //  alert($("#hdn_ELM")[0].value);
            //  alert(json.SelectedElement);

            if ($("#hdn_ELM")[0].value != json.SelectedElement) {
                sly.activate(json.SelectedElement);

            }
            else {
                sly.activate(json.SelectedElement);
            }


            $("#hdn_ELM")[0].value = json.SelectedElement;
            //  alert(json.NextName);
            $("#lbl_NextName").html(json.NextName);
            $("#lbl_CurrName").html(json.CurrName);
            $("#lbl_PrevName").html(json.PrevName);
        }
    </script>
    <style>
        #adzerk_by
        {
            display: none;
        }
        .example
        {
            margin-top: 0px;
        }
        /* vert */
        .carbonad
        {
            background-color: #FBFBFB;
            border: 2px solid #E8E8E8;
            height: 215px;
            line-height: 1.2;
            width: 150px;
        }
        .carbonad-img
        {
            float: left;
            height: 100px;
            margin-left: 11px;
            margin-top: 11px;
            width: 130px;
        }
        .carbonad-text
        {
            color: #545454;
            float: left;
            font-family: Arial,Helvetica,sans-serif;
            font-size: 11px;
            font-weight: normal;
            height: 50px;
            margin-left: 15px;
            margin-top: 9px;
            width: 119px;
        }
        .carbonad-text a
        {
            color: #545454;
            text-decoration: none;
            font-weight: bold;
        }
        .carbonad-tag
        {
            color: #999999;
            float: left;
            font-family: Arial,Helvetica,sans-serif;
            font-size: 11px;
            font-weight: normal;
            margin-left: 17px;
            margin-top: 15px;
            padding-top: 5px;
        }
        .carbonad-tag a
        {
            color: #999999;
            text-align: center;
            text-decoration: none;
            font-weight: bold;
        }
        .Label_SHOWNAME
        {
            font-family: Verdana;
            font-size: xx-large;
            color: Black;
        }
        .Label_SHOWSTATUS
        {
            font-family: Verdana;
            font-size: x-large;
            color: Black;
        }
    </style>
</head>
<body data-repo="Darsain/sly" data-metafile="component.json">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="scm" runat="server">
    </asp:ScriptManager>
    <div id="dv_mainBackground" class="MainBackgroundScreen">
        <table class="Table_MainTable" cellspacing="0" cellpadding="0">
            <tr>
                <td>
                    <%--==========================================================================================================-->
                 <%-- Data Start                                                                                               -->
                 <%--==========================================================================================================--%>
                    <header class="projecttitle">
		                            <div class="titlewrap">
			                            <h1 class="projectname">Infocasier System Pvt Ltd.</h1>
			
		                            </div>
                            <!--		<p class="projectdescription">test for one-directional scrolling with item based navigation support</p>
                            -->
		                            <div id="example" class="example pagespan">
			                            <div class="scrollbar">
				                            <div style="transform: translateZ(0px) translateX(649px); width: 253px;" class="handle">
					                            <div class="mousearea"></div>
				                            </div>
			                            </div>

		                            <%--	<button class="backward"><i class="icon-angle-left"></i></button>
			                            <button class="forward"><i class="icon-angle-right"></i></button>--%>

			                            <div style="overflow: hidden;" class="frame">
				                            <ul id="ui_main" style="transform: translateZ(0px) translateX(-2015px); width: 2698px;">
                                            <li class="Active">0</li>
                                            <li>1</li> 
                                            <li>17</li>
				                            </ul>
			                            </div>

			                            <div class="controls" style='display:none'>
				                            <button data-action="toStart"><i class="icon-double-angle-left"></i> Start</button>
				                            <span class="divider"></span>
				                            <button class="prev"><i class="icon-angle-left"></i> Prev</button>
				                            <span class="divider"></span>
				                            <button data-action="add"><i class="icon-plus-sign"></i></button>
				                            <button data-action="remove"><i class="icon-minus-sign"></i></button>
				                            <span class="divider"></span>
				                            <button class="next">Next <i class="icon-angle-right"></i></button>
				                            <span class="divider"></span>
				                            <button data-action="toEnd">End <i class="icon-double-angle-right"></i></button>
			                            </div>
		                            </div>
    
                                   <table style="width:100%;"> <tr><td align="center">

                                   <table>
                                   <tr>
                                   <td >
                                       <div style="width:350px; height:200px;" class="DIV_SIDE" >
                                   
                                           <table class="Table_Full">
                                           <tr><td><asp:Label ID="lbl_PrevName" CssClass="Label_SHOWNAME" runat="server"></asp:Label></td></tr>
                                           <tr><td style="height:25px" valign="bottom"><asp:Label ID="Label1" runat="server" CssClass="Label_SHOWSTATUS" Text="OUT"></asp:Label></td></tr>
                                           </table>
                                   
                                       </div>
                                   </td>
                                   <td>
                                       <div style="width:350px; height:200px;" class="DIV_CENTER" >
                                           <table class="Table_Full">
                                           <tr><td><asp:Label ID="lbl_CurrName" CssClass="Label_SHOWNAME" runat="server"></asp:Label></td></tr>
                                           <tr><td style="height:25px" valign="bottom"><asp:Label ID="lbl_CurrStatus" CssClass="Label_SHOWSTATUS" runat="server"></asp:Label></td></tr>
                                           </table>
                                       </div>
                                   </td>
                                   <td>

                                       <div style="width:350px;height:200px;" class="DIV_SIDE" >
                                           <table class="Table_Full">
                                           <tr><td><asp:Label ID="lbl_NextName" CssClass="Label_SHOWNAME" runat="server"></asp:Label></td></tr>
                                           <tr><td style="height:25px" valign="bottom"><asp:Label ID="Label5" runat="server" CssClass="Label_SHOWSTATUS" Text="Waiting"></asp:Label></td></tr>
                                           </table>
                                       </div>

                                   </td>
	                            </tr>
                                    </table>
                                    </td></tr>
                                </table>

                                </header>
                    <%--	<div id="content" class="content pagespan">
     
		
	                            </div>--%>
                    <footer style="display: none" class="pagespan" data-point="license" data-title="License">
		                            <a id="license" class="license">Loading failed</a>
     
		                            <div id="repos" class="repos" data-display="motio,espy,imagesloaded,fpsmeter">Loading other repositories failed</div>
	                            </footer>
                    <!-- Templates -->
                    <script type="text/tim" class="version">
		                            {{version}}  <small>{{date}}</small>
                    </script>
                    <script type="text/tim" class="watchers">
		                            <span class="size">{{watchers}} <small>watchers</small></span>
                    </script>
                    <script type="text/tim" class="license">
		                            <span class="fl">{{license}}</span>
		                            <span class="fr">{{license}}</span>
		                            Lincensed under the <strong>{{license}}</strong> license
                    </script>
                    <!-- Google Analytics -->
                    <script>
                        var _gaq = [['_setAccount', 'UA-838758-7'], ['_trackPageview']];
                        (function (d, t) {
                            var g = d.createElement(t), s = d.getElementsByTagName(t)[0];
                            g.src = ('https:' == location.protocol ? '//ssl' : '//www') + '.google-analytics.com/ga.js';
                            s.parentNode.insertBefore(g, s)
                        } (document, 'script'));
                    </script>
                    <%--==========================================================================================================-->
                 <%-- Data END                                                                                               -->
                 <%--==========================================================================================================--%>
                </td>
            </tr>
            <tr class="Row_Footer">
                <td class="Row_Footer">
                    <UC:UC_Footer ID="uc_footer" LogoURL="../../Image/ICS.PNG" runat="server" />
                </td>
            </tr>
        </table>
    </div>
    <asp:HiddenField runat="server" ID="hdn_ELM" />
    <asp:HiddenField runat="server" ID="hdn_ELM_LIST" />
    </form>
</body>
</html>

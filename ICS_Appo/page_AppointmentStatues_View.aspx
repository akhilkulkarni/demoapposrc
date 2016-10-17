<%@ Page Language="C#" AutoEventWireup="true" CodeFile="page_AppointmentStatues_View.aspx.cs"
    Inherits="page_AppointmentStatues_View" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html colortransformcts="1,0,1,0,1,0;1,0,1,0,1,0;1,0,1,0,1,0;1,0,1,0,1,0" class=" js csstransforms csstransforms3d">
<!--<![endif]-->
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>ICS-Appo</title>
    <meta name="description" content="JavaScript library for one-directional scrolling with item based navigation support.">
    <meta name="viewport" content="width=device-width">
    <!-- Scripts -->
    <script src="Sly_files/jquery.js"></script>
    <script src="Sly_files/plugins.js"></script>
    <script src="Sly_files/ospb.js"></script>
    <script src="Sly_files/sly.js"></script>
    <script src="Sly_files/main.js"></script>
    <link rel="stylesheet" href="Sly_files/normalize.css" type="text/css" />
    <link rel="stylesheet" href="Sly_files/font-awesome.css" type="text/css" />
    <link rel="stylesheet" href="Sly_files/ospb.css" type="text/css" />
    <link rel="stylesheet" href="Sly_files/main.css" type="text/css" />
    <script src="Sly_files/ga.js">
    </script>
    <script src="Sly_files/azcarbon_2_1_0_VERT" async="" type="text/javascript"></script>
    <script src="Sly_files/modernizr.js"></script>
    <script type="text/javascript">

        $(document).ready(function () {

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



            $('#ui_main').html(" <li>1</li> <li>2</li><li>3</li><li>4</li><li  class='Active'>5</li><li>6</li><li>7</li><li>8</li><li>9</li><li>10</li>");
            sly.slideTo( 4);
            sly.reload();
           
            //            sly.add('<li>' + '23' + '</li>');
            //            sly.add('<li>' + '93' + '</li>');
            //  $(".next").click();

            // $(".add").click();

            //            switch ('add') {
            //                case 'add':
            //                    sly.add('<li>' + sly.items.length + '</li>');
            //                    break;
            //                case 'remove':
            //                    sly.remove(-1);
            //                    break;
            //                default:
            //                    sly[action]();
            //            }
            //            fn();
        });

        //        function fn() {

        //            var $frame = $example.find('.frame'); window.frr = $frame;
        //            var sly = new Sly($frame).init();
        //       
        //        }
    </script>
    <style>
        #adzerk_by
        {
            display: none;
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
    </style>
</head>
<body data-repo="Darsain/sly" data-metafile="component.json">
    <!--[if lt IE 9]>
		<p class="chromeframe"><i class="icon-warning-sign icon-large"></i> You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">activate Google Chrome Frame</a> to improve your experience. <i class="icon-warning-sign icon-large"></i></p>
	<![endif]-->
    <header class="projecttitle">
		<%--<div class="titlewrap">
			<h1 class="projectname">Info-Casier System</h1>
			
		</div>--%>
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

			<div class="controls">
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
       <div style="width:300px; height:200px; background-color:Red;" ></div>
       </td>
       <td>
       <div style="width:300px; height:200px;background-color:Green; z-index:5000;" ></div>
       </td>
       <td>
       <div style="width:300px;height:200px; background-color:Blue; z-index:5000;" ></div>
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
</body>
</html>

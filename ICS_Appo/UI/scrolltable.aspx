<%@ Page Language="C#" AutoEventWireup="true" CodeFile="scrolltable.aspx.cs" Inherits="UI_scrolltable" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <style type="text/css">
            html, body, #layout {height:100%; width:100%; margin:0; padding:0; overflow:hidden; position:fixed}
            #wrapper {overflow-y:scroll; position:relative; height:100%}
            #content {position:absolute;}
            /* highlight areas */
            #header {background-color:#BADBAD;}
            #sidebar {background-color:#DABDAB;}
            #wrapper {background-color:#CD5C5C; font-size:40px;}
        </style>
<style type="text/css">
#mainselection { overflow:hidden; width:350px;
-moz-border-radius: 9px 9px 9px 9px;
-webkit-border-radius: 9px 9px 9px 9px;
border-radius: 9px 9px 9px 9px;
box-shadow: 1px 1px 11px #330033;
background: url("../Image/arrow.gif") no-repeat scroll 319px 5px #58B14C;

}

select { border:0; color:#EEE;
font-size:20px; font-weight:bold; padding:2px 10px; width:378px;
background: transparent;
*width:350px; *background:#58B14C; 
-webkit-appearance: none; 
-moz-appearance:none;
}


</style>
<script src="../JS/jquery-1.9.1.js"></script>


<link rel="stylesheet" type="text/css" href="../JS/assets/jquery.multiselect.css" />
<link rel="stylesheet" type="text/css" href="../JS/assets/style.css" />
<link rel="stylesheet" type="text/css" href="../JS/assets/prettify.css" />
<link rel="stylesheet" type="text/css" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1/themes/ui-lightness/jquery-ui.css" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1/jquery-ui.min.js"></script>
<script type="text/javascript" src="../JS/assets/jquery.multiselect.js"></script>
<script type="text/javascript" src="../JS/assets/prettify.js"></script>
<script type="text/javascript">
    var chkVals;
    $(function () {

        $("select").multiselect({
            selectedList: 4
        });

        $("select").multiselect({
            selectedText: function (numChecked, numTotal, checkedItems) {
                //alert(checkedItems);
                var cboxes = document.getElementsByName('example-list');
                var len = cboxes.length;
                for (var i = 0; i < len; i++) {
                    alert('hello..' + cboxes[i].value);
                    //chkVals = chkVals+,+cboxes[i].value;
                }
               // alert('all chk'+chkVals);
                return numChecked + ' of ' + numTotal + ' checked';
            }
        });

    });



  

</script>

    </head>
<body style="background-color:#58B14C;" onload="prettyPrint();">
    <form id="form1" runat="server">
 
<div id="mainselection">
<select>
<option>Select an Option</option>
<option>Option 1</option>
<option>Option 2</option>
</select>
</div>

    <div>
        <asp:Panel ID="Panel1" runat="server" Height="50px" Width="125px">
        </asp:Panel>
        <br />
        <asp:Menu ID="Menu1" runat="server" BackColor="#E3EAEB" DynamicHorizontalOffset="2" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#666666" StaticSubMenuIndent="10px">
        <Items> 
        <asp:MenuItem Text = "Part I" Value="Part I"> 
        <asp:MenuItem Text = "Chapter 1" Value="Chapter 1"></asp:MenuItem>
        </asp:MenuItem>
        <asp:MenuItem Text = "Part II" Value="Part II"> 
        <asp:MenuItem Text = "Chapter II" Value="Chapter II" /> 
        <asp:MenuItem Text = "Chapter III" Value="Chapter III" />
        </asp:MenuItem>
        
        
        </Items>
            <StaticSelectedStyle BackColor="#1C5E55" />
            <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
            <DynamicHoverStyle BackColor="#666666" Font-Bold="False" ForeColor="White" />
            <DynamicItemTemplate>
                <%# Eval("Text") %>
            </DynamicItemTemplate>
            <DynamicMenuStyle BackColor="#E3EAEB" />
            <DynamicSelectedStyle BackColor="#1C5E55" />
            <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
            <StaticHoverStyle BackColor="#666666" Font-Bold="False" ForeColor="White" />
            <StaticItemTemplate>
                <%# Eval("Text") %>
            </StaticItemTemplate>
                
        
        </asp:Menu>
    </div> 
        <table id="layout" border="1" cellpadding="0" cellspacing="0">
            <tr height="1%">
                <td colspan="2" id="header">Header
                
                
                
                </td>
            </tr>
            <tr valign="top" height="100%">
                <td id="content-td" width="70%" height="100%">
                    <div id="wrapper">
                        <div id="content">
                        

<div id="container" style="min-width: 600px; height: 400px; margin: 0 auto">
<p>
		<select name="example-list" multiple="multiple" style="width:400px">
		<option value="option1">Option 1</option>
		<option value="option2">Option 2</option>
		<option value="option3">Option 3</option>
		<option value="option4">Option 4</option>
		<option value="option5">Option 5</option>
		<option value="option6">Option 6</option>
		<option value="option7">Option 7</option>
		</select>
	</p>

</div>

<asp:Button ID="btnSave" runat="server" onclick="btnSave_Click" />

<div id="Div1" style="min-width: 600px;width:400px; height: 400px; margin: 0 auto"></div>
                           
                        </div>
                    </div>
                </td>
              
            </tr>
        </table>
        </form>
    </body>
   
</html>
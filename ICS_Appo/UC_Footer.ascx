<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UC_Footer.ascx.cs" Inherits="UC_Footer" %>
<script type="text/javascript">
    function Fn_ShowMessage(MessageType, Message, AutoClose, MessagePosition,Modal)
    {

        
        noty({
            layout: MessagePosition,
            theme: 'defaultTheme',
            type: MessageType,
            text: Message, // can be html or string
            dismissQueue: true, // If you want to use queue feature set this true
            
            animation: {
                open: { height: 'toggle' },
                close: { height: 'toggle' },
                easing: 'swing',
                speed: 1000 // opening & closing animation speed
            },
            timeout: AutoClose, // delay for closing event. Set false for sticky notifications
            modal: Modal,

            closeWith: ['button'] // ['click', 'button', 'hover']
             
        });

    }
</script>


<div class="Div_Footer">
<table>
<tr>
<td>

</td>
</tr>
</table>
</div>
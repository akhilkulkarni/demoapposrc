

Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
function BeginRequestHandler(sender, args) {

//    $('body').append("<div id='dv_MSG'><table><tr><td><img id='img2' width='30px' height='30px' alt=''/></td><td><p class='Label_LockDivMSG'>" + $("#MSG")[0].value + "</td><tr></table></div>");
    $.uiLock('');
//    $("#dv_MSG").fadeIn('Slow');

}

function EndRequestHandler(sender, args) {

    $.uiUnlock();
  //  $("#dv_MSG").fadeOut('Slow');

  //  $("#dv_MSG").remove();
}
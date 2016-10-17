

Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
function BeginRequestHandler(sender, args) {

    //$("#Div_PassWordCheck").show();
    $('[id$=lbl_MessageText]').text("Verifying Password...!");
    $("#Div_PassWordCheck").fadeIn('Slow');
    $("#img_Loading").fadeIn('Slow');
}
function EndRequestHandler(sender, args) {
    
    $("#img_Loading").fadeOut('Slow');
}
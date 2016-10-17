

Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
function BeginRequestHandler(sender, args) {

    $.uiLock('Please Wait....');
}
function EndRequestHandler(sender, args) {
  //  alert('Hi');
    $.uiUnlock();
    //fn_FilColorScheme();
    
}
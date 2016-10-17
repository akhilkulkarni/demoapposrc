
Sys.WebForms.PageRequestManager.getInstance().add_initializeRequest(
    function () {
        $.uiLock('');

        if (typeof Fn_SearchCriteria == 'function') {
            Fn_SearchCriteria();
        }
        //-------------------------------------------------------
        // FOR CHARGES GRID
        //-------------------------------------------------------
        if (typeof fn_StoreData == 'function') {
            fn_StoreData();
        }
        //-------------------------------------------------------
        // FOR PROJECT PLAN
        //-------------------------------------------------------
        if (typeof Fn_StorePlan == 'function') {
            Fn_StorePlan();
        }



    });
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
    $.uiUnlock();
    if (typeof Page_FormLoad == 'function') {
        Page_FormLoad();
    }
    if (typeof Fn_ReloadMenu == 'function') {
        Fn_ReloadMenu();
    }
    if (typeof Fn_ReloadListGrid == 'function') {
        Fn_ReloadListGrid();
    }
    if (typeof Fn_ReloadProjectCalendar == 'function') {
        Fn_ReloadProjectCalendar();
    }
    //-------------------------------------------------------
    // FOR CHARGES GRID
    //-------------------------------------------------------
    if (typeof fn_FillGrid == 'function') {
        fn_FillGrid();
    }

});
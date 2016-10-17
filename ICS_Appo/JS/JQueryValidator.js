//=======================================================================================================================
//  Writte By: Pra$anna R. Newaskar                                                                 Date:05/Feb/2013
//-----------------------------------------------------------------------------------------------------------------------
//Discription: This JS will provide auto validation to elements for that you just need to add attribute i.e 'validation'
//             and its value this js will automaticaly check validations.
//             This JS also contain facility to show tooltip     
//=======================================================================================================================
$(document).ready(function () { var obj = new JSAM(); obj.Reload(); });//JQuery_ExecuteValidator_MANUAL();

//........................................................................................................................
//                                                                                                        COMMON FUNCTION
//........................................................................................................................
function FN_GetMaxWidth() {
    //var width = window.innerWidth || document.body.clientWidth;

    var width = $(window).width();

    return width;
}
//**************************************************************************************************************************
//**************************************************************************************************************************
function FN_GetMaxHeight() {
    //var height = window.innerHeight || document.body.clientHeight;
    var height = $(window).height();
    return height;
}

//**************************************************************************************************************************
//**************************************************************************************************************************
function Fn_QueryString_GET(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}


//**************************************************************************************************************************
//**************************************************************************************************************************
//================================================================================
// Browser Detection
//================================================================================
function Fn_BrowserDetection() {


    var nVer = navigator.appVersion;
    var nAgt = navigator.userAgent;
    var browserName = navigator.appName;
    var fullVersion = '' + parseFloat(navigator.appVersion);
    var majorVersion = parseInt(navigator.appVersion, 10);
    var nameOffset, verOffset, ix;

    // In Opera, the true version is after "Opera" or after "Version"
    if ((verOffset = nAgt.indexOf("Opera")) != -1) {
        browserName = "Opera";
        fullVersion = nAgt.substring(verOffset + 6);
        if ((verOffset = nAgt.indexOf("Version")) != -1)
            fullVersion = nAgt.substring(verOffset + 8);
    }
        // In MSIE, the true version is after "MSIE" in userAgent
    else if ((verOffset = nAgt.indexOf("MSIE")) != -1) {
        browserName = "Microsoft Internet Explorer";
        fullVersion = nAgt.substring(verOffset + 5);
    }
        // In Chrome, the true version is after "Chrome" 
    else if ((verOffset = nAgt.indexOf("Chrome")) != -1) {
        browserName = "Chrome";
        fullVersion = nAgt.substring(verOffset + 7);
    }
        // In Safari, the true version is after "Safari" or after "Version" 
    else if ((verOffset = nAgt.indexOf("Safari")) != -1) {
        browserName = "Safari";
        fullVersion = nAgt.substring(verOffset + 7);
        if ((verOffset = nAgt.indexOf("Version")) != -1)
            fullVersion = nAgt.substring(verOffset + 8);
    }
        // In Firefox, the true version is after "Firefox" 
    else if ((verOffset = nAgt.indexOf("Firefox")) != -1) {
        browserName = "Firefox";
        fullVersion = nAgt.substring(verOffset + 8);
    }
        // In most other browsers, "name/version" is at the end of userAgent 
    else if ((nameOffset = nAgt.lastIndexOf(' ') + 1) <
              (verOffset = nAgt.lastIndexOf('/'))) {
        browserName = nAgt.substring(nameOffset, verOffset);
        fullVersion = nAgt.substring(verOffset + 1);
        if (browserName.toLowerCase() == browserName.toUpperCase()) {
            browserName = navigator.appName;
        }
    }
    // trim the fullVersion string at semicolon/space if present
    if ((ix = fullVersion.indexOf(";")) != -1)
        fullVersion = fullVersion.substring(0, ix);
    if ((ix = fullVersion.indexOf(" ")) != -1)
        fullVersion = fullVersion.substring(0, ix);

    majorVersion = parseInt('' + fullVersion, 10);
    if (isNaN(majorVersion)) {
        fullVersion = '' + parseFloat(navigator.appVersion);
        majorVersion = parseInt(navigator.appVersion, 10);
    }

    if (browserName == 'Opera') {
        if (majorVersion < 4)
            return true;
        else
            return false;
    }
    else if (browserName == 'Microsoft Internet Explorer') {
        if (majorVersion < 9)
            return true;
        else
            return false;

    } else if (browserName == 'Chrome') {
        if (majorVersion < 9)
            return true;
        else
            return false;
    } else if (browserName == 'Safari') {
        if (majorVersion < 2)
            return true;
        else
            return false;
    } else if (browserName == 'Firefox') {
        if (majorVersion < 5)
            return true;
        else
            return false;
    }


}
//**************************************************************************************************************************
//**************************************************************************************************************************
function Fn_SelectAll(colIndex, Obj_Checkbox) {

    var str_Msg = "";
    var Head_Checked = $(Obj_Checkbox)[0].checked;

    if ($(Obj_Checkbox)[0].checked)
        str_Msg = "Do you want to select all?";
    else
        str_Msg = "Do you want to de-select all?";


    if (confirm(str_Msg)) {
        var $row_Curr = $(Obj_Checkbox).closest('tr');
        var $grd_Curr = $($row_Curr).closest("table");


        $grd_Curr.find('tr').each(function () {

            $(this).find('td').eq(colIndex).find("input[type=checkbox]").prop('checked', Head_Checked);
        });
    }
    else {
        $(Obj_Checkbox)[0].checked = !Head_Checked;
    }

}
//**************************************************************************************************************************
//**************************************************************************************************************************
function Fn_SelectAll_Freezed(colIndex, Obj_Checkbox, tablename) {

    var str_Msg = "";
    var Head_Checked = $(Obj_Checkbox)[0].checked;

    if ($(Obj_Checkbox)[0].checked)
        str_Msg = "Do you want to select all?";
    else
        str_Msg = "Do you want to de-select all?";


    if (confirm(str_Msg)) {

        var $grd_Curr = $('#' + tablename);


        $grd_Curr.find('tr').each(function () {

            $(this).find('td').eq(colIndex).find("input[type=checkbox]").prop('checked', Head_Checked);
        });
    }
    else {
        $(Obj_Checkbox)[0].checked = !Head_Checked;
    }

}
//**************************************************************************************************************************
//**************************************************************************************************************************
function Fn_DateValidate(DateStr) {

    var shortDateFormat = "dd/mm/yy";
    var res = true;
    try {

        var Dt = $.datepicker.parseDate(shortDateFormat, DateStr);

        if (Dt == null || Dt == '')
            res = false;

    } catch (error) {
        res = false;
    }

    return res;
}
//**************************************************************************************************************************
//**************************************************************************************************************************
function Fn_TimeValidate(TimeStr) {
    var msg = '';
    var Time_Full = TimeStr.split(" ");
    var Time_First;
    var Hr, Min;

    msg = '1';
    if (Time_Full.length == 2) {
        if (Time_Full[0].length == 5 && Time_Full[1].length == 2) {
            Time_First = Time_Full[0].split(":");

            if (Time_First.length == 2 && (Time_Full[1].toUpperCase() == 'PM' || Time_Full[1].toUpperCase() == 'AM')) {
                Hr = parseInt(Time_First[0]);
                Min = parseInt(Time_First[1]);
                if ((Hr <= 12 && Min <= 59 && Time_Full[1].toUpperCase() == 'AM') || (Hr <= 11 && Min <= 59 && Time_Full[1].toUpperCase() == 'PM')) {
                    msg = '0';
                }
            }
        }

    }

    if (msg == '1')
        return false;

    return true;
}
//**************************************************************************************************************************
//**************************************************************************************************************************
function fn_Validate_RowNonEmpty(obj_Row) {
    var obj = new JSAM();
    var obj1 = new obj.Reload();

    var X_Flag = 0;
    var E_Flag = 0;
    var W_Flag = 0;
    var M_Flag = 0;
    var D_Flag = 0;

    //=====================================================================================
    $(obj_Row).closest('tr').find('input[validation]').each(function (src, obj) {

        if (obj.attributes["validation"].value.indexOf("Row-TextMandatory") != -1) {

            $(this).removeClass("InvalidObject");

            if (this.value.trim() == '') {

                $(obj).addClass("InvalidObject");
                X_Flag = 1;
            }
        }

    });
    //=====================================================================================
    $(obj_Row).closest('tr').find('select[validation]').each(function (src, obj) {

        if (obj.attributes["validation"].value.indexOf("Row-SelectMandatory") != -1) {
            $(this).removeClass("InvalidObject");

            if ($(this)[0].value == 0) {
                $(this).addClass("InvalidObject");
                X_Flag = 1;
            }
        }
    });
    //=====================================================================================
    //$(obj_Row).closest('tr').find('input[validation]').each(function (src, obj) {


    //    //EMAIL ID VAIDATION
    //    if (obj.attributes["validation"].value.indexOf("Email") != -1) {
    //        $(obj).removeClass("InvalidObject");
    //        if (!obj1.fn_EmailId(obj.value.trim()) && obj.value.trim() != '') {
    //            $(this).addClass("InvalidObject");
    //            E_Flag = 2;
    //        }
    //    }
    //    //WebSite VAIDATION
    //    if (obj.attributes["validation"].value.indexOf("Website") != -1) {
    //        $(obj).removeClass("InvalidObject");
    //        if (!fn_WebsiteAddress(obj.value.trim()) && obj.value.trim() != '') {
    //            $(this).addClass("InvalidObject");
    //            W_Flag = 3;
    //        }
    //    }

    //    //Mobile Number
    //    if (obj.attributes["validation"].value.indexOf("Mobile") != -1) {
    //        $(obj).removeClass("InvalidObject");
    //        if (obj.value.length != 10 && obj.value.trim() != '') {
    //            $(this).addClass("InvalidObject");
    //            M_Flag = 4;
    //        }
    //    }
    //    //DATE TIME
    //    if (obj.attributes["validation"].value.indexOf("DatePicker") != -1) {

    //        if (!Fn_DateValidate(obj.value) && obj.value.trim() != '') {
    //            $(this).addClass("InvalidObject");
    //            D_Flag = 5;
    //        }
    //    }

    //});
    //=====================================================================================

    if (X_Flag == 1) {
        alert("Please fill all mandatory fields in row!");
        return false;
    }

    if (E_Flag == 2) {
        alert("Please enter valid Email Id!");
        return false;
    }
    if (W_Flag == 3) {
        alert("Please enter valid Website Address!");
        return false;
    }

    if (M_Flag == 4) {
        alert("Please enter 10 Digit Mobile No!");
        return false;
    }

    if (D_Flag == 5) {
        alert("Please enter valid date(DD-MM-YYYY) format!");
        return false;
    }


    return true;
}
//**************************************************************************************************************************
//**************************************************************************************************************************
function Fn_DateDiff(txt_FromDate, txt_ToDate, Operator) {

    var FromDate = $("#" + txt_FromDate).val().split("/");
    var ToDate = $("#" + txt_ToDate).val().split("/");

    var StartDate = new Date(FromDate[2], FromDate[1] - 1, FromDate[0]);
    var EndDate = new Date(ToDate[2], ToDate[1] - 1, ToDate[0]);

    $("#" + txt_ToDate).removeClass("InvalidObject");
    $("#" + txt_FromDate).removeClass("InvalidObject");

    if (!Fn_DateValidate($("#" + txt_FromDate).val())) {

        $("#" + txt_FromDate).addClass("InvalidObject");
        alert("Please enter valid date(DD-MM-YYYY) format!");
        return false;
    }
    else if (!Fn_DateValidate($("#" + txt_ToDate).val())) {
        $("#" + txt_ToDate).addClass("InvalidObject");
        alert("Please enter valid date(DD-MM-YYYY) format!");
        return false;
    }


    if (Operator == '==') {
        if (StartDate == EndDate)
            return true;
        else {

            $("#" + txt_FromDate).addClass("InvalidObject");
            $("#" + txt_ToDate).addClass("InvalidObject");
            return false;
        }

    }
    else if (Operator == '!=') {
        if (StartDate != EndDate)
            return true;
        else {

            $("#" + txt_FromDate).addClass("InvalidObject");
            $("#" + txt_ToDate).addClass("InvalidObject");
            return false;
        }
    }
    else if (Operator == '<') {
        if (StartDate < EndDate)
            return true;
        else {
            $("#" + txt_FromDate).addClass("InvalidObject");
            $("#" + txt_ToDate).addClass("InvalidObject");
            return false;
        }
    }
    else if (Operator == '>') {
        if (StartDate > EndDate)
            return true;
        else {

            $("#" + txt_FromDate).addClass("InvalidObject");
            $("#" + txt_ToDate).addClass("InvalidObject");
            return false;
        }
    }
    else if (Operator == '<=') {
        if (StartDate <= EndDate)
            return true;
        else {

            $("#" + txt_FromDate).addClass("InvalidObject");
            $("#" + txt_ToDate).addClass("InvalidObject");
            return false;
        }
    }
    else if (Operator == '>=') {
        if (StartDate >= EndDate)
            return true;
        else {

            $("#" + txt_FromDate).addClass("InvalidObject");
            $("#" + txt_ToDate).addClass("InvalidObject");
            return false;
        }
    }
    else if (Operator == 'C') {

        return Math.round((EndDate - StartDate) / 1000 / 60 / 60 / 24);
    }
}
//**************************************************************************************************************************
//**************************************************************************************************************************
function fn_DoValidInValid_object(obj, flag) {
    if (flag == true) {
        $(obj).removeClass("InvalidObject");
    }
    else if (flag == false) {
        $(obj).addClass("InvalidObject");
    }
}
//**************************************************************************************************************************
//**************************************************************************************************************************
function Fn_RowMouseOver(rowIndex, s_GridID) {
    var grd = $("#" + s_GridID);
    var grd_Freez = $("#" + s_GridID + 'Freeze');

    if (!($(grd[0].rows[rowIndex - 1]).hasClass("FooterLine"))) {
        RowClassName = grd[0].rows[rowIndex - 1].className;
        grd[0].rows[rowIndex - 1].className = 'mGrid_tr_hover';

        if (grd_Freez[0])
            grd_Freez[0].rows[rowIndex - 1].className = 'mGrid_tr_hover';
    }
}
//**************************************************************************************************************************
//**************************************************************************************************************************
function Fn_RowMouseOut(rowIndex, s_GridID) {
    var grd = $("#" + s_GridID);
    var grd_Freez = $("#" + s_GridID + 'Freeze');
    if (!($(grd[0].rows[rowIndex - 1]).hasClass("FooterLine"))) {
        $(grd[0].rows[rowIndex - 1]).removeClass("mGrid_tr_hover");

        grd[0].rows[rowIndex - 1].className = RowClassName;

        if (grd_Freez[0]) {
            $(grd_Freez[0].rows[rowIndex - 1]).removeClass("mGrid_tr_hover");

            grd_Freez[0].rows[rowIndex - 1].className = RowClassName;
        }
    }
}
//**************************************************************************************************************************
//**************************************************************************************************************************
var RowClassName = '';
function Fn_Gridview_FixHeaderColumn(s_GridViewID, i_ColumnCount) {
    var gridview = $("#" + s_GridViewID);
    var gridview_Freez;
    var WindowHeight = FN_GetMaxHeight() * 0.75;
    var WindowWidth = FN_GetMaxWidth() * 0.90;

    var i = 0;

    $("#" + s_GridViewID).find("tr").each(function (s, e) {

        i = i + 1;

        $(this).attr('onmouseover', 'Fn_RowMouseOver(' + i + ',"' + s_GridViewID + '")');
        $(this).attr('onmouseout', 'Fn_RowMouseOut(' + i + ',"' + s_GridViewID + '")');
    });


    gridview.gridviewScroll({
        width: WindowWidth,
        height: WindowHeight,
        freezesize: i_ColumnCount,
        varrowtopimg: "../../Plugins/GridViewScroll/Images/arrowvt.png",
        varrowbottomimg: "../../Plugins/GridViewScroll/Images/arrowvb.png",
        harrowleftimg: "../../Plugins/GridViewScroll/Images/arrowhl.png",
        harrowrightimg: "../../Plugins/GridViewScroll/Images/arrowhr.png",
        arrowsize: 12,
        railsize: 12,
        barsize: 8
    });
    gridview_Freez = $("#" + s_GridViewID + 'Freeze');
    if (gridview_Freez[0])
        gridview_Freez[0].className = 'gv_ScrollDisplay mGrid mGrid_Freez';
}
//**************************************************************************************************************************
//**************************************************************************************************************************
function Fn_Gridview_FixHeaderColumn(s_GridViewID, i_ColumnCount, WidthInPercent, HeightInPercent) {

    var gridview = $("#" + s_GridViewID);
    var gridview_Freez;
    var WindowHeight = FN_GetMaxHeight() * parseFloat(HeightInPercent);
    var WindowWidth = FN_GetMaxWidth() * parseFloat(WidthInPercent);

    var i = 0;

    $("#" + s_GridViewID).find("tr").each(function (s, e) {

        i = i + 1;

        $(this).attr('onmouseover', 'Fn_RowMouseOver(' + i + ',"' + s_GridViewID + '")');
        $(this).attr('onmouseout', 'Fn_RowMouseOut(' + i + ',"' + s_GridViewID + '")');
    });


    gridview.gridviewScroll({
        width: WindowWidth,
        height: WindowHeight,
        freezesize: i_ColumnCount,
        varrowtopimg: "../../Plugins/GridViewScroll/Images/arrowvt.png",
        varrowbottomimg: "../../Plugins/GridViewScroll/Images/arrowvb.png",
        harrowleftimg: "../../Plugins/GridViewScroll/Images/arrowhl.png",
        harrowrightimg: "../../Plugins/GridViewScroll/Images/arrowhr.png",
        arrowsize: 12,
        railsize: 12,
        barsize: 8
    });
    gridview_Freez = $("#" + s_GridViewID + 'Freeze');
    if (gridview_Freez[0])
        gridview_Freez[0].className = 'gv_ScrollDisplay mGrid mGrid_Freez';
}
//**************************************************************************************************************************
//**************************************************************************************************************************
function Fn_Control_AutoHeightWidth_SET(s_ControlID, s_Type) {
    var Control = $("#" + s_ControlID);
    if (Control[0]) {
        var WindowHeight = FN_GetMaxHeight() * 0.70;
        var WindowWidth = FN_GetMaxWidth() * 0.90;

        if (s_Type.toUpperCase() == 'WIDTH') {

            $("#" + s_ControlID).css('width', WindowWidth + 'px');
            $("#" + s_ControlID).css('overflow', 'auto');

        }
        else if (s_Type == 'HEIGHT') {
            $("#" + s_ControlID).css('height', WindowHeight + 'px');
            $("#" + s_ControlID).css('overflow', 'auto');


        }
        else if (s_Type == 'BOTH') {

            $("#" + s_ControlID).css('width', WindowWidth + 'px');
            $("#" + s_ControlID).css('height', WindowHeight + 'px');
            $("#" + s_ControlID).css('overflow', 'auto');

        }

    }
}
//**************************************************************************************************************************
//**************************************************************************************************************************

//#####################################################################################################################################
//JSAM FUNCTION LIBRARY
//#####################################################################################################################################

function JSAM() {
    this.Reload = Reload;
    function Reload() {
        var obj;

        this.fn_ValidateNonEmpty = fn_ValidateNonEmpty;
        this.fn_Validate_TextBoxData = fn_Validate_TextBoxData;
        this.fn_ValidateTable_All = fn_ValidateTable_All;




        var CheckedRow_Length = 0;
        var InsertedRow_Lengh = 0;
        //-----------------------------------------------------------------------------------------------------------------------
        //For IE7 if trim is not found this will write it
        if (typeof String.prototype.trim !== 'function') {
            String.prototype.trim = function () {
                return this.replace(/^\s+|\s+$/g, '');
            }
        }

        function Fn_ValidatePage() {

            var flag_nonempty = fn_ValidateNonEmpty();
            var flag_Validate = fn_ValidateTable_All();

            if (flag_nonempty && flag_Validate)
                return true;
            else {
                if (!flag_nonempty) {
                    alert('Please fill mandatory fields!');
                }
                else if (!flag_Validate) {
                    alert('Please fill fields in the table!');
                }
                return false;
            }
        }

        function fn_Length(src) {

            var AttrClass = src.attributes['validation'].value;
            if (AttrClass.indexOf('Length') != -1) {
                var AttrArray = AttrClass.split(';');
                for (var i = 0; i < AttrArray.length; i++) {
                    if (AttrArray[i].indexOf('Length') != -1) {
                        var arrLength = AttrArray[i].split(':');

                        var CurrLenth = src.value.length;
                        var AllowedLenth = 0;

                        if (arrLength[1].trim() != '' && parseInt(arrLength[1].trim()))
                            AllowedLenth = parseInt(arrLength[1].trim());

                        if (AllowedLenth == 0)
                            return -1;
                        else
                            return AllowedLenth - CurrLenth;

                    }
                }

            }
            else
                return -1;
        }

        function fn_PastStop(obj) {
            $(obj).bind('paste', function (e) {
                e.preventDefault(); //disable cut,copy,paste
                alert('Paste option is disabled !!');
            });
        }
        function fn_GetCharCode(evt) {
            var charCode = -999999;

            if (evt != null && evt != 'undefined' && evt != undefined)
                charCode = (evt.which) ? evt.which : event.keyCode;
            else
                charCode = event.keyCode;

            return charCode;
        }
        function fn_Double(src, evt) {

            var at_length = fn_Length(src);
            var prevText = src.value;
            var charCode = fn_GetCharCode(evt);

            if (at_length == 0 && (charCode != 8 && charCode != 46))
                return false;

            if (charCode == 8)
                return true;

            if (charCode == 46 && prevText.indexOf(".") != -1)
                return false;

            if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57))
                return false;


            return true;
        }
        function fn_Int(src, evt) {

            var at_length = fn_Length(src);

            var charCode = fn_GetCharCode(evt);

            if (charCode == 46)
                return false;

            if (charCode == 32 || charCode == 46)
                return true;

            if (charCode > 31 && (charCode < 48 || charCode > 57 || charCode == 46))
                return false;

            return true;
        }
        function fn_String(src, evt) {

            var prevText = src.value;

            var at_length = fn_Length(src);

            var charCode = fn_GetCharCode(evt);

            if (at_length == 0 && (charCode != 8 && charCode != 46))
                return false;

            if (charCode == 8 || charCode == 46)
                return true;



            if ((charCode >= 65 && charCode <= 90) || (charCode >= 97 && charCode <= 122) || charCode == 32)
                return true;

            return false;
        }
        function fn_AlphaNumeric(src, evt) {
            var at_length = fn_Length(src);
            var charCode = fn_GetCharCode(evt);

            if (at_length == 0 && (charCode != 8 && charCode != 46))
                return false;


            if (charCode == 8 || charCode == 46)
                return true;



            if ((charCode >= 65 && charCode <= 90) || (charCode >= 97 && charCode <= 122) || charCode == 32)
                return true;

            if (!(charCode >= 65 && charCode <= 90) && !(charCode >= 97 && charCode <= 122) && charCode != 32 && !(charCode >= 48 && charCode <= 57))
                return false;


            return true;

        }
        function fn_SpecialCharacter(src, evt) {
            var at_length = fn_Length(src);
            var charCode = fn_GetCharCode(evt);

            if (at_length == 0 && (charCode != 8 && charCode != 46))
                return false;

            if (charCode == 8 || charCode == 46)
                return true;

            if (!(charCode >= 65 && charCode <= 90) && !(charCode >= 97 && charCode <= 122) && charCode != 32 && !(charCode >= 48 && charCode <= 57))
                return true;

            return false;
        }
        function fn_EmailId(emailAddress) {
            var pattern = new RegExp(/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i);
            return pattern.test(emailAddress);
        }
        function fn_WebsiteAddress(WebAddress) {
            var pattern = new RegExp("^(http:\/\/www.|https:\/\/www.|ftp:\/\/www.|www.){1}([0-9A-Za-z]+\.)");

            return pattern.test(WebAddress);
        }
        function fn_DateValidate(DateStr) {
            var shortDateFormat = "dd/mm/yy";
            var res = true;
            try {

                var Dt = $.datepicker.parseDate(shortDateFormat, DateStr);

                if (Dt == null || Dt == '')
                    res = false;

            } catch (error) {
                res = false;
            }

            return res;
        }

        function fn_Mobile(src, evt) {
            var at_length = 10 - src.value.length;
            var charCode = fn_GetCharCode(evt);

            if (at_length == 0)
                return false;

            if (charCode == 46)
                return false;

            if (charCode > 31 && (charCode < 48 || charCode > 57 || charCode == 46))
                return false;

            return true;
        }
        //-----------------------------------------------------------------------------------------------------------------------
        function fn_DoValidInValid(id, flag) {
            if (flag == true) {
                $("#" + id).removeClass("InvalidObject");
            }
            else if (flag == false) {
                $("#" + id).addClass("InvalidObject");
            }
        }
        function fn_DoValidInValid_object(obj, flag) {
            if (flag == true) {
                $(obj).removeClass("InvalidObject");
            }
            else if (flag == false) {
                $(obj).addClass("InvalidObject");
            }
        }

        function fn_Validate_TextBoxData() {
            var E_Flag = 0;
            var W_Flag = 0;
            var M_Flag = 0;
            var D_Flag = 0;

            flag = 0;

            $('input[validation]').each(function (src, obj) {

                //EMAIL ID VAIDATION
                if (obj.attributes["validation"].value.indexOf("Email") != -1) {

                    fn_DoValidInValid_object(this, true);

                    if (!fn_EmailId(obj.value.trim()) && obj.value.trim() != '') {
                        fn_DoValidInValid_object(this, false);
                        E_Flag = 2;
                    }
                }
                //WebSite VAIDATION
                if (obj.attributes["validation"].value.indexOf("Website") != -1) {

                    fn_DoValidInValid_object(this, true);

                    if (!fn_WebsiteAddress(obj.value.trim()) && obj.value.trim() != '') {
                        fn_DoValidInValid_object(this, false);
                        W_Flag = 3;
                    }
                }

                //Mobile Number
                if (obj.attributes["validation"].value.indexOf("Mobile") != -1) {


                    if (obj.value.length != 10 && obj.value.trim() != '') {
                        fn_DoValidInValid_object(this, false);
                        M_Flag = 4;
                    }
                }

                if (obj.attributes["validation"].value.indexOf("DatePicker") != -1) {
                    try {
                        if (!fn_DateValidate(obj.value.trim()) && obj.value.trim() != '') {
                            fn_DoValidInValid_object(this, false);

                            D_Flag = 5;
                        }
                    }
                    catch (error) {
                        D_Flag = 5;
                    }


                }
            });

            if (E_Flag == 2) {
                alert("Please enter valid Email Id!");
                return false;
            }
            if (W_Flag == 3) {
                alert("Please enter valid Website Address!");
                return false;
            }

            if (M_Flag == 4) {
                alert("Please enter 10 Digit Mobile No!");
                return false;
            }

            if (D_Flag == 5) {
                alert("Please enter valid date(DD-MM-YYYY) format!");
                return false;
            }
            return true;
        }

        function fn_ValidateNonEmpty() {

            var rst_txt = fn_validateNonEmpty_TextBox();
            var rst_drp = fn_ValidateNonEmpty_DropDown();
            return (rst_txt && rst_drp);
        }
        function fn_validateNonEmpty_TextBox() {
            // debugger;
            var flag = 0;
            $('input[validation]').each(function (src, obj) {
                if (obj.attributes["validation"].value.indexOf("Non-Empty") != -1) {
                    fn_DoValidInValid_object(this, true);

                    if (obj.value.trim() == '') {
                        fn_DoValidInValid_object(this, false);

                        flag = 1;
                    }
                }
            });
            $('textarea[validation]').each(function (src, obj) {
                if (obj.attributes["validation"].value.indexOf("Non-Empty") != -1) {
                    fn_DoValidInValid_object(this, true);

                    if (obj.value.trim() == '') {
                        fn_DoValidInValid_object(this, false);

                        flag = 1;
                    }
                }
            });
            if (flag == 1)
                return false
            return true;
        }
        function fn_ValidateNonEmpty_DropDown() {
            var flag = 0;
            $('select[validation = Non-Empty-Dropdown]').each(function (src, obj) {
                if (obj != null) {
                    fn_DoValidInValid_object(this, true);
                    if (obj.value == -1) {
                        fn_DoValidInValid_object(this, false);

                        flag = 1;
                    }
                }
            });
            if (flag == 1)
                return false
            return true;
        }
        function fn_ValidateTable_CheckedRows(tblId, length) {
            CheckedRow_Length = length;
            //debugger;

            if ($("#" + tblId)) {

                fn_DoValidInValid(tblId, true);
                if ($('table#' + tblId + ' input[type=checkbox]:checked').length < length) {
                    fn_DoValidInValid(tblId, false);
                    return false;
                }
                else
                    return true;
            }
        }
        function fn_ValidateTable_Checked() {
            var flag = 0;
            var rtVal = true;
            $('table[validation]').each(function (src, obj) {
                var AttValue = '';
                // debugger;
                if (obj != null) {
                    AttValue = obj.attributes['validation'].value;

                    if (AttValue.indexOf("Table-Checked") != -1) {
                        var AttList = AttValue.split(';');

                        for (var i = 0; i < AttList.length; i++) {
                            if (AttList[i].indexOf("Table-Checked") != -1) {
                                var SelectAtts = AttList[i].split(':');
                                if (SelectAtts.length > 1)
                                    rtVal = fn_ValidateTable_CheckedRows(this.id, SelectAtts[1]);
                                else
                                    rtVal = fn_ValidateTable_CheckedRows(this.id, 1);

                                if (rtVal == true)
                                    flag = 1;
                            }
                        }

                    }
                }
            });
            if (flag == 1)
                return true;
            else
                return false;
        }
        function fn_ValidateTable_InsertedRows(tblId, length) {
            InsertedRow_Lengh = length;
            //debugger;
            if ($("#" + tblId)) {
                fn_DoValidInValid(tblId, true);
                if (($('#' + tblId).find("tr").length - 1) < length) {
                    fn_DoValidInValid(tblId, false);
                    return false;
                }
                else
                    return true;
            }
        }
        function fn_ValidateTable_Rows() {
            var flag = 0;
            var rtVal = true;

            $('table[validation]').each(function (src, obj) {
                var AttValue = '';
                // debugger;
                if (obj != null) {
                    AttValue = obj.attributes['validation'].value;

                    if (AttValue.indexOf("Table-Rows") != -1) {
                        var AttList = AttValue.split(';');

                        for (var i = 0; i < AttList.length; i++) {
                            if (AttList[i].indexOf("Table-Rows") != -1) {
                                var SelectAtts = AttList[i].split(':');
                                if (SelectAtts.length > 1)
                                    rtVal = fn_ValidateTable_InsertedRows(this.id, SelectAtts[1]);
                                else
                                    rtVal = fn_ValidateTable_InsertedRows(this.id, 1);

                                if (rtVal == true)
                                    flag = 1;
                            }
                        }

                    }
                }
            });

            if (flag == 1)
                return true;
            else
                return false;
        }
        function fn_ValidateReadOnly(obj) {
            $(obj).attr('readonly', true);
        }
        function fn_ValidateTable_All() {


            var result1 = fn_ValidateTable_Rows();
            var result2 = fn_ValidateTable_Checked();


            if (!result1 && InsertedRow_Lengh > 0) {
                alert('Please add atleast ' + InsertedRow_Lengh + ' items in list!');

            }
            else if (!result2 && CheckedRow_Length > 0) {
                alert('Please select atleast ' + CheckedRow_Length + ' items from list!');
            }

            if (InsertedRow_Lengh <= 0)
                result1 = true;

            if (CheckedRow_Length <= 0)
                result2 = true;


            return (result1 && result2);
        }
        function fn_DateTimePicker_Assign(flag, obj) {
            if (flag == 1) {
                $(obj).datepicker(
                    {
                        changeMonth: true,
                        changeYear: true,
                        showOn: "button",
                        buttonImage: "../calendar.gif",
                        buttonImageOnly: true,
                        dateFormat: "dd/mm/yy"
                    }).mask("99/99/9999");;
            }
            else if (flag == 2) {
                $(obj).timepicker({

                    timeFormat: 'hh:mm tt'
                });
            }
            else if (flag == 3) {

                $(obj).datetimepicker({
                    changeMonth: true,
                    changeYear: true,
                    showOn: "button",
                    buttonImage: "../calendar.gif",
                    buttonImageOnly: true,
                    dateFormat: 'dd/mm/yy',
                    showDate: true,
                    showSecond: false,

                    timeFormat: 'HH:mm'
                }).mask("99/99/9999 99:99");

            }
            else if (flag == 4) {
                $(obj).datepicker(
                    {
                        changeMonth: true,
                        changeYear: true,
                        showOn: "focus",
                        buttonImageOnly: false,
                        dateFormat: "dd/mm/yy"
                    }).mask("99/99/9999");;
            }

        }
        //-----------------------------------------------------------------------------------------------------------------------
        $('[validation]').each(function (src, obj) {

            //============================================================================================================
            //                                         Validate All Validations
            //============================================================================================================
            if (obj != null) {
                if (obj.attributes["validation"].value.indexOf("ValidatePage") != -1) {

                    this.onclick = function (src, event) {
                        var flag_nonempty = fn_ValidateNonEmpty();
                        var flag_Validate = fn_ValidateTable_All();

                        if (flag_nonempty && flag_Validate)
                            return true;
                        else {
                            if (!flag_nonempty) {
                                alert('Please fill mandatory fields!');
                            }
                            else if (!flag_Validate) {
                                alert('Please fill fields in the table!');
                            }
                            return false;
                        }
                    };
                }
                //============================================================================================================
                //                                         Validate Selected Rows From Table
                //============================================================================================================
                if (obj.attributes["validation"].value.indexOf("ValidateTable") != -1) {

                    if (obj.attributes["validation"].value.indexOf("ValidateTable-Checked") != -1) {
                        this.onclick = function (src, event) {
                            if (fn_ValidateTable_Checked())
                                return true;
                            else {
                                alert('Please select atleast ' + CheckedRow_Length + ' items from list!');
                                return false;
                            }
                        };
                    }
                    //============================================================================================================
                    //                              Validate Present Rows In Table
                    //============================================================================================================
                    if (obj.attributes["validation"].value.indexOf("ValidateTable-Rows") != -1) {
                        this.onclick = function (src, event) {
                            if (fn_ValidateTable_Rows())
                                return true;
                            else {
                                alert('Please add atleast ' + InsertedRow_Lengh + ' items in list!');
                                return false;
                            }
                        };
                    }
                    //============================================================================================================
                    //                                         Validate All Table Validations
                    //============================================================================================================
                    if (obj.attributes["validation"].value.indexOf("ValidateTable-All") != -1) {
                        this.onclick = function (src, event) {
                            if (fn_ValidateTable_All())
                                return true;
                            else {
                                return false;
                            }
                        };
                    }
                }
                //============================================================================================================
                //                                         Validate Textbox Non-Empty
                //============================================================================================================
                if (obj.attributes["validation"].value.indexOf("ValidateTextbox-NonEmpty") != -1) {
                    this.onclick = function (src, event) {
                        return fn_validateNonEmpty_TextBox();

                    };
                }

                //============================================================================================================
                //                                         Validate DropDown Non-Empty
                //============================================================================================================
                if (obj.attributes["validation"].value.indexOf("ValidateDropdown-NonEmpty") != -1) {
                    this.onclick = function (src, event) {
                        //  debugger;
                        return fn_ValidateNonEmpty_DropDown();
                    };
                }

            }
        });
        $('[validation=]').each(function (src, obj) {
            if (obj != null) {
                this.onclick = function (src, event) {
                    if (fn_ValidateNonEmpty())
                        return true;
                    else {
                        alert('Please fill mandatory fields!');
                        return false;
                    }
                };
            }

        });
        $('input[validation]').each(function (src, obj) {
            if (obj != null) {
                if (obj.attributes["validation"].value.indexOf("Double") != -1)
                    this.onkeypress = function (src, event) { return fn_Double(this, src); };


                if (obj.attributes["validation"].value.indexOf("Int") != -1)
                    this.onkeypress = function (src, event) { return fn_Int(this, src); };

                if (obj.attributes["validation"].value.indexOf("String") != -1)
                    this.onkeypress = function (src, event) {
                        return fn_String(this, src);
                    };

                if (obj.attributes["validation"].value.indexOf("AlphaNumeric") != -1)
                    this.onkeypress = function (src, event) { return fn_AlphaNumeric(this, src); };

                if (obj.attributes["validation"].value.indexOf("SpecialCharacter") != -1)
                    this.onkeypress = function (src, event) { return fn_SpecialCharacter(this, src); };

                //====================================================================================

                if (obj.attributes["validation"].value.indexOf("DateTimePicker") != -1)
                    fn_DateTimePicker_Assign(3, this);

                else if (obj.attributes["validation"].value.indexOf("DatePicker") != -1)
                    fn_DateTimePicker_Assign(1, this);

                else if (obj.attributes["validation"].value.indexOf("TimePicker") != -1)
                    fn_DateTimePicker_Assign(2, this);

                else if (obj.attributes["validation"].value.indexOf("DateNoIconPicker") != -1)
                    fn_DateTimePicker_Assign(4, this);

                //====================================================================================

                if (obj.attributes["validation"].value.indexOf("ReadOnly") != -1)
                    fn_ValidateReadOnly(this);

                if (obj.attributes["validation"].value.indexOf("Mobile") != -1)
                    this.onkeypress = function (src, event) { return fn_Mobile(this, src); };
            }


        });

        $('textarea[validation]').each(function (src, obj) {
            if (obj != null) {
                if (obj.attributes["validation"].value.indexOf("Double") != -1)
                    this.onkeypress = function (src, event) { return fn_Double(this, src); };


                if (obj.attributes["validation"].value.indexOf("Int") != -1)
                    this.onkeypress = function (src, event) { return fn_Int(this, src); };

                if (obj.attributes["validation"].value.indexOf("String") != -1)
                    this.onkeypress = function (src, event) { return fn_String(this, src); };

                if (obj.attributes["validation"].value.indexOf("AlphaNumeric") != -1)
                    this.onkeypress = function (src, event) { return fn_AlphaNumeric(this, src); };

                if (obj.attributes["validation"].value.indexOf("SpecialCharacter") != -1)
                    this.onkeypress = function (src, event) { return fn_SpecialCharacter(this, src); };

                if (obj.attributes["validation"].value.indexOf("DatePicker") != -1)
                    fn_DateTimePicker_Assign(1, this);

                if (obj.attributes["validation"].value.indexOf("TimePicker") != -1)
                    fn_DateTimePicker_Assign(2, this);

                if (obj.attributes["validation"].value.indexOf("DateTimePicker") != -1)
                    fn_DateTimePicker_Assign(3, this);

                if (obj.attributes["validation"].value.indexOf("ReadOnly") != -1)
                    fn_ValidateReadOnly(this);
            }

        });

        /*=============================================================================================================================*/
        /*                                                 # Dynamic Tooptip Control #                                                 */
        /*-----------------------------------------------------------------------------------------------------------------------------*/
        /*  Created By:Prasanna R. Newaskar                                                         Date:19-Feb-2013                   */
        /*=============================================================================================================================*/

        var changeTooltipPosition = function (event) {
            // debugger;
            var dH = $('div#_dv_CommonToolTipDiv').height();
            var dW = $('div#_dv_CommonToolTipDiv').width();
            var tX = 0;
            var tY = 0;
            var tooltipX = event.pageX - 1;
            var tooltipY = event.pageY + 8;
            var width = window.innerWidth || document.body.clientWidth;
            var height = window.innerHeight || document.body.clientHeight;

            if ((dH != null || dH != undefined) && (dW != null || dW != undefined)) {

                if ((dW + event.pageX) > width - 50)
                    tooltipX = event.pageX - dW - 30;

                if ((dH + event.pageY) > height - 50)
                    tooltipY = event.pageY - dH - 30;

            }
            if (tooltipX < 30) {
                tooltipX = 45
            }
            $('div#_dv_CommonToolTipDiv').css({ top: tooltipY, left: tooltipX, 'max-width': width * 0.60, 'z-index': 100005 });
        };
        function ExecuteFunction(name, arguments) {
            var fn = window[name];
            if (typeof fn !== 'function')
                return;
            arguments = eval(arguments);
            return fn.apply(window, arguments);
        }
        var showTooltip = function (event) {
            $('div#_dv_CommonToolTipDiv').remove();
            // debugger;
            var toolText = this.attributes["tooltiptext"].value.trim();
            var funFormatString = 'ex:function(';


            if (toolText.length > 0) {
                if (toolText.indexOf(funFormatString) != -1) {

                    var stIndex = parseInt(toolText.indexOf(funFormatString)) + parseInt(funFormatString.length);

                    var tmpText = toolText.substring(stIndex, toolText.length);

                    var fnName = '';
                    var args = null;

                    if (tmpText.indexOf(',') != -1)
                        fnName = tmpText.substring(0, tmpText.indexOf(','));
                    else if (tmpText.indexOf(')') != -1)
                        fnName = tmpText.substring(0, tmpText.indexOf(')'));
                    else
                        fnName = tmpText;

                    fnName = fnName.replace(/'/g, '');
                    fnName = fnName.replace("(", '');
                    fnName = fnName.replace(")", '');
                    fnName = fnName.replace(/;/g, '');

                    if (tmpText.indexOf('[') != -1)
                        args = tmpText.substring(tmpText.indexOf('['), tmpText.indexOf(']') + 1);

                    toolText = ExecuteFunction(fnName, args);


                }
            }
            else {

                if (this.tagName == 'SELECT') {
                    toolText = this.value;

                    var SelIndex = $(this)[0].selectedIndex;
                    toolText = $(this)[0].options[SelIndex].innerHTML;

                }
                else if (this.tagName == 'INPUT') {
                    toolText = this.value;
                }
                else if (this.tagName == 'TEXTAREA') {
                    toolText = this.value;
                }
                else if (this.tagName == 'TABLE') {
                    toolText = this.value;

                    $('#' + this.id + ' [tooltiptext]').each(function (src, obj) {
                        if (obj != null) {
                            $(this).bind('mousemove', changeTooltipPosition);
                            $(this).bind('mouseenter', showTooltip);
                            $(this).bind('mouseleave', hideTooltip);
                        }
                    });
                }
                else if (this.tagName == 'TR') {
                    toolText = this.value;

                    $('#' + this.id + ' [tooltiptext]').each(function (src, obj) {
                        if (obj != null) {
                            $(this).bind('mousemove', changeTooltipPosition);
                            $(this).bind('mouseenter', showTooltip);
                            $(this).bind('mouseleave', hideTooltip);
                        }
                    });
                }
                else if (this.tagName == 'SPAN') {
                    toolText = $(this).html();

                    $('#' + this.id + ' [tooltiptext]').each(function (src, obj) {
                        if (obj != null) {
                            $(this).bind('mousemove', changeTooltipPosition);
                            $(this).bind('mouseenter', showTooltip);
                            $(this).bind('mouseleave', hideTooltip);
                        }
                    });
                }

            }

            if (toolText == '')
                toolText = 'empty';

            $('<div id="_dv_CommonToolTipDiv" class="JSAM_ToolTip">' + toolText + '</div>').appendTo('body');

            //$('<div id="_dv_CommonToolTipDiv" style="margin:8px;padding:8px;border:1px solid #bab8b8;background-color:#F6F6F7;position: absolute;font-family:Verdana;font-size:8pt;font-weight:normal;color:black;z-index: 2;">' + toolText + '</div>').appendTo('body');
            //$('#_dv_CommonToolTipDiv').html(toolText);
            changeTooltipPosition(event);
        };
        var hideTooltip = function () {
            $('div#_dv_CommonToolTipDiv').remove();
        };
        $('[tooltiptext]').each(function (src, obj) {

            if (obj != null) {
                $(this).bind('mousemove', changeTooltipPosition);
                $(this).bind('mouseenter', showTooltip);
                $(this).bind('mouseleave', hideTooltip);
            }
        });

    }//);
}
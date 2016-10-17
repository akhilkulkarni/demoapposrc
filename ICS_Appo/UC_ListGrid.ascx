<%@ Control Language="VB" AutoEventWireup="false" CodeFile="UC_ListGrid.ascx.vb" Inherits="UC_ListGrid" %>
<meta http-equiv="content-type" content="text/plain; charset=UTF-8"/>
<script type="text/javascript">
    /*
    * Copyright (c) 2010 Nick Galbreath
    * http://code.google.com/p/stringencoders/source/browse/#svn/trunk/javascript
    *
    * Permission is hereby granted, free of charge, to any person
    * obtaining a copy of this software and associated documentation
    * files (the "Software"), to deal in the Software without
    * restriction, including without limitation the rights to use,
    * copy, modify, merge, publish, distribute, sublicense, and/or sell
    * copies of the Software, and to permit persons to whom the
    * Software is furnished to do so, subject to the following
    * conditions:
    *
    * The above copyright notice and this permission notice shall be
    * included in all copies or substantial portions of the Software.
    *
    * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
    * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
    * OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
    * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
    * HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
    * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
    * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
    * OTHER DEALINGS IN THE SOFTWARE.
    */

    /* base64 encode/decode compatible with window.btoa/atob
    *
    * window.atob/btoa is a Firefox extension to convert binary data (the "b")
    * to base64 (ascii, the "a").
    *
    * It is also found in Safari and Chrome.  It is not available in IE.
    *
    * if (!window.btoa) window.btoa = base64.encode
    * if (!window.atob) window.atob = base64.decode
    *
    * The original spec's for atob/btoa are a bit lacking
    * https://developer.mozilla.org/en/DOM/window.atob
    * https://developer.mozilla.org/en/DOM/window.btoa
    *
    * window.btoa and base64.encode takes a string where charCodeAt is [0,255]
    * If any character is not [0,255], then an DOMException(5) is thrown.
    *
    * window.atob and base64.decode take a base64-encoded string
    * If the input length is not a multiple of 4, or contains invalid characters
    *   then an DOMException(5) is thrown.
    */
    var base64 = {};
    base64.PADCHAR = '=';
    base64.ALPHA = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/';

    base64.makeDOMException = function () {
        // sadly in FF,Safari,Chrome you can't make a DOMException
        var e, tmp;

        try {
            return new DOMException(DOMException.INVALID_CHARACTER_ERR);
        } catch (tmp) {
            // not available, just passback a duck-typed equiv
            // https://developer.mozilla.org/en/Core_JavaScript_1.5_Reference/Global_Objects/Error
            // https://developer.mozilla.org/en/Core_JavaScript_1.5_Reference/Global_Objects/Error/prototype
            var ex = new Error("DOM Exception 5");

            // ex.number and ex.description is IE-specific.
            ex.code = ex.number = 5;
            ex.name = ex.description = "INVALID_CHARACTER_ERR";

            // Safari/Chrome output format
            ex.toString = function () { return 'Error: ' + ex.name + ': ' + ex.message; };
            return ex;
        }
    }

    base64.getbyte64 = function (s, i) {
        // This is oddly fast, except on Chrome/V8.
        //  Minimal or no improvement in performance by using a
        //   object with properties mapping chars to value (eg. 'A': 0)
        var idx = base64.ALPHA.indexOf(s.charAt(i));
        if (idx === -1) {
            throw base64.makeDOMException();
        }
        return idx;
    }

    base64.decode = function (s) {
        // convert to string
        s = '' + s;
        var getbyte64 = base64.getbyte64;
        var pads, i, b10;
        var imax = s.length
        if (imax === 0) {
            return s;
        }

        if (imax % 4 !== 0) {
            throw base64.makeDOMException();
        }

        pads = 0
        if (s.charAt(imax - 1) === base64.PADCHAR) {
            pads = 1;
            if (s.charAt(imax - 2) === base64.PADCHAR) {
                pads = 2;
            }
            // either way, we want to ignore this last block
            imax -= 4;
        }

        var x = [];
        for (i = 0; i < imax; i += 4) {
            b10 = (getbyte64(s, i) << 18) | (getbyte64(s, i + 1) << 12) |
                (getbyte64(s, i + 2) << 6) | getbyte64(s, i + 3);
            x.push(String.fromCharCode(b10 >> 16, (b10 >> 8) & 0xff, b10 & 0xff));
        }

        switch (pads) {
            case 1:
                b10 = (getbyte64(s, i) << 18) | (getbyte64(s, i + 1) << 12) | (getbyte64(s, i + 2) << 6);
                x.push(String.fromCharCode(b10 >> 16, (b10 >> 8) & 0xff));
                break;
            case 2:
                b10 = (getbyte64(s, i) << 18) | (getbyte64(s, i + 1) << 12);
                x.push(String.fromCharCode(b10 >> 16));
                break;
        }
        return x.join('');
    }

    base64.getbyte = function (s, i) {
        var x = s.charCodeAt(i);
        if (x > 255) {
            throw base64.makeDOMException();
        }
        return x;
    }

    base64.encode = function (s) {
        if (arguments.length !== 1) {
            throw new SyntaxError("Not enough arguments");
        }
        var padchar = base64.PADCHAR;
        var alpha = base64.ALPHA;
        var getbyte = base64.getbyte;

        var i, b10;
        var x = [];

        // convert to string
        s = '' + s;

        var imax = s.length - s.length % 3;

        if (s.length === 0) {
            return s;
        }
        for (i = 0; i < imax; i += 3) {
            b10 = (getbyte(s, i) << 16) | (getbyte(s, i + 1) << 8) | getbyte(s, i + 2);
            x.push(alpha.charAt(b10 >> 18));
            x.push(alpha.charAt((b10 >> 12) & 0x3F));
            x.push(alpha.charAt((b10 >> 6) & 0x3f));
            x.push(alpha.charAt(b10 & 0x3f));
        }
        switch (s.length - imax) {
            case 1:
                b10 = getbyte(s, i) << 16;
                x.push(alpha.charAt(b10 >> 18) + alpha.charAt((b10 >> 12) & 0x3F) +
                       padchar + padchar);
                break;
            case 2:
                b10 = (getbyte(s, i) << 16) | (getbyte(s, i + 1) << 8);
                x.push(alpha.charAt(b10 >> 18) + alpha.charAt((b10 >> 12) & 0x3F) +
                       alpha.charAt((b10 >> 6) & 0x3f) + padchar);
                break;
        }
        return x.join('');
    }

</script>
<script type="text/javascript">
    function Fn_OpenFile(fileName) {
        alert('HI');
        window.open(fileName, '', 'toolbar=no, menubar=yes,width=790, height=555, top=0, left=0, right=0, bottom=0, scrollbars=yes');

    }
    $(document).ready(function () {
        Fn_ReloadListGrid();

    });
    function fn_SetIcon()
    {
        var sortExpression = $("#<%=hdn_SortExpresion.ClientID()%>")[0].value;
        var data = sortExpression.split('|');
        var grdNm = '<%=Grd_ListGrid.ClientID%>';
        var $grid = $("#" + grdNm);
        var grd = document.getElementById(grdNm);

        var $rowHead = $grid.find('th').closest("tr");
        $grid.find('th').each(function (s, e) {

            if ($(e).find('a').html() == data[0]) {
                $(e).find('a').attr('class', data[1]);
            }
            else {
                $(e).find('a').attr('class', 'NoSort');
            }
            
        });


    }
    function Fn_ReloadListGrid() {
        Fn_AddRowAtZero();
        Fn_SearchCriteria();
        fn_SetIcon();
    }
    function Fn_AddRowAtZero() {
        var grdNm = '<%=Grd_ListGrid.ClientID%>';
        var $grid = $("#" + grdNm);
        var grd = document.getElementById(grdNm);

        var $rowHead = $grid.find('th').closest("tr");
        var $rowColl = $grid.find('tr');

        if (grd.rows.length > 2) {
            var searchRow = $grid.find('.FooterLine').clone();
            $(searchRow).attr('class', "FilterRow");
            $($rowHead).after(Fn_AddTextBox(searchRow));
        }

    }

    function Fn_AddTextBox(OBJ_TR) {
        var $TD_Obj = $(OBJ_TR).find('td');
        var i = 0;
        var str_Data = $('#<%=hdn_SearchCriteria.ClientID%>')[0].value.split('§');

        $(OBJ_TR).find('td').each(function (src, obj) {
            var Str_Value = '';
            if (str_Data.length > i + 1)
                Str_Value = str_Data[i + 1];

            else
                Str_Value = '';

            var str = "<input type='text' id='" + 'txt_Col_' + i + "' style='width:100%;' value='" + Str_Value + "'/>";
            $(obj).html('');
            $(obj).append(str);
            i = i + 1;
        });
        return $(OBJ_TR);
        //for (var i = 0; i <= $TD_Obj.length; i++)
        //{
        //    var str="<input type='text' id='"+'txt_Col_'+i+"' style='width:100%;'/>";
        //    $(TD_Obj[i]).append(str);
        //}
    }
    function Fn_SearchCriteria() {

        var grdNm = '<%=Grd_ListGrid.ClientID%>';
        var $grid = $("#" + grdNm);
        var grd = document.getElementById(grdNm);

        var $rowHead = $grid.find('th').closest("tr");
        var $rowColl = $grid.find('tr');
        var Str_Data = '';
        if (grd.rows.length > 2) {

            $($rowColl[1]).find("td").each(function (src, obj) {
                Str_Data = Str_Data + '§' + $($(obj).find('input'))[0].value;
            });
        }
        $('#<%=hdn_SearchCriteria.ClientID%>')[0].value = Str_Data;

        return true;
    }

    function Fn_SearchCriteria_EXPORT() {
        var Str_Criteria = '';
        var table = $("#<%=Grd_ListGrid.ClientID %>");
        var count = 0;
        var SearchCriteria = $('#<%=hdn_SearchCriteria.ClientID%>')[0].value.split('§');

        table.find('th').each(function (src, obj) {
            count += 1;
            if (SearchCriteria[count].trim() != '') {
                Str_Criteria += $(obj).find("a").html().replace('_', ' ') + '=' + SearchCriteria[count] + ' | ';
            }

        });
        return Str_Criteria;
    }


    var Fn_Export_tableToExcel_ListGrid = (function () {
        var uri = 'data:application/vnd.ms-excel;base64,'
          , template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--><meta http-equiv="content-type" content="text/plain; charset=UTF-8"/></head><body><table>{table}</table></body></html>'
          , base64 = function (s) { return window.btoa(unescape(encodeURIComponent(s))) }
          , format = function (s, c) { return s.replace(/{(\w+)}/g, function (m, p) { return c[p]; }) }

        return function (name) {
            var table = $("#<%=Grd_ListGrid.ClientID %>");

            var table1 = table.clone();

            var s = 'EXPORT TO EXCEl'; //Fn_ExportInfoGenertor();//'<div style="Width:100px;background-color:red">Hello world</div>'

            $(table1.find('th').closest("tr").next("tr")).remove();
            $(table1.find('.pgr')).remove();
            $(table1.find('.Display_None')).remove();


            table1.find('th').each(function (src, obj) {
                $(obj).html($(obj).find("a").html().replace('_', ' '));
                $(obj).css("background-color", '#E6EBE5');
                $(obj).css("border", '1px solid gray');
                $(obj).css("height", '30px');

            });

            var str_Table = $(table1).html();
            var Str_Criteria = 'Search Criteria: ' + Fn_SearchCriteria_EXPORT();

            var Table_HTML = s + "<br/>" + Str_Criteria + '<br/>' + str_Table;
            //alert(Table_HTML);

            if (!table.nodeType) table = document.getElementById(table)
            var ctx = { worksheet: name || 'Worksheet', table: Table_HTML };

            if (!Fn_BrowserDetection_Check()) {

                window.location.href = uri + base64(format(template, ctx));
                return false;

            }
            else {
                $("#<%=hdn_HTML_Markup.ClientID%>")[0].value = Table_HTML;
                alert('D');
                return true;

            }



        }
    })();

    //================================================================================
    // Browser Detection
    //================================================================================
    function Fn_BrowserDetection_Check() {


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

            return true;

        }
        else if (browserName == 'Chrome') {
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

</script>
<style type="text/css">
    .TXT {
        margin-top: 1px;
    }

    .LBL_Result {
        margin-top: 15px;
    }

    .sortasc {
        background-color: green;
    }

    .sortdesc {
        background-color: red;
    }
    .DV_ErrorPanel {
        
        padding:10px;
        width:90%;
        border:1px solid #963636;
        background-color:#fbcccc;
        margin:50px;
    
    }

</style>
<asp:Panel ID="pnl_ErrorPanel" runat="server" Visible="false" CssClass="DV_ErrorPanel">
    <a id="dlink"  style="display:none;"></a>
    <table border="0" style="border: none;">
        <tr>
            <td style="border: none;">
                <asp:Image ID="Image1" width="20px" height="20px" ImageUrl="~/Image/1402171068_error.png" runat="server" /></td>
            <td style="border: none;">
                <asp:Label ID="Label6" CssClass="LabelNormal" ForeColor="Red" Font-Bold="true" runat="server" Text="Error in data processing ,Please contact your system administrator!"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Panel>
<asp:UpdatePanel ID="up_ListGrid" runat="server">
    <ContentTemplate>
        <table style="width: 100%;" cellpadding="0" cellspacing="0">
            <tr style="height: 30px">
                <td>
                    <div class="DV_ListGrid_TOP" style="float: right; margin-right: 0px;">
                        <table cellpadding="0" cellspacing="0" style="margin-top: 5px; margin-left: 5px; margin-right: 5px;">
                            <tr>
                                <td style="vertical-align: central;">
                                    <asp:Label ID="lbl_1" runat="server" Text="Page Size " CssClass="LabelNormal TXT"></asp:Label></td>
                                <td style="width: 8px; vertical-align: central;" align="center">
                                    <asp:Label ID="Label1" runat="server" Text=":" CssClass="Label_Normal TXT"></asp:Label></td>
                                <td style="vertical-align: central;">
                                    <asp:TextBox ID="Txt_PageSize" runat="server" CssClass="TextBox_Normal Mandatory TXT" MaxLength="4" validation="Int" Width="60px"></asp:TextBox></td>
                                <td style="vertical-align: central;">
                                    |
                                    </td>
                                <td style="vertical-align: central;">
                                    <asp:ImageButton ID="Img_Search" runat="server" ToolTip="Search" Height="22px" OnClientClick="return Fn_SearchCriteria();" ImageUrl="~/Image/search.png" Width="24px" />
                                </td>
                                <td style="vertical-align: central;">
                                    |
                                    </td>
                                  <td style="vertical-align: central;">
                                    <asp:ImageButton ID="Img_Export" runat="server" ToolTip="Export to Excel" Height="22px" OnClientClick="Fn_Export_tableToExcel_ListGrid();return false;" ImageUrl="~/Image/Export.png" Width="24px"/>
                                </td>
                            </tr>

                        </table>
                    </div>
                    <div style="float: right; margin-right: 2px; margin-top: 5px;">
                        <asp:Label ID="lbl_Result" runat="server" Text="0" CssClass="LabelNormal LBL_Result"></asp:Label>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="Grd_ListGrid"  CssClass="mGrid" Width="100%" runat="server"  AutoGenerateColumns="true" PageSize="10" PagerStyle-CssClass="pgr" AllowPaging="true" AllowSorting="true" ShowFooter="true" ShowHeaderWhenEmpty="true">
                        <Columns>
                        </Columns>
                        <SortedAscendingHeaderStyle CssClass="sortasc" ForeColor="Red" />
                        <SortedDescendingHeaderStyle CssClass="sortdesc" />
                        <EmptyDataTemplate>

                            <table border="0" style="border: none;">
                                <tr>
                                    <td style="border: none;">
                                        <img width="20px" height="20px" src="Image/1402171068_error.png" /></td>
                                    <td style="border: none;">
                                        <asp:Label ID="Label6" CssClass="LabelNormal" runat="server" Text="No data found!"></asp:Label>
                                    </td>
                                </tr>
                            </table>

                        </EmptyDataTemplate>
                        <PagerSettings Position="Bottom" Mode="NumericFirstLast" NextPageText=">>" FirstPageText="|<" LastPageText=">|" PreviousPageText="<<" />
                        <FooterStyle CssClass="FooterLine" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_Error" runat="server" Text=""></asp:Label>
                </td>
            </tr>
        </table>
        <asp:HiddenField ID="hdn_ColumnWidth" runat="server" />
        <asp:HiddenField ID="hdn_SortExpresion" runat="server" />
        <asp:HiddenField ID="hdn_InvisibleColumnIndex" runat="server" />
        <asp:HiddenField ID="hdn_ColumnHeaderText" runat="server" />
        <asp:HiddenField ID="hdn_Alignment" runat="server" />
        <asp:HiddenField ID="hdn_HTMLColumnIndexes" runat="server" />
         <asp:HiddenField ID="hdn_HTML_Markup" runat="server" />
    </ContentTemplate>
</asp:UpdatePanel>
<asp:HiddenField ID="hdn_SearchCriteria" runat="server" />

<asp:HiddenField ID="hdn_ColumnHeader" runat="server" />

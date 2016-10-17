var months = new Array("January","February","March","April","May","June","July","August","September","October","November","December");
var days = new Array("S","M","T","W","T","F","S");
var fullDays = new Array("Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday");
var daysInMonth = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);


function DateControl(divDays, divHeader, instanceName,showWeekNumber,y,m,d,displayDefault,dateFormat,toggleCalendar,upImage,downImage,isNull){

var today = new Date();
var SelectedDate = new Date();

var isDateNull = isNull;

SelectedDate.setFullYear(y,m-1,d);    

// render the selected date or default date via ASP.NET
var selectedDay = SelectedDate.getDate();
var selectedMonth = SelectedDate.getMonth(); // Jan = 0 | Dec = 11
var selectedYear = SelectedDate.getFullYear();

var displayMonth = SelectedDate.getMonth(); // Jan = 0 | Dec = 11
var displayYear = SelectedDate.getFullYear();

var keepOpen = false;

var dropDisplayYear = displayYear;

// set the default selected date to null
var selectedCell=null;

this.keepCalendarOpen = function(){
    keepOpen = true;
}

// drop downs
this.findPosX = function(obj){
    var curLeft = 0;
    if(obj.offsetParent){
        while(true){
            curLeft += obj.offsetLeft;
            if(!obj.offsetParent)
                break;
           obj = obj.offsetParent;
        }
    }
    else if(obj.x){
        curLeft += obj.x;
    }
    return curLeft;
}

this.findPosY = function(obj){
    var curTop = 0;
    if(obj.offsetParent){
        while(true){
            curTop += obj.offsetTop;
            if(!obj.offsetParent)
                break;      
           obj = obj.offsetParent;
        }
    }
    else if(obj.y){
        curTop += obj.y;
    }
    return curTop;
}

this.exactMonth = function(month){
    displayMonth = month;
    this.renderDays();
    this.toggleMonthDrop();
}

this.exactYear = function(year){
    displayYear = year;
    this.renderDays();
    this.toggleYearDrop();
}

this.renderMonths = function(){
    var divMonths = document.getElementById('divMonths'+instanceName);
    var html = "<table setwidth='100%' border=0 cellpadding=0 cellspacing=0>";
    
 
    for(var i=0;i<12;i++){
        if(i==displayMonth)
            html += "<tr><td align=center class='mOverHighlightHover' onclick='"+instanceName+"Class.exactMonth("+i+")'>"+months[i]+"</td></tr>";
        else
            html += "<tr><td align=center class='mOverHighlight' onmouseover=this.className='mOverHighlightHover' onmouseout=this.className='mOverHighlight'  onclick='"+instanceName+"Class.exactMonth("+i+")'>"+months[i]+"</td></tr>";
    }
    
    html += "</table>";
    divMonths.innerHTML = html;
}

this.renderYears = function(value){
    var divYears = document.getElementById('divYears'+instanceName);
    var html = "<table width='100%' border=0 cellpadding=0 cellspacing=0>";
    var fromYear = dropDisplayYear - 6;
    var toYear = dropDisplayYear + 6;
    
    if(value== 1){
        fromYear--;
        toYear--;
        dropDisplayYear--;
    }else if(value==-1){
        fromYear++;
        toYear++;
        dropDisplayYear++;
    }

    html += "<tr><td align=center onclick='"+instanceName+"Class.renderYears(1)' style='cursor:pointer' height='10'><img src='"+upImage+"'></td></tr>"
    for(var i=fromYear;i<toYear;i++){
        if(i==displayYear)
            html += "<tr><td align=center class='mOverHighlightHover' onclick='"+instanceName+"Class.exactYear("+i+")'>"+i+"</td></tr>";
        else
            html += "<tr><td align=center class='mOverHighlight' onmouseover=this.className='mOverHighlightHover' onmouseout=this.className='mOverHighlight' onclick='"+instanceName+"Class.exactYear("+i+")'>"+i+"</td></tr>";
    }
    html += "<tr><td align=center onclick='"+instanceName+"Class.renderYears(-1)' style='cursor:pointer' height='10'><img src='"+downImage+"'></td></tr>"
    html += "</table>";
    divYears.innerHTML = html;
}

this.renderMonths();

this.toggleMonthDrop = function(){

    var divMonths = document.getElementById('divMonths'+instanceName);
    var divHeader = document.getElementById('divMonthSelect'+instanceName);
    divMonths.style.left = this.findPosX(divHeader)  + 'px';
    divMonths.style.top = this.findPosY(divHeader) + 20 + 'px';
    
    if (divMonths.style.visibility=='visible'){
        keepOpen = true;
    }
    
    divMonths.style.visibility = (divMonths.style.visibility=='visible') ? 'hidden' : 'visible';   
    
    this.renderMonths();
}

this.toggleYearDrop = function(){
    var divYears = document.getElementById('divYears'+instanceName);
    var divHeader = document.getElementById('divYearSelect'+instanceName);
    dropDisplayYear = displayYear;    
    divYears.style.left = this.findPosX(divHeader) + 'px';
    divYears.style.top = this.findPosY(divHeader) + 20 + 'px';
    
    if (divYears.style.visibility=='visible'){
        keepOpen = true;
    }
    
    divYears.style.visibility = (divYears.style.visibility=='visible') ? 'hidden' : 'visible';  

    this.renderYears(0);  
}


//Select a new date
this.selectDate = function(day){


    //reset the cell if one has been selected
    if(selectedCell!=null) selectedCell.className = 'normalDayCell';
    
    // assign the selected cell so it can be normalised upon new day selection
    selectedCell = document.getElementById('dayCell'+instanceName+day);
    selectedCell.className = 'selectedDayCell';
    
    //set the the selection
    selectedDay = day;
    selectedMonth = displayMonth;
    selectedYear = displayYear;
    
    SelectedDate.setFullYear(selectedYear,selectedMonth,selectedDay);
    

    //only render to the textbox if the parsed date was valid
    if(!displayDefault){
        this.setTextValue(SelectedDate);
    }

    //make sure its set for manual intervention through the calendar
    displayDefault = false;
    
    //Hide the calendar
    if(toggleCalendar)
    {
            //for ie6 issue
            var calIFrame = document.getElementById('iframe'+instanceName); 
            calIFrame.style.visibility = 'hidden'; 
            //
            
            var cal = document.getElementById('calendar'+instanceName);
            var divYears = document.getElementById('divYearSelect'+instanceName);
            var divMonths = document.getElementById('divMonthSelect'+instanceName);
            cal.style.visibility = 'hidden';
            divYears.visibility = 'hidden';
            divMonths.visibility = 'hidden';
           

    }
}

this.setNoneDate = function(){
    this.setTextValue(null);
    
    if(selectedCell!=null) {
        selectedCell.className = 'normalDayCell';
    }
    
    this.toggleCalendarShow();
}

this.setTodayDate = function(){
    this.setTextValue(today);
    
    SelectededDay = today.getDate();
    SelectededMonth = displayMonth = today.getMonth();
    Selectededyear = displayYear = today.getFullYear();
    
    
    this.toggleCalendarShow();
    this.renderDays();
    this.selectDate(SelectededDay);
}

this.toggleCalendarShow = function()
{
    var calIFrame = document.getElementById('iframe'+instanceName); // ie6 issue
    var cal = document.getElementById('calendar'+instanceName);
    var divYears = document.getElementById('divYearSelect'+instanceName);
    var divMonths = document.getElementById('divMonthSelect'+instanceName);
    
     
    //has toggle been selected?
    if(toggleCalendar)
    {
        if(cal.style.visibility=='visible')
        {
            calIFrame.style.visibility = 'hidden';//vishal ie6 issue
            cal.style.visibility = 'hidden';
            divYears.visibility = 'hidden';
            divMonths.visibility = 'hidden';
            
            
            keepOpen = false;
        }
        else
        {
            calIFrame.style.visibility = 'visible'; //// vishal ie6 issue
            cal.style.visibility = 'visible';
            keepOpen = true;
        }
    }
}

this.setTextValue = function(date)
{


    //var txt = document.getElementById('txt'+instanceName);
     var txt = document.getElementById(instanceName);

    txt.value = this.format(dateFormat,date);    
   // alert(this.format(dateFormat,date).toUpperCase() + ": setTextVAlue");//vishal
}

//the week day that the 1st falls on
this.firstWeekDay = function(month, year){

    var date=new Date()
    date.setFullYear(year,month,1);

    return date.getDay();
}
// get the number of days in the month accounting for a leap year
this.getDays = function(month, year){
    // leap years only matter in February
    if (1 == month)
        return ((0 == year % 4) && (0 != (year % 100))) ||
            (0 == year % 400) ? 29 : 28;
    else
        return daysInMonth[month];
}

// The month has been reduced
this.monthBack = function(){
    // if the month is january then set to December
    if(displayMonth==0){
        displayMonth=11;
        displayYear--; // decrement the year
    }else{
        displayMonth--;
    }

    //re-render the control
    this.renderDays();
}

// The month has been advanced
this.monthForward = function(){
    // if the month is December then set to January
    if(displayMonth==11){
        displayMonth=0;
        displayYear++; // Increment the year
    }else{
        displayMonth++;
    }

     //re-render the control
    this.renderDays();

}


// render the days
this.renderDays = function (){

    // get the number of days to render
    var numberOfDays = this.getDays(displayMonth, displayYear);
    var firstDayOfWeek = this.firstWeekDay(displayMonth, displayYear);
  

    // used for row control
    var leftCount = 1;
    // the html content builder to be assigned the control
    var content="";
    // the preselected day table cell
    var preSelectedDayCell=null;
    // the preselected day
    var preSelectedDay=null;
    // the ordered week number
    var weekNumber = 1;
    
    //open the table
    content += '<table width="100%" cellspacing=0><tr><td>&nbsp;</td>';
       
    // render the remaining days for last month
    for(var j=0;j<7;j++){
        content += '<td class="dayMn">'+days[j]+'</td>';
    }
        
    // only render the a new row if last month has bled into this
    if(firstDayOfWeek>0)
        content += '<tr class="dayMn">';
        
    // get the last few days of last month in reverse
    var lastMonth = (displayMonth==0) ? 11 : displayMonth-1;
    
    var lastMonthDays = daysInMonth[lastMonth] - firstDayOfWeek + 1;
    
    //pad the days of last month
    for(var i=0;i<firstDayOfWeek;i++){
    //onmouseover="window.status = displayMonth;return true;" onmouseout="window.status = '';return true;"
        if(i==0){
            if(showWeekNumber)
                content += '<td class="weekNumber" >'+weekNumber++ +'</td>';
            else
                content += '<td>&nbsp;</td>';
        }
        content += '<td class="dim">' + lastMonthDays++ + '</td>';      
        leftCount++
    }


    // loop through all the days of the display month
    for(var i=1;i<=numberOfDays;i++){
        //Render the <TR> tag
        if(leftCount==1){
            content += '<tr class="day">';
            
           if(showWeekNumber)
                content += '<td class="weekNumber">'+weekNumber++ +'</td>';
           else
                content += '<td>&nbsp;</td>';
        }
         
        // add the day table cell and add the onclick javascript reference             
        content += '<td id="dayCell'+instanceName+i+'" class="normalDayCell" onClick="'+instanceName+'Class.selectDate(('+i+'))">'+i+'</td>';
        
        
        // register the selected day making sure the date isnt set to null
        if(selectedMonth==displayMonth && selectedYear==displayYear && selectedDay==i && !isDateNull){
            preSelectedDayCell = 'dayCell'+instanceName+i;
            preSelectedDay = i;
            
        }
        
        // render the close <TR> tag
        if(leftCount==7){
            content += '<td>&nbsp;</td></tr>';
            leftCount = 1; //reset leftCount
        }else{
            leftCount++;
        }
    }
    
    // pad the remaining days of the month
    if(leftCount<=7){
        var nextMonthDays = 1;
        for(var i=leftCount;i<=7;i++){
            // leave a space if the week number column is being displayed
            if(i==1 && showWeekNumber)
                content += '<td class="weekNumber">&nbsp;</td>';
            else if(i==1)
                content += '<td>&nbsp;</td>';
                
            content += '<td class="dim">'+ nextMonthDays++ +'</td>';  
            // render the close <TR> tag
            if(i==7){
                content += '</tr>';
            }
        }
    }
        
    
    //close the table
    content+= '</table>';
    
    // ass the html to the dic objects
    divDays.innerHTML = content;
    divHeader.innerHTML = "<div align=center ><table border=0 style='font-size:small;'><tr><td><div id='divMonthSelect"+instanceName+"' style='cursor:pointer;position:relative;' onclick='"+instanceName+"Class.toggleMonthDrop();'>"+months[displayMonth]+"</div></td><td><div onclick='" + instanceName+"Class.toggleYearDrop();' id='divYearSelect"+instanceName+"' style='position:relative;cursor:pointer;'>"+displayYear+"</div></td></tr></table></div>";
    
     // preselecct the day cell
    if(preSelectedDayCell!=null) {
        this.selectDate(preSelectedDay);
        
        if(!displayDefault)
            this.setTextValue(SelectedDate); 
    }
    
    //only disable preselection on the first run
    displayDefault = false;
      
}

this.documentClick = function (){
 
    if(!keepOpen && toggleCalendar)
    {    
        var calIFrame = document.getElementById('iframe'+instanceName); //vishal NEW ie6 issue
        calIFrame.style.visibility = 'hidden'; //NEW //vishal NEW ie6 issue


        var cal = document.getElementById('calendar'+instanceName);
        var divYears = document.getElementById('divYears'+instanceName);
        var divMonths = document.getElementById('divMonths'+instanceName);
        cal.style.visibility = 'hidden';
        divYears.style.visibility = 'hidden';
        divMonths.style.visibility = 'hidden';
    }

    keepOpen=false;
}

   
    if (document.layers) {
        window.captureEvents(Event.CLICK);
        window.onclick = this.documentClick;
    } else if (document.all && !document.getElementById){
        document.onclick = this.documentClick;
    } else if (document.all){
        document.attachEvent('onclick', this.documentClick);
    }else if (document.addEventListener){
        document.addEventListener('click', this.documentClick, false);
    }
    
    //render this month when the page first loads
    return this;
}


String.prototype.zf = function(l) { return '0'.string(l - this.length) + this; }
String.prototype.string = function(l) { var s = '', i = 0; while (i++ < l) { s += this; } return s; }
Number.prototype.zf = function(l) { return this.toString().zf(l); }

// NOTE: switch statement complient with Microsoft .NET DateTime string parsing
// URL:http://msdn2.microsoft.com/en-us/library/8kb3ddd4.aspx

// the date format prototype
DateControl.prototype.format = function(f,d){

    if (!this.valueOf())
        return '&nbsp;';
    // dont try and render null dates
    if(d!=null){
    
        return f.replace(/(yyyy|mmmm|mmm|mm|m|dddd|ddd|dd|d|a\/p)/gi,
            function($1)
            {
                switch ($1.toLowerCase())
                {
                    //case 'oo':   return (d.getDate() % 10 == 1 && d.getDate() != 11 ? 'st' : (d.getDate() % 10 == 2 && d.getDate() != 12 ? 'nd' : (d.getDate() % 10 == 13 && d.getDate() != 1 ? 'rd' : 'th'))); 
                    case 'd':    return d.getDate();                        // 1
                    case 'dd':   return d.getDate().zf(2);                  // 01
                    case 'ddd':  return fullDays[d.getDay()].substr(0, 3);  // Mon
                    case 'dddd': return fullDays[d.getDay()];               // Monday
                    case 'm':    return (d.getMonth()+1);                   // 1
                    case 'mm':   return (d.getMonth()+1).zf(2);             // 01
                    case 'mmm':  return months[d.getMonth()].substr(0, 3);  // Jan
                    case 'mmmm': return months[d.getMonth()];               // January
                    case 'yyyy': return d.getFullYear();                    // 2000
                }
            }
        );
     }else{ // return a blank string
        return "";
     }
}

//d -Represents the day of the month as a number from 1 through 31. 
//A single-digit day is formatted without a leading zero. 

//dd - Represents the day of the month as a number from 01 through 
//31. A single-digit day is formatted with a leading zero.

//ddd - Represents the abbreviated name of the day of the week as 
//defined in the current System.Globalization.DateTimeFormatInfo.AbbreviatedDayNames property.

//dddd - Represents the full name of the day of the week as
// defined in the current System.Globalization.DateTimeFormatInfo.DayNames property.

//M - Represents the month as a number from 1 through 12. 
//A single-digit month is formatted without a leading zero. 

//MM - Represents the month as a number from 01 through 12. 
//A single-digit month is formatted with a leading zero.

//MMM - Represents the abbreviated name of the month as defined in the current
// System.Globalization.DateTimeFormatInfo.AbbreviatedMonthNames property.

//MMMM -Represents the full name of the month as defined in the
// current System.Globalization.DateTimeFormatInfo.MonthNames property.
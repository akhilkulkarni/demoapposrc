
function GetPrint(textToPrint) 
{
    textToPrint = document.getElementById("hdPrint").value;
   
    //Creating new page
    var pp = window.open();
    //Adding HTML opening tag with <HEAD> … </HEAD> portion 
    pp.document.writeln('<HTML><HEAD><title>Print Preview</title>');
    pp.document.writeln('<base target="">');
	
    
    pp.document.writeln('<link type="text/css" rel="Stylesheet" href="../css/Printing.css"/>');
    pp.document.writeln('<link type="text/css" rel="Stylesheet" href="../../css/Printing.css"/>');
	
	
    pp.document.writeln('</HEAD>');
	
	  

    //Adding Body Tag
    pp.document.writeln('<body MS_POSITIONING="GridLayout" bottomMargin="0.5" leftMargin="0.5" topMargin="0.5" rightMargin="0.5">');
    //Adding form Tag
    pp.document.writeln('<form  method="post">');
    //Creating two buttons Print and Close within a table
    //pp.document.writeln('<TABLE width=100%><TR><TD></TD></TR><TR><TD align=right><INPUT ID="PRINT" type="button" value="Print" onclick="javascript:location.reload(true);window.print();"><INPUT ID="CLOSE" type="button" value="Close" onclick="window.close();"></TD></TR><TR><TD></TD></TR></TABLE>');
    //Writing print area of the calling page
    pp.document.writeln(textToPrint);
    //Ending Tag of </form>, </body> and </HTML>
    
    
    pp.document.writeln('</form></body></HTML>');
    pp.document.close();
    document.getElementById("hdPrint").value = '';
		
}
//*************** Print Label Function ************************************************
 
 



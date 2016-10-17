using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for CommonEntity
/// </summary>
///  
public enum MessageType
{
    Success = 1,
    Alert = 2,
    Error = 3,
    Warning = 4,
    Infomation = 5

}
public enum MessagePosition
{
    Top = 1,

    TopLeft = 2,
    TopCenter = 3,
    TopRight = 4,

    CenterLeft = 5,
    Center = 6,
    CenterRight = 7,

    BottomLeft = 8,
    BottomCenter = 9,
    BottomRight = 10,

    Bottom = 11
}
public class CommonEntity
{


    public CommonEntity()
    {
        //
        // TODO: Add constructor logic here
        //
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UC_Footer : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public void ShowMessage(MessageType MsgType,String Message,bool AutoClose,MessagePosition MsgPosition,bool Modal)
    {
        string MsgType_S="alert", Message_S="", AutoClose_S="true", MsgPosition_S = "Bottom", Modal_S="false";

        MsgType_S = MsgType.ToString();

        //================================================================================
             if(MsgType ==MessageType.Success) MsgType_S ="success";
             if(MsgType ==MessageType.Alert) MsgType_S ="alert";
             if(MsgType ==MessageType.Error) MsgType_S ="error";
             if(MsgType ==MessageType.Warning) MsgType_S ="warning";
             if(MsgType ==MessageType.Infomation) MsgType_S ="information";
         //================================================================================
      
             if (MsgPosition == MessagePosition.Top) MsgPosition_S = "top";
             if (MsgPosition == MessagePosition.TopLeft) MsgPosition_S = "topLeft";
             if (MsgPosition == MessagePosition.TopCenter) MsgPosition_S = "topCenter";
             if (MsgPosition == MessagePosition.TopRight) MsgPosition_S = "topRight";
             if (MsgPosition == MessagePosition.CenterLeft) MsgPosition_S = "centerLeft";
             if (MsgPosition == MessagePosition.Center) MsgPosition_S = "center";
             if (MsgPosition == MessagePosition.CenterRight) MsgPosition_S = "centerRight";
             if (MsgPosition == MessagePosition.BottomLeft) MsgPosition_S = "bottomLeft";
             if (MsgPosition == MessagePosition.BottomCenter) MsgPosition_S = "bottomCenter";
             if (MsgPosition == MessagePosition.BottomRight) MsgPosition_S = "bottomRight";
             if (MsgPosition == MessagePosition.Bottom) MsgPosition_S = "bottom";
         //================================================================================
            Message_S = Message;
        //================================================================================
            if (AutoClose)
                AutoClose_S = "6000";
            else
                AutoClose_S = "false";
        //================================================================================ 

            if (Modal)
                Modal_S = "true";
            else
                Modal_S = "false";
        //================================================================================

        String Script = "Fn_ShowMessage('"+MsgType_S+"','"+Message_S+"',"+AutoClose_S+",'"+MsgPosition_S+"',"+Modal_S+");";

        ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "SASASASS", Script, true);
    }
    public void GetEnumString()
    { 
    }
}
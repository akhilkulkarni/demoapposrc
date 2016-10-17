using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ICSBLL.BLL.Admin;
public partial class UI_Admin_CommonSettings : System.Web.UI.Page
{
    Base_BLL_PageCommonSettings objSett ;
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Header.DataBind();
        //uc_header.FillMenu(ICSBLL.Base_BLL_Constants.Modules.Admin);
        GetThemeList();
    }

    protected void btn_SaveSetting_Click(object sender, EventArgs e)
    {
        objSett = new Base_BLL_PageCommonSettings();

        if (objSett.VerifyPassword(1, ICSBLL.Base_BLL_Cryptography.Encrypt(txtOldPassword.Text,true)))
        {
            objSett.PK_UserId = 1;
            objSett.NewPassword = ICSBLL.Base_BLL_Cryptography.Encrypt(txtNewPassword.Text,true);
            objSett.Theme = drp_themeList.SelectedValue;
            objSett.UpdateCommonSettings();
        }
        else
        {
            uc_footer1.ShowMessage( MessageType.Error,"Invalid Password...!,Password Not Updated!",false,MessagePosition.Bottom,false);
        }

    }
    protected void GetThemeList()
    {
        objSett = new Base_BLL_PageCommonSettings();
        drp_themeList.DataSource= objSett.ThemeList_GET();
        drp_themeList.DataTextField = "ThemeTitle";
        drp_themeList.DataValueField = "ThemeName";
        drp_themeList.DataBind();
        drp_themeList.SelectedValue = "Default";

    }
}
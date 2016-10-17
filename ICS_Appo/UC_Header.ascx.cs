using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ICSBLL;
public partial class UC_Header : System.Web.UI.UserControl
{
    Base_BLL_MenuMaster objMenu;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            //FillMenu(Base_BLL_Constants.Modules.None);
        }
    
    }
    public void FillMenu(Base_BLL_Constants.Modules m)
    {
        objMenu = new Base_BLL_MenuMaster();
        objMenu.SetMenu(Convert.ToInt32(m), xds);
        menu.DataBind();
 
    }
    public void FillNormalColor()
    {
        img_home.ImageUrl = "~/App_Themes/Default/ICON/Home_C.png";
        img_admin.ImageUrl = "~/App_Themes/Default/ICON/settings_C.png";
        img_PatientManagement.ImageUrl = "~/App_Themes/Default/ICON/PatientMang_C.png";
        img_Report.ImageUrl = "~/App_Themes/Default/ICON/Charts_S.png";
        img_Help.ImageUrl = "~/App_Themes/Default/ICON/Help_C.png";
        img_appointment.ImageUrl = "~/App_Themes/Default/ICON/Appo_C.png";
    }

    public void FillSelectedColor(int Flag)
    {
        if(Flag==1)
        img_home.ImageUrl = "~/App_Themes/Default/ICON/Home.png";
        if (Flag == 2)
        img_admin.ImageUrl = "~/App_Themes/Default/ICON/settings.png";
        if (Flag == 3)
        img_PatientManagement.ImageUrl = "~/App_Themes/Default/ICON/PatientMang.png";
        if (Flag == 4)
        img_Report.ImageUrl = "~/App_Themes/Default/ICON/Charts.png";
        if (Flag == 5)
        img_Help.ImageUrl = "~/App_Themes/Default/ICON/Help.png";
        if(Flag==6)
            img_appointment.ImageUrl = "~/App_Themes/Default/ICON/Appo.png";
    }
    protected void img_admin_Click(object sender, ImageClickEventArgs e)
    {
        FillNormalColor();
        FillMenu(Base_BLL_Constants.Modules.Admin);
        FillSelectedColor(2);
    }
    protected void img_appointment_Click(object sender, ImageClickEventArgs e)
    {
        FillNormalColor();
        FillMenu(Base_BLL_Constants.Modules.Appointments);
        FillSelectedColor(6);
    
    }
    protected void img_PatientManagement_Click(object sender, ImageClickEventArgs e)
    {
        FillNormalColor();
        FillMenu(Base_BLL_Constants.Modules.PatientManagement);
        FillSelectedColor(3);
    }
    protected void img_DocDesk_Click(object sender, ImageClickEventArgs e)
    {
        FillNormalColor();
        FillMenu(Base_BLL_Constants.Modules.DoctorDesk);
    }
    protected void img_HR_Click(object sender, ImageClickEventArgs e)
    {
        FillNormalColor();
        FillMenu(Base_BLL_Constants.Modules.HR);
    }
    protected void img_SalesPurchase_Click(object sender, ImageClickEventArgs e)
    {
        FillNormalColor();
        FillMenu(Base_BLL_Constants.Modules.SalesPurchase);
    }
    protected void img_Report_Click(object sender, ImageClickEventArgs e)
    {
        FillNormalColor();
        FillMenu(Base_BLL_Constants.Modules.Report);
        FillSelectedColor(4);
    }

    protected void img_home_Click(object sender, ImageClickEventArgs e)
    {
        FillNormalColor();
        FillSelectedColor(1);
    }
    protected void img_Logout_Click(object sender, ImageClickEventArgs e)
    {
        //FillNormalColor();
        Response.Redirect("~/login.aspx?logout=true", false);
    }
    protected void img_Help_Click(object sender, ImageClickEventArgs e)
    {
        FillNormalColor();
        FillSelectedColor(5);
    }

    public bool ShowModule
    {
        get
        {
            return img_admin.Visible;
        }
        set
        {
            img_home.Visible = value;
            img_admin.Visible = value;
            img_appointment.Visible = value;
            img_PatientManagement.Visible = value;
            //img_DocDesk.Visible = value;
            //img_HR.Visible = value;
            //img_SalesPurchase.Visible = value;
            img_Report.Visible = value;

            img_Help.Visible = value;
            img_Logout.Visible = value;
            menu.Visible = value;
        }
    }

}
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ICSBLL.BLL.PatientManagement;

public partial class UI_PatientManagement_Frm_PatientSearch : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Header.DataBind();

        if (!Page.IsPostBack)
        {
            FillData();
        }
    }
    protected void FillData()
    {
        try
        {
            Base_BLL_Patient Obj_Patient = new Base_BLL_Patient();
            DataSet Ds_Data=Obj_Patient.GetPatientList();
            UC_ListGrid_New1.Data = Ds_Data;
        }
        catch (Exception ex)
        {
            uc_footer1.ShowMessage(MessageType.Error, ex.Message, false, MessagePosition.Top, false);
        }
    
    }

    protected void btn_Search_Click(object sender, EventArgs e)
    {

    }
    protected void btn_New_Click(object sender, EventArgs e)
    {

    }
    protected void btn_Save_Click(object sender, EventArgs e)
    {

    }
    protected void btn_Delete_Click(object sender, EventArgs e)
    {

    }
    protected void btn_Print_Click(object sender, EventArgs e)
    {

    }
}
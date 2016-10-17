using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UI_FrmMP_Common_Upload : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Header.DataBind();
        Session["FileName"] = null;
    }
    protected void AsyncFileUpload1_UploadedComplete(object sender, AjaxControlToolkit.AsyncFileUploadEventArgs e)
    {
         
        string filename = System.IO.Path.GetFileName(AsyncFileUpload1.FileName);
        string FileFolder = Request.QueryString["FolderPath"].ToString();
        string FileName_Spec = Request.QueryString["FileName"];

        if (FileName_Spec != null || FileName_Spec != "")
            filename = FileName_Spec +"."+ filename.Split('.')[1];

        AsyncFileUpload1.SaveAs(Server.MapPath("~"+FileFolder) + filename);
         
        Session["FileName"] ="~"+FileFolder + filename;
    }
}
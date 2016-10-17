using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient; 
using ICSBLL;
using  ICSBLL.BLL.Admin;
public partial class login : System.Web.UI.Page
{
   Base_BLL_Login objLogin = new Base_BLL_Login();
     protected void Page_Load(object sender, EventArgs e)
    {
        Session["FK_HospitalID"] = 1;
          Response.Cache.SetCacheability(HttpCacheability.NoCache);
          if (Request.QueryString["LogOut"] != null)
          {
              Session["Session_PK_UserID"] = null;
              Session["Session_UserName"] = null;
              Session["Session_ImageUrl"] = null;
          }

     }

    protected void btnLogin_Click(object sender, EventArgs e)
    {

    }
    
    protected void btn_Login_Click(object sender, EventArgs e)
    {
        lbl_MessageText.ForeColor=System.Drawing.Color.Black;
        lbl_MessageText.Text = "Verifying Password...!";
        

        string s=Base_BLL_Cryptography.Encrypt(txt_Password.Text,true);
        if(objLogin.VerifyLogin(txt_UserName.Text,s))
        {
            Session["Session_PK_UserID"] = Convert.ToString(objLogin.CurrentUser.Rows[0]["PK_UserID"]);
            Session["Session_UserName"] = Convert.ToString(objLogin.CurrentUser.Rows[0]["UserName"]);
            Session["Session_ImageUrl"] = Convert.ToString(objLogin.CurrentUser.Rows[0]["ImageUrl"])==null?ResolveUrl("~/Image/User.png"):Convert.ToString(objLogin.CurrentUser.Rows[0]["ImageUrl"]);
                   
            Response.Redirect("UI/home.aspx");
        }
        else
        {
            lbl_MessageText.Text = "Invalid User ID/Password..";
            lbl_MessageText.ForeColor=System.Drawing.Color.Red;
        }
       
    }
    

    //private void PopulateMenu()
    // {
    //     xds.Data ="";      
    //    Base_BLL_MenuMaster ob = new Base_BLL_MenuMaster();
    //   ob.SetMenu(1, xds);
    //    //DataSet ds = ob.GetMenu(1);
    //    //ds.DataSetName = "Menus";
    //    //ds.Tables[0].TableName = "Menu";
    //    //DataRelation relation = new DataRelation("ParentChild", ds.Tables["Menu"].Columns["PK_MenuID"], ds.Tables["Menu"].Columns["ParentID"], false);
    //    //relation.Nested = true;
    //    //ds.Relations.Add(relation);
    //    //xds.Data = ds.GetXml();
    //    ////menu1.DataSource = xds;
    //    ////menu1.DataBind();
    //}

  

}

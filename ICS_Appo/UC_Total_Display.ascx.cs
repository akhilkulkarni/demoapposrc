using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UC_Total_Display : System.Web.UI.UserControl
{
    public string TotalPatient 
    { 
        get
        { 
            return txt_totalPatient.Text;   
        }
        set {
                txt_totalPatient.Text = value;
            }
    }
    public string TotalAmmount {

        get
        {
            return txt_TotalCollection.Text;
        }
        set
        {
            txt_TotalCollection.Text = value;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {

    }
}
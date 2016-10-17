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
using ICSBLL.BLL.Report;

public partial class UI_scrolltable : System.Web.UI.Page
{
    TreeView tree = null;
    Base_BLL_Report_Collection obj = new Base_BLL_Report_Collection();

    protected void Page_Load(object sender, EventArgs e)
    {
        // CreateTreeView();
        // CreateTreeViewWithSqlMapDataSource(); 
        // CreateMenuControl();

        // PopulateMenu();

     //   CreateMenuWithXmlFile();
        fn_FillChart();
    }



    private void CreateMenuWithXmlFile()
    {
        string path = @"E:\MyXmlFile.xml";
        DataSet ds = new DataSet();
        ds.ReadXml(path);

        Menu menu = new Menu();
        menu.MenuItemClick += new MenuEventHandler(menu_MenuItemClick);


        for (int i = 0; i < ds.Tables.Count; i++)
        {
            MenuItem parentItem = new MenuItem((string)ds.Tables[i].TableName);
            menu.Items.Add(parentItem);


            for (int c = 0; c < ds.Tables[i].Columns.Count; c++)
            {
                MenuItem column = new MenuItem((string)ds.Tables[i].Columns[c].ColumnName);
                menu.Items.Add(column);


                for (int r = 0; r < ds.Tables[i].Rows.Count; r++)
                {
                    MenuItem row = new MenuItem((string)ds.Tables[i].Rows[r][c].ToString());
                    parentItem.ChildItems.Add(row);
                }
            }


        }

        Panel1.Controls.Add(menu);
        Panel1.DataBind();

    }

    void menu_MenuItemClick(object sender, MenuEventArgs e)
    {
        string selected = e.Item.Text;

        Response.Write(selected);

    }
    public void fn_FillChart()
    { 

        String s1="";
        String s2="";
        String s3="";
        String s4="";
        String s5="";
        String s6="";
        String s7="";
        String s8="";
        String s9="";
        String s10="";

        String Col_Free="";
String Col_LOC="";
String Col_OUT="";


        DataSet ds = obj.CollectionReport_OverAll();


        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            s2 = s2+"'"+ds.Tables[0].Rows[i][0].ToString() + "',";


            Col_LOC = Col_LOC + ds.Tables[0].Rows[i][4].ToString() + ",";
            Col_OUT = Col_OUT + ds.Tables[0].Rows[i][5].ToString() + ",";
            Col_Free = Col_Free + ds.Tables[0].Rows[i][3].ToString() + ",";
 
            s7=s7+ds.Tables[0].Rows[i][6].ToString() + ",";


        }



        s2 = s2.Substring(0, s2.Length - 1);
        
        s7 = s7.Substring(0, s7.Length - 1);
        Col_Free = Col_Free.Substring(0, Col_Free.Length - 1);
        Col_LOC = Col_LOC.Substring(0, Col_LOC.Length - 1);
        Col_OUT = Col_OUT.Substring(0, Col_OUT.Length - 1);


            s1 = "<script type='text/javascript'>$(function () {$('#container').highcharts({chart: {},title: {text: 'Combination chart'},xAxis: {categories: ";
   
        //s2 = "['Date1', 'Date2', 'Date3', 'Date3', 'Date5']";

        s3 = "},tooltip: {formatter: function() {var s; if (this.point.name) { s = ''+this.point.name +': '+ this.y +'';} else {s = ''+this.x  +': '+ this.y;}return s;}},labels: {items:";
   
        s4 = "[{  html: 'Daily Collection',style: {left: '40px',top: '8px',color: 'black'}}]},series:[";

        s4 = s4 + "{type: 'column',name: 'Free',data: [" + Col_Free + "]},{type: 'column',name: 'LOCAL',data: [" + Col_LOC + "]},{type: 'column',name: 'OUT',data: [" + Col_OUT + "]},";



         
   
        s6 = "{ type: 'spline', name: 'Collection', data:";
   
       // s7 = "[3, 2.67, 3, 6.33, 3.33]";
        
        s8 = ",marker: {lineWidth: 2,lineColor: Highcharts.getOptions().colors[3],fillColor: 'white'}}]});});" + " </script>";
        
        s9=s1 +"["+ s2 +"]"+ s3 + s4 + s5+s6+"["+s7+"]"+s8;

     ClientScript.RegisterStartupScript(Page.GetType(), "sas", s9);


    
    }


    private void CreateMenuControl()
    {

        Menu1.DataSource = GetSiteMapDataSource();
        Menu1.DataBind();

    }

    private void PopulateMenu()
    {
        DataSet ds = GetDataSetForMenu();

        Menu menu = new Menu();

        foreach (DataRow parentItem in ds.Tables["Categories"].Rows)
        {
            MenuItem categoryItem = new MenuItem((string)parentItem["CategoryName"]);
            menu.Items.Add(categoryItem);

            foreach (DataRow childItem in parentItem.GetChildRows("Children"))
            {
                MenuItem childrenItem = new MenuItem((string)childItem["ProductName"]);
                categoryItem.ChildItems.Add(childrenItem);
            }
        }

        Panel1.Controls.Add(menu);
        Panel1.DataBind();

    }

    private DataSet GetDataSetForMenu()
    {
        SqlConnection myConnection = new SqlConnection(GetConnectionString());
        SqlDataAdapter adCat = new SqlDataAdapter("SELECT * FROM Categories", myConnection);
        SqlDataAdapter adProd = new SqlDataAdapter("SELECT * FROM Products", myConnection);

        DataSet ds = new DataSet();
        adCat.Fill(ds, "Categories");
        adProd.Fill(ds, "Products");

        ds.Relations.Add("Children", ds.Tables["Categories"].Columns["CategoryID"], ds.Tables["Products"].Columns["CategoryID"]);
        return ds;

    }

    private SiteMapDataSource GetSiteMapDataSource()
    {
        XmlSiteMapProvider xmlSiteMap = new XmlSiteMapProvider();
        System.Collections.Specialized.NameValueCollection myCollection = new System.Collections.Specialized.NameValueCollection(1);
        myCollection.Add("siteMapFile", "Web.sitemap");
        xmlSiteMap.Initialize("provider", myCollection);
        xmlSiteMap.BuildSiteMap();

        SiteMapDataSource siteMap = new SiteMapDataSource();

        return siteMap;
    }


    private string GetConnectionString()
    {
        string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        return connectionString;
    }


    private void CreateTreeViewWithSqlMapDataSource()
    {
        XmlSiteMapProvider xmlSiteMap = new XmlSiteMapProvider();
        System.Collections.Specialized.NameValueCollection myCollection = new System.Collections.Specialized.NameValueCollection(1);
        myCollection.Add("siteMapFile", "Web.sitemap");
        xmlSiteMap.Initialize("provider", myCollection);
        xmlSiteMap.BuildSiteMap();

        SiteMapDataSource siteMap = new SiteMapDataSource();

        TreeView tree = new TreeView();
        tree.DataSource = siteMap;
        Panel1.Controls.Add(tree);
        Panel1.DataBind();

    }


    private void CreateTreeView()
    {
        DataSet ds = GetDataSet();
        TreeNode node = null;
        Button button = new Button();
        button.Click += new EventHandler(button_Click);
        button.Text = "Get Checked Noted";

        tree = new TreeView();

        foreach (DataRow dr in ds.Tables[0].Rows)
        {
            node = new TreeNode();
            node.Text = (string)dr["CategoryName"];
            node.ShowCheckBox = true;
            tree.Nodes.Add(node);
        }


        // Add to the Panel control
        Panel1.Controls.Add(tree);
        Panel1.Controls.Add(button);
        Panel1.DataBind();


    }

    void button_Click(object sender, EventArgs e)
    {
        TreeNodeCollection checkedNodes = tree.CheckedNodes;
        foreach (TreeNode node in checkedNodes)
        {
            Response.Write(node.Text);
        }
    }

    private DataSet GetDataSet()
    {
        SqlConnection myConnection = new SqlConnection(GetConnectionString());
        string query = @"SELECT * FROM Categories";
        SqlDataAdapter ad = new SqlDataAdapter(query, myConnection);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        return ds;
    }


    protected void btnSave_Click(object sender, EventArgs e)
    {

    }
}

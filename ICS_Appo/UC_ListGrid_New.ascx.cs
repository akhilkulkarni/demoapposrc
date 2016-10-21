using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

partial class UC_ListGrid_New : System.Web.UI.UserControl
{

    #region "Properties"

    public string InvisibleColumnIndexes
    {
        get { return hdn_InvisibleColumnIndex.Value; }
        set { hdn_InvisibleColumnIndex.Value = value; }
    }

    public string HTMLColumnIndexes
    {
        get { return hdn_HTMLColumnIndexes.Value; }
        set { hdn_HTMLColumnIndexes.Value = value; }
    }
    public string ColumnWidth
    {
        get { return hdn_ColumnWidth.Value; }
        set { hdn_ColumnWidth.Value = value; }
    }
    public string ColumnHeaderText
    {
        get { return hdn_ColumnHeaderText.Value; }
        set { hdn_ColumnHeaderText.Value = value; }
    }
    public string ColumnAlignment
    {
        get { return hdn_Alignment.Value; }
        set { hdn_Alignment.Value = value; }
    }
    public DataSet Data
    {
        get { return (DataSet)ViewState["CurrentData"]; }

        set
        {
            ViewState["CurrentData"] = value;
            ViewState["DummyData"] = value;
            defaultConfigLoader();
            ListGrid_SearchSort();
            FillGrid();
        }
    }

    public DataSet CurrentData
    {
        get { return (DataSet)ViewState["DummyData"]; }
    }

    public Int32 DefaultPageSize
    {
        get
        {
            if (!string.IsNullOrEmpty(Txt_PageSize.Text.Trim()))
            {
                return Convert.ToInt32(Txt_PageSize.Text);
            }
            else
            {
                return 10;
            }
        }
        set
        {
            if (!(value == null) && value > 0)
            {
                Txt_PageSize.Text = value.ToString();
            }
            else
            {
                Txt_PageSize.Text = "10";
            }

        }
    }

    public bool UrlBinding { get; set; }
    public Int32 URL_ColumnIndex { get; set; }
    public Int32 Special_ColumnIndex { get; set; }

    private Int32 TotalColumn { get; set; }

    #endregion

    #region "Method"

    protected void Img_Search_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            ListGrid_SearchSort();
            FillGrid();
        }
        catch (Exception ex)
        {
            lbl_Error.Text = ex.Message;
        }


    }

    protected void Img_Export_Click(object sender, ImageClickEventArgs e)
    {
        string data = hdn_HTML_Markup.Value;

        data = HttpUtility.UrlDecode(data);
        Response.Clear();
        Response.AddHeader("content-disposition", "attachment;filename=Data.xls");
        Response.Charset = "";
        Response.ContentType = "application/excel";
        HttpContext.Current.Response.Write(data);
        HttpContext.Current.Response.Flush();
        HttpContext.Current.Response.End();

    }
    protected void defaultConfigLoader()
    {

        if ((ViewState["CurrentData"] != null))
        {
            DataSet Ds_CurrDataSet = (DataSet)ViewState["CurrentData"];

            if (Ds_CurrDataSet.Tables.Count > 0)
            {
                foreach (DataColumn Col in Ds_CurrDataSet.Tables[0].Columns)
                {
                    hdn_ColumnHeader.Value = hdn_ColumnHeader.Value + "$" + Col.ColumnName + " " + (Col.DataType == typeof(Int32) | Col.DataType == typeof(bool) | Col.DataType == typeof(double) ? "=" : "like");
                }
                hdn_SortExpresion.Value = Ds_CurrDataSet.Tables[0].Columns[0].ColumnName + "| ASC";
            }
        }
    
    }
    protected void UC_ListGrid_New_Load(object sender, EventArgs e)
    {

        try
        {

            if (!Page.IsPostBack)
            {
                hdn_ColumnHeader.Value = "";

                if ((ViewState["CurrentData"] != null))
                {
                    DataSet Ds_CurrDataSet =(DataSet) ViewState["CurrentData"];

                    if (Ds_CurrDataSet.Tables.Count > 0)
                    {
                        foreach (DataColumn Col in Ds_CurrDataSet.Tables[0].Columns)
                        {
                            hdn_ColumnHeader.Value = hdn_ColumnHeader.Value + "$" + Col.ColumnName + " " + (Col.DataType == typeof(Int32) | Col.DataType == typeof(bool) | Col.DataType == typeof(double) ? "=" : "like");
                        }
                        hdn_SortExpresion.Value = Ds_CurrDataSet.Tables[0].Columns[0].ColumnName + "| ASC";
                    }

                    FillGrid();
                }
                else
                {
                    up_ListGrid.Visible = false;
                    pnl_ErrorPanel.Visible = true;

                }

            }

        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public void LoadDefault()
    {
        Grd_ListGrid.DataSource = null;
        Grd_ListGrid.DataBind();
    }
    public void Fn_Search()
    {
        try
        {
            ListGrid_SearchSort();
            FillGrid();
        }
        catch (Exception ex)
        {
            lbl_Error.Text = ex.Message;
        }
    }

    protected void ListGrid_SearchSort()
    {
        string str_SearchCriteria = hdn_SearchCriteria.Value;
        string str_SortCriteria = hdn_SortExpresion.Value;

        string condition = "";
        Int32 Counter = default(Int32);
        DataSet Ds_DummyDataSet = new DataSet();
        DataView dv = default(DataView);
        string[] str_ColumnName = hdn_ColumnHeader.Value.Split('$');

        Ds_DummyDataSet =(DataSet)ViewState["CurrentData"];

        Counter = 0;

        foreach (string str_1 in str_SearchCriteria.Split('§'))
        {

            if (!string.IsNullOrEmpty(str_1.Trim()))
            {
                if (string.IsNullOrEmpty(condition))
                {
                    condition = str_ColumnName[Counter] + " '" + (str_ColumnName[Counter].Split(' ')[1].Trim().Contains("like") ? "%" : "") + str_1 + (str_ColumnName[Counter].Split(' ')[1].Trim().Contains("like") ? "%" : "") + "'";
                }
                else
                {
                    condition = condition + " AND " + str_ColumnName[Counter] + " '" + (str_ColumnName[Counter].Split(' ')[1].Trim().Contains("like") ? "%" : "") + str_1 + (str_ColumnName[Counter].Split(' ')[1].Trim().Contains("like") ? "%" : "") + "'";
                }

            }

            Counter = Counter + 1;
        }
        //=========================================================
        //# IF SEARCHING REQUIRED
        //=========================================================

        if (!string.IsNullOrEmpty(condition))
        {
            dv = new DataView();
            var _with1 = dv;
            _with1.Table = Ds_DummyDataSet.Tables[0];
            _with1.RowFilter = condition;
            _with1.Sort = str_SortCriteria.Replace("|", " ");
            _with1.RowStateFilter = DataViewRowState.CurrentRows;

            //Ds_DummyDataSet.Tables.RemoveAt(0)
            //Ds_DummyDataSet.Tables.Add(dv.ToTable)

            DataSet DS_TMP = new DataSet();
            DS_TMP.Tables.Add(dv.ToTable());
            ViewState["DummyData"] = DS_TMP;
        }
        else
        {
            Ds_DummyDataSet =(DataSet)ViewState["CurrentData"];
            dv = new DataView();
            var _with2 = dv;
            _with2.Table = Ds_DummyDataSet.Tables[0];
            _with2.Sort = str_SortCriteria.Replace("|", " ");
            _with2.RowStateFilter = DataViewRowState.CurrentRows;
            DataSet DS_TMP = new DataSet();
            DS_TMP.Tables.Add(dv.ToTable());
            ViewState["DummyData"]= DS_TMP;
        }

    }
    protected DataSet FillGrid()
    {
        //===============================================================================
        //PAGE SIZE
        //===============================================================================

        if (!string.IsNullOrEmpty(Txt_PageSize.Text))
        {

            if (Convert.ToInt32(Txt_PageSize.Text) > 0)
            {
                Grd_ListGrid.PageSize = Convert.ToInt32(Txt_PageSize.Text.Trim());
            }
            else
            {
                Txt_PageSize.Text = Grd_ListGrid.PageSize.ToString();
            }
        }
        else
        {
            Grd_ListGrid.PageSize = DefaultPageSize;
            Txt_PageSize.Text = DefaultPageSize.ToString();
        }

        DataSet Ds = default(DataSet);
        Ds =(DataSet) ViewState["DummyData"];
        if ((Ds.Tables.Count > 0))
        {
            lbl_Result.Text = Ds.Tables[0].Rows.Count.ToString() + (Ds.Tables[0].Rows.Count > 1 ? " records found!! " : " record found!! ");
        }
        TotalColumn = Ds.Tables[0].Columns.Count;
        Grd_ListGrid.DataSource = Ds;
        Grd_ListGrid.DataBind();
        return Ds;
    }

    protected void HideColumns(Int32 ColumnCount)
    {
    }


    protected void Grd_ListGrid_PageIndexChanged(object sender, EventArgs e)
    {
    }
    protected void Grd_ListGrid_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        Grd_ListGrid.PageIndex = e.NewPageIndex;
        FillGrid();
    }


    protected void Grd_ListGrid_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.Header | e.Row.RowType == DataControlRowType.DataRow | e.Row.RowType == DataControlRowType.Footer)
        {
            string[] STR_Alignment = hdn_Alignment.Value.Split(',');
            string[] STR_ColumnHeader = hdn_ColumnHeaderText.Value.Split(',');

            if (e.Row.RowType == DataControlRowType.Header)
            {
                string[] STR_ColumnWidth = hdn_ColumnWidth.Value.Split(',');

                //===================================================================================
                //# COLUMN WIDTH
                //===================================================================================

                if (STR_ColumnWidth.Count() == TotalColumn)
                {
                    for (Int32 i = 0; i <= TotalColumn - 1; i++)
                    {
                        e.Row.Cells[i].Width = new Unit(STR_ColumnWidth[i] + "%");
                    }

                }

                //===================================================================================
                //# COLUMN HEADER
                //===================================================================================
                if (STR_ColumnHeader.Count() == TotalColumn)
                {
                    for (Int32 i = 0; i <= TotalColumn - 1; i++)
                    {
                        e.Row.Cells[i].Text = STR_ColumnHeader[i];
                    }
                }
            }

            //===================================================================================
            //# COLUMN ALIGNMENT
            //===================================================================================

            if (e.Row.RowType != DataControlRowType.Header)
            {

                if (STR_Alignment.Count() == TotalColumn)
                {
                    for (Int32 i = 0; i <= TotalColumn - 1; i++)
                    {
                        HorizontalAlign Al = default(HorizontalAlign);
                        if (STR_Alignment[i].Trim().ToUpper() == "LEFT")
                        {
                            Al = HorizontalAlign.Left;
                        }
                        else if (STR_Alignment[i].Trim().ToUpper() == "RIGHT")
                        {
                            Al = HorizontalAlign.Right;
                        }
                        else if (STR_Alignment[i].Trim().ToUpper() == "CENTER")
                        {
                            Al = HorizontalAlign.Center;
                        }
                        else if (STR_Alignment[i].Trim().ToUpper() == "JUSTIFY")
                        {
                            Al = HorizontalAlign.Justify;
                        }
                        e.Row.Cells[i].HorizontalAlign = Al;
                    }
                }

            }

            //===================================================================================
            //# COLUMN VISIBLITY
            //===================================================================================
            string[] STR_InvColumnIndexes = hdn_InvisibleColumnIndex.Value.Split(',');


            for (Int32 i = 0; i <= STR_InvColumnIndexes.Count() - 1; i++)
            {

                if (!string.IsNullOrEmpty(STR_InvColumnIndexes[i].Trim()))
                {

                    if ((Convert.ToInt32(STR_InvColumnIndexes[i]) - 1 < TotalColumn && Convert.ToInt32(STR_InvColumnIndexes[i]) - 1 >= 0))
                    {
                        e.Row.Cells[Convert.ToInt32(STR_InvColumnIndexes[i]) - 1].CssClass = "Display_None";

                    }

                }

            }
            //===================================================================================
            //# HTML COLUMN
            //===================================================================================

            if (e.Row.RowType != DataControlRowType.Header)
            {

                string[] STR_HTMLColumnIndexes = hdn_HTMLColumnIndexes.Value.Split(',');


                for (Int32 i = 0; i <= STR_HTMLColumnIndexes.Count() - 1; i++)
                {

                    if (!string.IsNullOrEmpty(STR_HTMLColumnIndexes[i].Trim()))
                    {
                        if ((Convert.ToInt32(STR_HTMLColumnIndexes[i]) - 1 < TotalColumn && Convert.ToInt32(STR_HTMLColumnIndexes[i]) - 1 >= 0))
                        {
                            string decodedText = HttpUtility.HtmlDecode(e.Row.Cells[Convert.ToInt32(STR_HTMLColumnIndexes[i]) - 1].Text);
                            e.Row.Cells[Convert.ToInt32(STR_HTMLColumnIndexes[i]) - 1].Text = decodedText;
                        }

                    }

                }
            }

            //===================================================================================
            //# COLUMN URL Binding
            //===================================================================================

            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                if (UrlBinding == true)
                {
                    if ((URL_ColumnIndex - 1 < TotalColumn && URL_ColumnIndex - 1 >= 0))
                    {
                        e.Row.Attributes.Add("onclick", "javascript:window.location.href='" + e.Row.Cells[Convert.ToInt32(URL_ColumnIndex) - 1].Text.Replace("&amp;", "&") + "','space'");

                        //e.Row.Attributes.Add("onclick", "javascript:window.location.href='" & e.Row.Cells(URL_ColumnIndex - 1).Text.Replace("&amp;", "&") & "','space'")
                    }

                }

                if ((Special_ColumnIndex != 0))
                {
                    if (e.Row.Cells[Convert.ToInt32(Special_ColumnIndex) - 1].Text == "1")
                    {
                        e.Row.Font.Bold = true;
                        e.Row.CssClass = "mGrid MyCustomRow";
                    }

                }

            }

        }

    }


    protected void Grd_ListGrid_3ed(object sender, EventArgs e)
    {
    }

    protected void Grd_ListGrid_Sorting(object sender, GridViewSortEventArgs e)
    {
        string[] str_Criteria = hdn_SortExpresion.Value.Split('|');
        string Str_ColumnName = "";
        string Str_Dir = "";


        if (str_Criteria.Count() > 1)
        {
            Str_ColumnName = str_Criteria[0].ToString();
            Str_Dir = str_Criteria[1].ToString();

        }


        if (Str_ColumnName.Equals(e.SortExpression))
        {
            if (Str_Dir.Trim() == "ASC")
            {
                Str_Dir = "DESC";
            }
            else if (Str_Dir.Trim() == "DESC")
            {
                Str_Dir = "ASC";
            }
            hdn_SortExpresion.Value = e.SortExpression + "|" + Str_Dir;

        }
        else
        {
            hdn_SortExpresion.Value = e.SortExpression + "| ASC";


        }
        ListGrid_SearchSort();
        FillGrid();
    }
    public void UpdateGrid()
    {
        try
        {
            ListGrid_SearchSort();
            FillGrid();

        }
        catch (Exception ex)
        {
        }

    }
    #endregion

    private int GetColumnIndex(string SortExpression)
    {
        int i = 0;
        foreach (DataControlField c in Grd_ListGrid.Columns)
        {
            if (c.SortExpression == SortExpression)
            {
                break; // TODO: might not be correct. Was : Exit For
            }
            i += 1;
        }
        return i;
    }
     
}
 
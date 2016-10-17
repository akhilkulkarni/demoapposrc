
Imports System.Data
Imports System.IO

Imports System.Xml
Imports System.Xml.Xsl

Imports Microsoft.VisualBasic

'====================================================================================
'Devloped By Prasanna R. Newaskar                           Start Date :13/11/2013
'------------------------------------------------------------------------------------
'LAST EDITED BY :                                                 DATE : 
'====================================================================================
Partial Class UC_ListGrid
    Inherits System.Web.UI.UserControl

#Region "Properties"

    Public Property InvisibleColumnIndexes As String
        Get
            Return hdn_InvisibleColumnIndex.Value
        End Get
        Set(ByVal value As String)
            hdn_InvisibleColumnIndex.Value = value
        End Set
    End Property

    Public Property HTMLColumnIndexes As String
        Get
            Return hdn_HTMLColumnIndexes.Value
        End Get
        Set(ByVal value As String)
            hdn_HTMLColumnIndexes.Value = value
        End Set
    End Property
    Public Property ColumnWidth As String
        Get
            Return hdn_ColumnWidth.Value
        End Get
        Set(ByVal value As String)
            hdn_ColumnWidth.Value = value
        End Set
    End Property
    Public Property ColumnHeaderText As String
        Get
            Return hdn_ColumnHeaderText.Value
        End Get
        Set(ByVal value As String)
            hdn_ColumnHeaderText.Value = value
        End Set
    End Property
    Public Property ColumnAlignment As String
        Get
            Return hdn_Alignment.Value
        End Get
        Set(ByVal value As String)
            hdn_Alignment.Value = value
        End Set
    End Property
    Public Property Data As DataSet
        Get
            Return DirectCast(ViewState("CurrentData"), DataSet)
        End Get
        Set(ByVal value As DataSet)

            ViewState("CurrentData") = value
            ViewState("DummyData") = value
            ListGrid_SearchSort()
            FillGrid()
        End Set

    End Property
    Public ReadOnly Property CurrentData As DataSet
        Get
            Return DirectCast(ViewState("DummyData"), DataSet)
        End Get

    End Property
    Public Property DefaultPageSize As Int32
        Get
            If Txt_PageSize.Text.Trim <> "" Then
                Return Txt_PageSize.Text
            Else
                Return 10
            End If
        End Get
        Set(ByVal value As Int32)
            If Not value = Nothing And value > 0 Then
                Txt_PageSize.Text = value.ToString
            Else
                Txt_PageSize.Text = 10
            End If

        End Set
    End Property

    Public Property UrlBinding As Boolean = False
    Public Property URL_ColumnIndex As Int32 = 0
    Public Property Special_ColumnIndex As Int32 = 0

    Private Property TotalColumn As Int32 = 0

#End Region

#Region "Method"

    Protected Sub Img_Search_Click(ByVal sender As Object, ByVal e As ImageClickEventArgs) Handles Img_Search.Click
        Try
            ListGrid_SearchSort()
            FillGrid()
        Catch ex As Exception
            lbl_Error.Text = ex.Message
        End Try


    End Sub
    Protected Sub Img_Export_Click(ByVal sender As Object, ByVal e As ImageClickEventArgs) Handles Img_Export.Click

        Dim data As String = hdn_HTML_Markup.Value

        data = HttpUtility.UrlDecode(data)
        Response.Clear()
        Response.AddHeader("content-disposition", "attachment;filename=Data.xls")
        Response.Charset = ""
        Response.ContentType = "application/excel"
        HttpContext.Current.Response.Write(data)
        HttpContext.Current.Response.Flush()
        HttpContext.Current.Response.End()

    End Sub

    Protected Sub UC_ListGrid_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        Try

            If Not Page.IsPostBack Then

                hdn_ColumnHeader.Value = ""
                If Not ViewState("CurrentData") Is Nothing Then

                    Dim Ds_CurrDataSet As DataSet = ViewState("CurrentData")

                    If Ds_CurrDataSet.Tables.Count > 0 Then
                        For Each Col As DataColumn In Ds_CurrDataSet.Tables(0).Columns
                            hdn_ColumnHeader.Value = hdn_ColumnHeader.Value + "$" + Col.ColumnName + " " + IIf(Col.DataType = GetType(Int32) Or Col.DataType = GetType(Boolean) Or Col.DataType = GetType(Double), "=", "like")
                        Next
                        hdn_SortExpresion.Value = Ds_CurrDataSet.Tables(0).Columns(0).ColumnName + "| ASC"
                    End If

                    FillGrid()
                Else
                    up_ListGrid.Visible = False
                    pnl_ErrorPanel.Visible = True

                End If

            End If

        Catch ex As Exception
            Throw ex
        End Try
    End Sub

    Public Sub Fn_Search()
        Try
            ListGrid_SearchSort()
            FillGrid()
        Catch ex As Exception
            lbl_Error.Text = ex.Message
        End Try
    End Sub
    Protected Sub ListGrid_SearchSort()

        Dim str_SearchCriteria As String = hdn_SearchCriteria.Value
        Dim str_SortCriteria As String = hdn_SortExpresion.Value

        Dim condition As String = "", Counter As Int32
        Dim Ds_DummyDataSet As New DataSet
        Dim dv As DataView
        Dim str_ColumnName As String() = hdn_ColumnHeader.Value.Split("$")

        Ds_DummyDataSet = ViewState("CurrentData")

        Counter = 0
        For Each str_1 As String In str_SearchCriteria.Split("§")

            If str_1.Trim() <> "" Then

                If condition = "" Then
                    condition = str_ColumnName(Counter) + " '" + IIf(str_ColumnName(Counter).Split(" ")(1).Trim.Contains("like"), "%", "") + str_1 + IIf(str_ColumnName(Counter).Split(" ")(1).Trim.Contains("like"), "%", "") + "'"
                Else
                    condition = condition + " AND " + str_ColumnName(Counter) + " '" + IIf(str_ColumnName(Counter).Split(" ")(1).Trim.Contains("like"), "%", "") + str_1 + IIf(str_ColumnName(Counter).Split(" ")(1).Trim.Contains("like"), "%", "") + "'"
                End If

            End If

            Counter = Counter + 1
        Next
        '=========================================================
        '# IF SEARCHING REQUIRED
        '=========================================================
        If condition <> "" Then

            dv = New DataView
            With dv
                .Table = Ds_DummyDataSet.Tables(0)
                .RowFilter = condition
                .Sort = str_SortCriteria.Replace("|", " ")
                .RowStateFilter = DataViewRowState.CurrentRows
            End With

            'Ds_DummyDataSet.Tables.RemoveAt(0)
            'Ds_DummyDataSet.Tables.Add(dv.ToTable)

            Dim DS_TMP As New DataSet
            DS_TMP.Tables.Add(dv.ToTable)
            ViewState("DummyData") = DS_TMP
        Else
            Ds_DummyDataSet = ViewState("CurrentData")
            dv = New DataView
            With dv
                .Table = Ds_DummyDataSet.Tables(0)
                .Sort = str_SortCriteria.Replace("|", " ")
                .RowStateFilter = DataViewRowState.CurrentRows
            End With
            Dim DS_TMP As New DataSet
            DS_TMP.Tables.Add(dv.ToTable)
            ViewState("DummyData") = DS_TMP
        End If

    End Sub
    Protected Function FillGrid() As DataSet
        '===============================================================================
        'PAGE SIZE
        '===============================================================================
        If Txt_PageSize.Text <> "" Then

            If Convert.ToInt32(Txt_PageSize.Text) > 0 Then

                Grd_ListGrid.PageSize = Txt_PageSize.Text
            Else
                Txt_PageSize.Text = Grd_ListGrid.PageSize
            End If
        Else
            Grd_ListGrid.PageSize = DefaultPageSize
            Txt_PageSize.Text = DefaultPageSize.ToString
        End If

        Dim Ds As DataSet
        Ds = ViewState("DummyData")
        If (Ds.Tables.Count > 0) Then
            lbl_Result.Text = Ds.Tables(0).Rows.Count.ToString() + IIf(Ds.Tables(0).Rows.Count > 1, " records found!! ", " record found!! ")
        End If
        TotalColumn = Ds.Tables(0).Columns.Count
        Grd_ListGrid.DataSource = Ds
        Grd_ListGrid.DataBind()
        Return Ds
    End Function
    Protected Sub HideColumns(ByVal ColumnCount As Int32)

    End Sub

    Protected Sub Grd_ListGrid_PageIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles Grd_ListGrid.PageIndexChanged

    End Sub
    Protected Sub Grd_ListGrid_PageIndexChanging(ByVal sender As Object, ByVal e As GridViewPageEventArgs) Handles Grd_ListGrid.PageIndexChanging
        Grd_ListGrid.PageIndex = e.NewPageIndex
        FillGrid()
    End Sub

    Protected Sub Grd_ListGrid_RowDataBound(ByVal sender As Object, ByVal e As GridViewRowEventArgs) Handles Grd_ListGrid.RowDataBound

        If e.Row.RowType = DataControlRowType.Header Or e.Row.RowType = DataControlRowType.DataRow Or e.Row.RowType = DataControlRowType.Footer Then

            Dim STR_Alignment() As String = hdn_Alignment.Value.Split(",")
            Dim STR_ColumnHeader() As String = hdn_ColumnHeaderText.Value.Split(",")
            If e.Row.RowType = DataControlRowType.Header Then

                Dim STR_ColumnWidth() As String = hdn_ColumnWidth.Value.Split(",")

                '===================================================================================
                '# COLUMN WIDTH
                '===================================================================================
                If STR_ColumnWidth.Count = TotalColumn Then

                    For i As Int32 = 0 To TotalColumn - 1
                        e.Row.Cells(i).Width = New Unit(STR_ColumnWidth(i) + "%")
                    Next

                End If

                '===================================================================================
                '# COLUMN HEADER
                '===================================================================================
                If STR_ColumnHeader.Count = TotalColumn Then
                    For i As Int32 = 0 To TotalColumn - 1
                        e.Row.Cells(i).Text = STR_ColumnHeader(i)
                    Next
                End If
            End If

            '===================================================================================
            '# COLUMN ALIGNMENT
            '===================================================================================
            If e.Row.RowType <> DataControlRowType.Header Then

                If STR_Alignment.Count = TotalColumn Then

                    For i As Int32 = 0 To TotalColumn - 1
                        Dim Al As HorizontalAlign
                        If STR_Alignment(i).Trim().ToUpper() = "LEFT" Then
                            Al = HorizontalAlign.Left
                        ElseIf STR_Alignment(i).Trim().ToUpper() = "RIGHT" Then
                            Al = HorizontalAlign.Right
                        ElseIf STR_Alignment(i).Trim().ToUpper() = "CENTER" Then
                            Al = HorizontalAlign.Center
                        ElseIf STR_Alignment(i).Trim().ToUpper() = "JUSTIFY" Then
                            Al = HorizontalAlign.Justify
                        End If
                        e.Row.Cells(i).HorizontalAlign = Al
                    Next
                End If

            End If

            '===================================================================================
            '# COLUMN VISIBLITY
            '===================================================================================
            Dim STR_InvColumnIndexes() As String = hdn_InvisibleColumnIndex.Value.Split(",")

            For i As Int32 = 0 To STR_InvColumnIndexes.Count() - 1

                If STR_InvColumnIndexes(i).Trim <> "" Then

                    If (STR_InvColumnIndexes(i) - 1 < TotalColumn And STR_InvColumnIndexes(i) - 1 >= 0) Then

                        e.Row.Cells(STR_InvColumnIndexes(i) - 1).CssClass = "Display_None"

                    End If

                End If

            Next
            '===================================================================================
            '# HTML COLUMN
            '===================================================================================
            If e.Row.RowType <> DataControlRowType.Header Then


                Dim STR_HTMLColumnIndexes() As String = hdn_HTMLColumnIndexes.Value.Split(",")

                For i As Int32 = 0 To STR_HTMLColumnIndexes.Count() - 1

                    If STR_HTMLColumnIndexes(i).Trim <> "" Then

                        If (STR_HTMLColumnIndexes(i) - 1 < TotalColumn And STR_HTMLColumnIndexes(i) - 1 >= 0) Then
                            Dim decodedText As String = HttpUtility.HtmlDecode(e.Row.Cells(STR_HTMLColumnIndexes(i) - 1).Text)
                            e.Row.Cells(STR_HTMLColumnIndexes(i) - 1).Text = decodedText

                        End If

                    End If

                Next
            End If

            '===================================================================================
            '# COLUMN URL Binding
            '===================================================================================
            If e.Row.RowType = DataControlRowType.DataRow Then

                If UrlBinding = True Then

                    If (URL_ColumnIndex - 1 < TotalColumn And URL_ColumnIndex - 1 >= 0) Then
                        e.Row.Attributes.Add("onclick", "javascript:window.location.href='" + e.Row.Cells(URL_ColumnIndex - 1).Text.Replace("&amp;", "&") + "','space'")

                        'e.Row.Attributes.Add("onclick", "javascript:window.location.href='" & e.Row.Cells(URL_ColumnIndex - 1).Text.Replace("&amp;", "&") & "','space'")
                    End If

                End If

                If (Special_ColumnIndex <> 0) Then
                    If e.Row.Cells(Special_ColumnIndex - 1).Text = "1" Then
                        e.Row.Font.Bold = True
                        e.Row.CssClass = "mGrid MyCustomRow"
                    End If

                End If

            End If

        End If

    End Sub

    Protected Sub Grd_ListGrid_Sorted(ByVal sender As Object, ByVal e As EventArgs) Handles Grd_ListGrid.Sorted

    End Sub
    Protected Sub Grd_ListGrid_Sorting(ByVal sender As Object, ByVal e As GridViewSortEventArgs) Handles Grd_ListGrid.Sorting

        Dim str_Criteria() As String = hdn_SortExpresion.Value.Split("|")
        Dim Str_ColumnName As String = ""
        Dim Str_Dir As String = ""

        If str_Criteria.Count > 1 Then

            Str_ColumnName = str_Criteria(0).ToString
            Str_Dir = str_Criteria(1).ToString

        End If

        If Str_ColumnName.Equals(e.SortExpression) Then

            If Str_Dir.Trim = "ASC" Then
                Str_Dir = "DESC"
            ElseIf Str_Dir.Trim = "DESC" Then
                Str_Dir = "ASC"
            End If
            hdn_SortExpresion.Value = e.SortExpression + "|" + Str_Dir

        Else
            hdn_SortExpresion.Value = e.SortExpression + "| ASC"


        End If
        ListGrid_SearchSort()
        FillGrid()
    End Sub
    Public Sub UpdateGrid()
        Try
            ListGrid_SearchSort()
            FillGrid()
        Catch ex As Exception

        End Try

    End Sub
#End Region

    Private Function GetColumnIndex(SortExpression As String) As Integer
        Dim i As Integer = 0
        For Each c As DataControlField In Grd_ListGrid.Columns
            If c.SortExpression = SortExpression Then
                Exit For
            End If
            i += 1
        Next
        Return i
    End Function
End Class


using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using DataAccessLayer;
using ICSBLL.BLL.Admin;

namespace ICSBLL.BLL.Common
{
    public class Base_BLL_CommonFunction
    {

        public enum ComboTypes
        {
            DDLVEVI = 1,
            DDLNADI = 2,
            DDLMAPRA = 3,
            DDLMUPRA = 4,
            DDLABHYA = 5,
            DDLJARAN = 6,
            DDLNIDRA = 7,
            DDLUDAR = 8,
            DDLMARAPRA = 9,
            DDLPITIHAS = 10,
            DDLOpr = 11,
            DDLJIVA = 12,
            DDLNAILS = 13,
            DDLEYES = 14,
            DDLBP = 15,
            DDLADDICTION = 16,
            DDLDIVASWAPN = 17,
            DDLPURVVRUTT = 18,
            DDLKULVRUTT = 19,
            DDLUPAVAS = 20
        }
        public static void FillCombo(System.Web.UI.WebControls.DropDownList combo, DataView dv)
        {
            try
            {
                combo.Items.Clear();
                //combo.DataSource = null;
                //combo.ClearSelection();

                combo.DataSource = dv;

                combo.DataTextField = dv.Table.Columns[1].ColumnName.ToString();
                combo.DataValueField = dv.Table.Columns[0].ColumnName.ToString();
                combo.DataBind();
                combo.Items.Insert(0, new System.Web.UI.WebControls.ListItem("--Select--", ""));

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static void FillCountry(System.Web.UI.WebControls.DropDownList combo,int FK_HospitalID)
        {
            try
            {
                DataSet DS_Data = SqlHelper.ExecuteDataset(Base_BLL_CommonSettings.ConnectionString, "USP_Common_Country_GET", FK_HospitalID);

                combo.Items.Clear();
                //combo.DataSource = null;
                //combo.ClearSelection();

                combo.DataSource = DS_Data.Tables[0];

                combo.DataTextField = DS_Data.Tables[0].Columns[1].ColumnName.ToString();
                combo.DataValueField = DS_Data.Tables[0].Columns[0].ColumnName.ToString();
                combo.DataBind();
                combo.Items.Insert(0, new System.Web.UI.WebControls.ListItem("--Select--", ""));

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static void FillState(System.Web.UI.WebControls.DropDownList combo, int FK_CountryID, int FK_HospitalID)
        {
            try
            {
                DataSet DS_Data = SqlHelper.ExecuteDataset(Base_BLL_CommonSettings.ConnectionString, "[USP_Common_State_GET]",FK_CountryID, FK_HospitalID);

                combo.Items.Clear();
                combo.DataSource = DS_Data.Tables[0];

                combo.DataTextField = DS_Data.Tables[0].Columns[1].ColumnName.ToString();
                combo.DataValueField =DS_Data.Tables[0].Columns[0].ColumnName.ToString();
                combo.DataBind();
                combo.Items.Insert(0, new System.Web.UI.WebControls.ListItem("--Select--", ""));

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        public static void FillCity(System.Web.UI.WebControls.DropDownList combo, int FK_CountryID, int FK_StateID, int FK_HospitalID)
        {
            try
            {
                DataSet DS_Data = SqlHelper.ExecuteDataset(Base_BLL_CommonSettings.ConnectionString, "[USP_Common_City_GET]", FK_CountryID, FK_StateID, FK_HospitalID);

                combo.Items.Clear();

                combo.DataSource = DS_Data.Tables[0];

                combo.DataTextField = DS_Data.Tables[0].Columns[1].ColumnName.ToString();
                combo.DataValueField = DS_Data.Tables[0].Columns[0].ColumnName.ToString();
                combo.DataBind();
                combo.Items.Insert(0, new System.Web.UI.WebControls.ListItem("--Select--", ""));

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static void FillRefferedBy(System.Web.UI.WebControls.DropDownList combo, int FK_HospitalID)
        {
            try
            {
                DataSet DS_Data = SqlHelper.ExecuteDataset(Base_BLL_CommonSettings.ConnectionString, "[USP_Referred_By_Master_GET]", FK_HospitalID);

                combo.Items.Clear();

                combo.DataSource = DS_Data.Tables[0];

                combo.DataTextField = DS_Data.Tables[0].Columns[1].ColumnName.ToString();
                combo.DataValueField = DS_Data.Tables[0].Columns[0].ColumnName.ToString();
                combo.DataBind();
                combo.Items.Insert(0, new System.Web.UI.WebControls.ListItem("--Select--", ""));

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}

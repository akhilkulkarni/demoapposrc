using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Reflection;
using DataAccessLayer;
using ICSBLL.BLL.Common;




namespace ICSBLL.BLL.PatientManagement
{
    public class Base_BLL_Patient
    {

        public int PK_PatientID { get; set; }
        public string PatientRegID { get; set; }
        public int FK_AppointmentID { get; set; }

        public string AppointmentDate { get; set; }
        public int IsDemandTimeAppointment { get; set; }
        public string AppointmentTime { get; set; }

        public string FirstName { get; set; }
        public string MiddleName { get; set; }
        public string LastName { get; set; }
        public string FullName { get; set; }

        public string LocalAddress { get; set; }
        public string PermenentAddress { get; set; }
        public string ImageUrl { get; set; }
        
        public int Gender { get; set; }
           
        public string Birthdate { get; set; }
        public int Age { get; set; }
        public string BloodGroup { get; set; }
        public string PhoneNo { get; set; }
        public string MobileNo { get; set; }
        public string MarritalStatus { get; set; }
        public int IsLocalite { get; set; }
        public int RefferedBy { get; set; }
        public int Religon { get; set; }

        public string RegDate { get; set; }

        public int City { get; set; }
        public int State { get; set; }
        public int Country { get; set; }

        public int IsNew { get; set; }
        public string Note { get; set; }
        public int IsDeleted { get; set; }
        public double Weight { get; set; }
        public int FK_HospitalID { get; set; }


        public object InsertUpdate()
        {
            try
            {
                return SqlHelper.ExecuteScalar(Base_BLL_CommonSettings.ConnectionString, "[USP_PM_Patient_AddEdit]", PK_PatientID, PatientRegID, FirstName, MiddleName, LastName, FullName, LocalAddress, PermenentAddress, ImageUrl, Gender, Birthdate, Age, BloodGroup, PhoneNo, MobileNo, MarritalStatus, IsLocalite, RefferedBy, Country, State, City, IsNew, Note, Weight);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public DataSet Update()
        {
            try
            {
                return SqlHelper.ExecuteDataset(Base_BLL_CommonSettings.ConnectionString, "USP_Patient_UPDATE", PK_PatientID, FullName, IsNew, IsLocalite);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public int Delete()
        {
            return 0;
        }
        public int Appoint()
        {
            return 0;
        }
        //public DataSet InsertAndAppoint()
        //{
          
        //    try
        //    {
        //       // ds = SqlHelper.ExecuteDataset(Base_BLL_CommonSettings.ConnectionString, "USP_AppointmentPatient_SaveAndAppoint_Birla", FullName, IsNew, IsLocalite,AppointmentDate);
        //        return SqlHelper.ExecuteDataset(Base_BLL_CommonSettings.ConnectionString, "USP_Patient_SaveAndAppoint_Birla", FullName,IsLocalite,IsNew,AppointmentDate);
                
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
            
        //}
        public DataSet InsertAndAppoint()
        {

            try
            {
                 return SqlHelper.ExecuteDataset(Base_BLL_CommonSettings.ConnectionString, "USP_Patient_SaveAndAppoint", PK_PatientID, FullName, IsLocalite, IsNew,AppointmentDate);
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        public DataSet InsertAndAppoint_DimandTimeAppo()
        {

            try
            {
                return SqlHelper.ExecuteDataset(Base_BLL_CommonSettings.ConnectionString, "USP_Patient_SaveAndAppoint_DemandTime",PK_PatientID, FullName, IsLocalite, IsNew, AppointmentDate,AppointmentTime);

            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        public DataSet GetPatientList()
        {
            //USP_PatientManagement_PatientList_Today
            return SqlHelper.ExecuteDataset(Base_BLL_CommonSettings.ConnectionString, "[USP_PM_Patient_List]", FK_HospitalID);

        }

        public DataSet GetPatientList(string SearchCriteria)
        {
            //USP_PatientManagement_PatientList_Today
            return SqlHelper.ExecuteDataset(Base_BLL_CommonSettings.ConnectionString, "[USP_PM_Patient_AutoComplete_GET]", FK_HospitalID,SearchCriteria);

        }
        public void GetPatient(int FK_PatientID)
        {
            try
            {

                DataSet ds = SqlHelper.ExecuteDataset(Base_BLL_CommonSettings.ConnectionString, "USP_Patient_GetInformation", FK_PatientID);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    PK_PatientID = Convert.ToInt32(ds.Tables[0].Rows[0]["PK_PatientID"]);
                    PatientRegID = ds.Tables[0].Rows[0]["PatientRegID"].ToString();
                    FirstName = ds.Tables[0].Rows[0]["FirstName"].ToString();
                    MiddleName = ds.Tables[0].Rows[0]["MiddleName"].ToString();
                    LastName = ds.Tables[0].Rows[0]["LastName"].ToString();
                    FullName = ds.Tables[0].Rows[0]["FullName"].ToString();
                    LocalAddress = ds.Tables[0].Rows[0]["LocalAddress"].ToString();
                    PermenentAddress = ds.Tables[0].Rows[0]["PermenentAddress"].ToString();
                    ImageUrl = ds.Tables[0].Rows[0]["ImageUrl"].ToString();
                    Gender = Convert.ToInt32(ds.Tables[0].Rows[0]["Gender"]);
                    Birthdate = ds.Tables[0].Rows[0]["Birthdate"].ToString();
                    Age = Convert.ToInt32(ds.Tables[0].Rows[0]["Age"]);
                    BloodGroup = ds.Tables[0].Rows[0]["BloodGroup"].ToString();
                    PhoneNo = ds.Tables[0].Rows[0]["PhoneNo"].ToString();
                    MobileNo = ds.Tables[0].Rows[0]["MobileNo"].ToString();
                    MarritalStatus = ds.Tables[0].Rows[0]["MarritalStatus"].ToString();
                    IsLocalite = Convert.ToInt32(ds.Tables[0].Rows[0]["ISLocal"]);
                    RefferedBy = Convert.ToInt32(ds.Tables[0].Rows[0]["RefferedBy"]);
                  
                    City = Convert.ToInt32(ds.Tables[0].Rows[0]["City"]);
                    Country = Convert.ToInt32(ds.Tables[0].Rows[0]["Country"]);
                    State = Convert.ToInt32(ds.Tables[0].Rows[0]["State"]);
                    IsNew = Convert.ToInt32(ds.Tables[0].Rows[0]["IsNew"]);
                    RegDate = ds.Tables[0].Rows[0]["RegDate"].ToString();
                    Note = ds.Tables[0].Rows[0]["Note"].ToString();
                    IsDeleted = Convert.ToInt32(ds.Tables[0].Rows[0]["ISDeleted"]);
                    Weight = Convert.ToDouble(ds.Tables[0].Rows[0]["Weight"]);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public DataSet SearchPatient(string patientRegID,string PatientName,string City,string MobileNo)
        {
            DataSet ds = new DataSet();
            return ds;
        }
        public DataSet Get_Appointment_Queue()
        {

            try
            {
                DataSet ds;
                // ds = SqlHelper.ExecuteDataset(Base_BLL_CommonSettings.ConnectionString, "USP_AppointmentPatient_SaveAndAppoint_Birla", FullName, IsNew, IsLocalite,AppointmentDate);
                ds = SqlHelper.ExecuteDataset(Base_BLL_CommonSettings.ConnectionString, CommandType.StoredProcedure, "USP_Appointment_Queue");
                return ds;

            }
            catch (Exception ex)
            {

                throw ex;

            }

        }

        public string Appointment_Validate()
        {

            try
            {
                return SqlHelper.ExecuteScalar(Base_BLL_CommonSettings.ConnectionString, "USP_Appointment_VALIDATE",AppointmentDate, AppointmentTime).ToString();
            }
            catch (Exception ex)
            {
                throw ex;
            }


        }

        public static DataSet getDignosticDiv()
        {
            DataSet ds = null;
            try
            {
                 ds = SqlHelper.ExecuteDataset(Base_BLL_CommonSettings.ConnectionString, "USP_Patient_Dignostic");

            }
            catch (Exception ex)
            {
                throw ex;
            }

            return ds;
        }

        public static void  InsertPatientDiagnostic(string patientid,string xmldata)
        {
           
            try
            {
                SqlHelper.ExecuteScalar(Base_BLL_CommonSettings.ConnectionString, "USP_PATIENT_INSPECTION", patientid, xmldata);

            }
            catch (Exception ex)
            {
                throw ex;
            }

           
        }

    }
}

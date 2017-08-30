using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Security.Cryptography;
using System.Text;
using System.Web.Script.Services;
using System.Web.Services;
using SimbahanApp.Models;
using SimbahanApp.Services;
using SimbahanAPI.Models;

namespace SimbahanAPI
{
    /// <summary>
    ///     Summary description for SimbahanWebService
    /// </summary>
    [WebService(Namespace = "http://simbahan-api.azurewebsites.net/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [ScriptService]
    public class SimbahanWebService : WebService
    {
        private readonly ChurchService churchService;
        private readonly AdorationService adorationService;

        public SimbahanWebService()
        {
            churchService = new ChurchService();
            adorationService = new AdorationService();
        }


        #region Simbahan


        #region POST

        #endregion

        #region GET


        [WebMethod(EnableSession = true, Description = "Basic church search.")]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public List<ChurchInfo> SearchChurches(string keyword, string location)
        {
            return SearchChurchesAdvance(
                keyword, location,
                "", "", "", "", "",
                false, false, false,
                "", "",
                false, false, false,
                0, 0, 100, 1
            );
        }

        [WebMethod(EnableSession = true, Description = "Finds churches with advance filter.")]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public List<ChurchInfo> SearchChurchesAdvance(string keyword, string location,
            string massDay, string massTime,
            string massLanguage, string confessionDay,
            string confessionTime, bool hasAirCon, bool hasCeilingFan,
            bool hasOrdinaryFan, string churchType, string locationId,
            bool hasStreetParking, bool hasMallParking, bool hasPrivateParking,
            double userLatitude, double userLongitude, int limit, int page)
        {
            var ventilationList = new List<string>();
            var parkingList = new List<string>();

            if (hasAirCon)
                ventilationList.Add("1");

            if (hasCeilingFan)
                ventilationList.Add("2");

            if (hasOrdinaryFan)
                ventilationList.Add("3");

            var ventilations = string.Join(",", ventilationList);

            if (hasPrivateParking)
                parkingList.Add("1");

            if (hasMallParking)
                parkingList.Add("2");

            if (hasStreetParking)
                parkingList.Add("3");

            var parkings = string.Join(",", parkingList);

            return churchService.Search(
                keyword, location, churchType,
                location, "", massDay,
                massTime, massLanguage, confessionTime,
                confessionDay, ventilations, parkings, ""
            );
        }

        [WebMethod(EnableSession = true, Description = "Gets all the data about a certain church.")]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public ChurchInfo FindChurch(int id)
        {
            return churchService.Find(id);
        }


        #endregion


        #endregion


        #region Adoration


        #region POST

        #endregion

        #region GET


        [WebMethod(EnableSession = true, Description = "Basic adoration search.")]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public List<Adoration> SearchAdorations(string keyword, string location)
        {
            return SearchAdorationsAdvance();
        }

        [WebMethod(EnableSession = true, Description = "Finds adorations with advance filter.")]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public List<Adoration> SearchAdorationsAdvance()
        {
            
        }

        [WebMethod(EnableSession = true, Description = "Save all simbahan details into the database.")]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public Adoration FindAdoration(int id)
        {
            // TODO: Finds adoration
            return adorationService.Find(id);
        }


        #endregion


        #endregion


        #region Organization


        #region POST

        #endregion

        #region GET

        #endregion


        #endregion


        #region Daily Gospel


        #region POST

        #endregion

        #region GET

        #endregion


        #endregion


        #region Daily Reflection


        #region POST

        #endregion

        #region GET

        #endregion


        #endregion


        #region Saint of the Day


        #region POST

        #endregion

        #region GET

        #endregion


        #endregion


        #region Basic Catholic Prayer


        #region POST

        #endregion

        #region GET

        #endregion


        #endregion


        #region Other Catholic Prayer


        #region POST

        #endregion

        #region GET

        #endregion


        #endregion


        #region Devotion


        #region POST

        #endregion

        #region GET

        #endregion


        #endregion


        #region Bible Verse


        #region POST

        #endregion

        #region GET

        #endregion


        #endregion


        #region Religious Quote


        #region POST

        #endregion

        #region GET

        #endregion


        #endregion


        #region Musical Inspiration


        #region POST

        #endregion

        #region GEt

        #endregion


        #endregion


        #region Visita Iglesia


        #region POST

        #endregion

        #region GET

        #endregion


        #endregion


        [WebMethod(EnableSession = true, Description = "Save all simbahan details into the database.")]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public SimbahanModel Post_Simbahan_Info(int streetNumber, string streetName, string barangay, string city,
            string stateProvince, string zipCode, string diocese, string parish, string priest, string vicariate,
            string officeHours, double latitude, double longitude, bool hasAdorationChapel, string feastDay,
            string dateEstablished, string contactNo, string churchHistory, string completeAddress,
            string website, string email, string devotionSched, int churchTypeId, int locationId)
        {
            var SimbahanDetails = new SimbahanModel
            {
                StreetNo = streetNumber,
                StreetName = streetName,
                Barangay = barangay,
                City = city,
                StateProvince = stateProvince,
                ZipCode = zipCode,
                Diocese = diocese,
                Parish = parish,
                Priest = priest,
                Vicariate = vicariate,
                OfficeHours = officeHours,
                Latitude = latitude,
                Longitude = longitude,
                LastUpdate = DateTime.Now,
                HasAdorationChapel = hasAdorationChapel,
                FeastDay = feastDay,
                DateEstablished = dateEstablished,
                DateCreated = DateTime.Now,
                ContactNo = contactNo,
                ChurchHistory = churchHistory,
                CompleteAddress = completeAddress,
                ChurchTypeID = churchTypeId,
                Website = website,
                EmailAddress = email,
                DevotionSchedule = devotionSched,
                LocationID = locationId
            };

            ////// INSERT DATA INTO TABLE ////// By: Ronald Alba
            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spInsertSimbahanDetails", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@StreetNo", SimbahanDetails.StreetNo);
                        cmd.Parameters.AddWithValue("@StreetName", SimbahanDetails.StreetName);
                        cmd.Parameters.AddWithValue("@Barangay", SimbahanDetails.Barangay);
                        cmd.Parameters.AddWithValue("@City", SimbahanDetails.City);
                        cmd.Parameters.AddWithValue("@StateOrProvince", SimbahanDetails.StateProvince);
                        cmd.Parameters.AddWithValue("@ZipCode", SimbahanDetails.ZipCode);
                        cmd.Parameters.AddWithValue("@Parish", SimbahanDetails.Parish);
                        cmd.Parameters.AddWithValue("@Diocese", SimbahanDetails.Diocese);
                        cmd.Parameters.AddWithValue("@ParishPriest", SimbahanDetails.Priest);
                        cmd.Parameters.AddWithValue("@Vicariate", SimbahanDetails.Vicariate);
                        cmd.Parameters.AddWithValue("@DateEstablished", SimbahanDetails.DateEstablished);
                        cmd.Parameters.AddWithValue("@DateCreated", SimbahanDetails.DateCreated);
                        cmd.Parameters.AddWithValue("@LastUpdate", SimbahanDetails.LastUpdate);
                        cmd.Parameters.AddWithValue("@HasAdorationChapel", SimbahanDetails.HasAdorationChapel);
                        cmd.Parameters.AddWithValue("@FeastDay", SimbahanDetails.FeastDay);
                        cmd.Parameters.AddWithValue("@ContactNo", SimbahanDetails.ContactNo);
                        cmd.Parameters.AddWithValue("@Latitude", SimbahanDetails.Latitude);
                        cmd.Parameters.AddWithValue("@Longitude", SimbahanDetails.Longitude);
                        cmd.Parameters.AddWithValue("@ChurchHistory", SimbahanDetails.ChurchHistory);
                        cmd.Parameters.AddWithValue("@OfficeHours", SimbahanDetails.OfficeHours);
                        cmd.Parameters.Add("@SimbahanAutoID", SqlDbType.BigInt).Direction = ParameterDirection.Output;
                        cmd.ExecuteNonQuery();

                        //Get the last inserted ID number
                        SimbahanDetails.SimbahanID =
                            Convert.ToInt32(cmd.Parameters["@SimbahanAutoID"].Value.ToString());
                    }
                    catch (Exception ex)
                    {
                        throw new Exception(ex.Message);
                    }
                    finally
                    {
                        dbconn.Close();
                        dbconn.Dispose();
                    }
                }
            }
            // Return all inserted simbahan data from the database
            return SimbahanDetails;
        }

        [WebMethod(EnableSession = true, Description = "Save all simbahan activities into the database.")]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public MassDetailsModel Post_Mass_Info(int ScheduleID, string Time, string Language)
        {
            var MassDetails = new MassDetailsModel();
            MassDetails.ScheduleID = ScheduleID;
            MassDetails.Time = Time;
            MassDetails.Language = Language;

            ////// INSERT DATA INTO TABLE ////// By: Ronald Alba
            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spInsertMassDetails", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@Time", MassDetails.Time);
                        cmd.Parameters.AddWithValue("@ScheduleID", MassDetails.ScheduleID);
                        cmd.Parameters.AddWithValue("@Language", MassDetails.Language);
                        cmd.Parameters.Add("@MassDetailAutoID", SqlDbType.BigInt).Direction = ParameterDirection.Output;
                        cmd.ExecuteNonQuery();

                        //Get the last inserted ID number
                        MassDetails.MassDetailID =
                            Convert.ToInt32(cmd.Parameters["@MassDetailAutoID"].Value.ToString());
                    }
                    catch (Exception ex)
                    {
                        throw new Exception(ex.Message);
                    }
                    finally
                    {
                        dbconn.Close();
                        dbconn.Dispose();
                    }
                }
            }

            return MassDetails;
        }

        [WebMethod(EnableSession = true, Description = "Save all related IDs into the 3rd table/database.")]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public SimbahanMassDetailsModel Post_SimbahanMass_Info(int SimbahanID, int MassDetailID, int VentilationID,
            int ParkingID)
        {
            var SimbahanMassDetails = new SimbahanMassDetailsModel();
            SimbahanMassDetails.SimbahanID = SimbahanID;
            SimbahanMassDetails.MassDetailID = MassDetailID;
            SimbahanMassDetails.VentID = VentilationID;
            SimbahanMassDetails.ParkingID = ParkingID;
            //SimbahanMassDetails.LocationID = LocationID;

            ////// INSERT DATA INTO TABLE ////// By: Ronald Alba
            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spInsertSimbahanMassDetails", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@SimbahanID", SimbahanMassDetails.SimbahanID);
                        cmd.Parameters.AddWithValue("@MassDetailID", SimbahanMassDetails.MassDetailID);
                        cmd.Parameters.AddWithValue("@VentID", SimbahanMassDetails.VentID);
                        cmd.Parameters.AddWithValue("@ParkingID", SimbahanMassDetails.ParkingID);
                        //cmd.Parameters.AddWithValue("@LocationID", SimbahanMassDetails.LocationID);
                        cmd.Parameters.Add("@SimbahanMassAutoID", SqlDbType.BigInt).Direction =
                            ParameterDirection.Output;
                        cmd.ExecuteNonQuery();

                        SimbahanMassDetails.SimbahanMassID =
                            Convert.ToInt32(cmd.Parameters["@SimbahanMassAutoID"].Value.ToString());
                    }
                    catch (Exception ex)
                    {
                        throw new Exception(ex.Message);
                    }
                    finally
                    {
                        dbconn.Close();
                        dbconn.Dispose();
                    }
                }
            }

            return SimbahanMassDetails;
        }

        [WebMethod(EnableSession = true, Description = "Save all simbahan locations into the database.")]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public LocationModel Post_Location_Info(List<string> LocationType, bool IsLocated)
        {
            try
            {
                var LocationDetails = new LocationModel();
                LocationDetails.LocationType = LocationType;

                ////// INSERT DATA INTO TABLE ////// By: Ronald Alba
                using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"]
                    .ConnectionString))
                {
                    if (dbconn.State == ConnectionState.Open)
                        dbconn.Close();
                    dbconn.Open();

                    using (var cmd = new SqlCommand("spInsertLocationDetails", dbconn))
                    {
                        try
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.AddWithValue("@LocationType", LocationDetails.LocationType);
                            cmd.Parameters.Add("@LocationAutoID", SqlDbType.BigInt).Direction =
                                ParameterDirection.Output;
                            cmd.ExecuteNonQuery();

                            LocationDetails.LocationID =
                                Convert.ToInt32(cmd.Parameters["@LocationAutoID"].Value.ToString());
                        }
                        catch (Exception ex)
                        {
                            throw new Exception(ex.Message);
                        }
                        finally
                        {
                            dbconn.Close();
                            dbconn.Dispose();
                        }
                    }
                }

                return LocationDetails;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        [WebMethod(EnableSession = true, Description = "Save all simbahan parking details into the database.")]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public ParkingModel Post_Parking_Info(string ParkingType)
        {
            try
            {
                var ParkingDetails = new ParkingModel();
                ParkingDetails.ParkingType = ParkingType;

                ////// INSERT DATA INTO TABLE ////// By: Ronald Alba
                using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"]
                    .ConnectionString))
                {
                    if (dbconn.State == ConnectionState.Open)
                        dbconn.Close();
                    dbconn.Open();

                    using (var cmd = new SqlCommand("spInsertParkingDetails", dbconn))
                    {
                        try
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.AddWithValue("@ParkingType", ParkingDetails.ParkingType);
                            cmd.Parameters.Add("@ParkingAutoID", SqlDbType.BigInt).Direction =
                                ParameterDirection.Output;
                            cmd.ExecuteNonQuery();

                            ParkingDetails.ParkingID =
                                Convert.ToInt32(cmd.Parameters["@ParkingAutoID"].Value.ToString());
                        }
                        catch (Exception ex)
                        {
                            throw new Exception(ex.Message);
                        }
                        finally
                        {
                            dbconn.Close();
                            dbconn.Dispose();
                        }
                    }
                }

                return ParkingDetails;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        [WebMethod(EnableSession = true, Description = "Save all simbahan adoration chapel details into the database.")]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public AdorationChapelModel Post_AdorationChapel_Info(int AdorationID, int ScheduleID, string Time,
            int TimeStandardID)
        {
            var AdorationChapelDetails = new AdorationChapelModel();
            AdorationChapelDetails.AdorationID = AdorationID;
            AdorationChapelDetails.ScheduleID = ScheduleID;
            AdorationChapelDetails.Time = Time;
            AdorationChapelDetails.TimeStandardID = TimeStandardID;

            ////// INSERT DATA INTO TABLE ////// By: Ronald Alba
            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spInsertAdoChapelDetails", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@AdorationID", AdorationChapelDetails.AdorationID);
                        cmd.Parameters.AddWithValue("@ScheduleID", AdorationChapelDetails.ScheduleID);
                        cmd.Parameters.AddWithValue("@Time", AdorationChapelDetails.Time);
                        cmd.Parameters.AddWithValue("@TimeStandardID", AdorationChapelDetails.TimeStandardID);
                        cmd.Parameters.Add("@AdChapelAutoID", SqlDbType.BigInt).Direction = ParameterDirection.Output;
                        cmd.ExecuteNonQuery();

                        AdorationChapelDetails.AdChapelID =
                            Convert.ToInt32(cmd.Parameters["@AdChapelAutoID"].Value.ToString());
                    }
                    catch (Exception ex)
                    {
                        throw new Exception(ex.Message);
                    }
                    finally
                    {
                        dbconn.Close();
                        dbconn.Dispose();
                    }
                }
            }

            return AdorationChapelDetails;
        }

        [WebMethod(EnableSession = true, Description = "Get and validate user's credentials.")]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public bool Login(string Username, string Password)
        {
            var get = new LoginModel();
            get.Username = Username;
            get.Password = Password;
            get.Result = false;

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spGetCredentials", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@Username", get.Username);
                        cmd.Parameters.AddWithValue("@Password", get.Password);
                        var dr = cmd.ExecuteReader();
                        if (dr.Read())
                            get.Result = true;
                        else
                            get.Result = false;
                    }
                    catch (Exception ex)
                    {
                        throw new Exception(ex.Message);
                    }
                    finally
                    {
                        dbconn.Close();
                        dbconn.Dispose();
                    }
                }
            }

            return get.Result;
        }

        [WebMethod(EnableSession = true, Description = "Store users regitration details into the database.")]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public RegisterModel Post_Registration_Info(string FirstName, string LastName, string MiddleName, string Gender,
            string Religion, string EmailAddress, string Username, string Password)
        {
            var Registration = new RegisterModel();
            Registration.FirstName = FirstName;
            Registration.LastName = LastName;
            Registration.MiddleName = MiddleName;
            Registration.Gender = Gender;
            Registration.Religion = Religion;
            Registration.EmailAddress = EmailAddress;
            Registration.Username = Username;
            Registration.Password = Password;

            ////// INSERT DATA INTO TABLE ////// By: Ronald Alba
            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spInsertRegistrationDetails", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@FirstName", Registration.FirstName);
                        cmd.Parameters.AddWithValue("@LastName", Registration.LastName);
                        cmd.Parameters.AddWithValue("@EmailAddress", Registration.EmailAddress);
                        cmd.Parameters.AddWithValue("@MiddleName", Registration.MiddleName);
                        cmd.Parameters.AddWithValue("@Gender", Registration.Gender);
                        cmd.Parameters.AddWithValue("@Religion", Registration.Religion);
                        cmd.Parameters.AddWithValue("@Username", Registration.Username);
                        cmd.Parameters.AddWithValue("@Password", Registration.Password);
                        cmd.Parameters.Add("@RegAutoID", SqlDbType.BigInt).Direction = ParameterDirection.Output;
                        cmd.ExecuteNonQuery();

                        Registration.RegistrationID = Convert.ToInt32(cmd.Parameters["@RegAutoID"].Value.ToString());
                    }
                    catch (Exception ex)
                    {
                        throw new Exception(ex.Message);
                    }
                    finally
                    {
                        dbconn.Close();
                        dbconn.Dispose();
                    }
                }
            }

            return Registration;
        }

        [WebMethod(EnableSession = true, Description = "Store baptism information into database.")]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public BaptismModel Post_Baptism_Details(string Description, int SimbahanID)
        {
            var Baptism = new BaptismModel();
            Baptism.Text = Description;
            Baptism.SimbahanID = SimbahanID;

            ////// INSERT DATA INTO TABLE ////// By: Ronald Alba
            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spInsertBaptismDetails", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@Details", Baptism.Text);
                        cmd.Parameters.AddWithValue("@SimbahanID", Baptism.SimbahanID);
                        cmd.Parameters.Add("@BaptismAutoID", SqlDbType.BigInt).Direction = ParameterDirection.Output;
                        cmd.ExecuteNonQuery();

                        Baptism.BaptismID = Convert.ToInt32(cmd.Parameters["@BaptismAutoID"].Value.ToString());
                    }
                    catch (Exception ex)
                    {
                        throw new Exception(ex.Message);
                    }
                    finally
                    {
                        dbconn.Close();
                        dbconn.Dispose();
                    }
                }
            }

            return Baptism;
        }

        [WebMethod(EnableSession = true, Description = "Store wedding information into database.")]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public WeddingModel Post_Wedding_Details(string Description, int SimbahanID)
        {
            var Wedding = new WeddingModel();
            Wedding.Text = Description;
            Wedding.SimbahanID = SimbahanID;

            ////// INSERT DATA INTO TABLE ////// By: Ronald Alba
            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spInsertWeddingDetails", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@Details", Wedding.Text);
                        cmd.Parameters.AddWithValue("@SimbahanID", Wedding.SimbahanID);
                        cmd.Parameters.Add("@WeddingAutoID", SqlDbType.BigInt).Direction = ParameterDirection.Output;
                        cmd.ExecuteNonQuery();

                        Wedding.WeddingID = Convert.ToInt32(cmd.Parameters["@WeddingAutoID"].Value.ToString());
                    }
                    catch (Exception ex)
                    {
                        throw new Exception(ex.Message);
                    }
                    finally
                    {
                        dbconn.Close();
                        dbconn.Dispose();
                    }
                }
            }

            return Wedding;
        }

        [WebMethod(EnableSession = true, Description = "Store confession information into database.")]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public ConfessionModel Post_Confession_Details(string Time, int SimbahanID, int ScheduleID)
        {
            var Confession = new ConfessionModel();
            Confession.Time = Time;
            Confession.SimbahanID = SimbahanID;
            Confession.ScheduleID = ScheduleID;

            ////// INSERT DATA INTO TABLE ////// By: Ronald Alba
            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spInsertConfessionDetails", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@Time", Confession.Time);
                        cmd.Parameters.AddWithValue("@SimbahanID", Confession.SimbahanID);
                        cmd.Parameters.AddWithValue("@ScheduleID", Confession.ScheduleID);
                        cmd.Parameters.Add("@ConfessionAutoID", SqlDbType.BigInt).Direction = ParameterDirection.Output;
                        cmd.ExecuteNonQuery();

                        Confession.ConfessionID = Convert.ToInt32(cmd.Parameters["@ConfessionAutoID"].Value.ToString());
                    }
                    catch (Exception ex)
                    {
                        throw new Exception(ex.Message);
                    }
                    finally
                    {
                        dbconn.Close();
                        dbconn.Dispose();
                    }
                }
            }

            return Confession;
        }

        [WebMethod(EnableSession = true,
            Description = "Get churches with complete details (Mass schedules, location, etc.)")]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public ChurchInfo Get_Churches(int ChurchID)
        {
            var SimbahanInfo = new ChurchInfo();
            SimbahanInfo.SimbahanID = ChurchID;

            var Vent = new List<VentilationModel>();
            var Sched = new List<ChurchScheduleModel>();
            var Photos = new List<ChurchPhotosModel>();
            var Church_Parking = new List<ParkingSlot>();
            var Adoration_Schedule = new List<AdorationChapel>();
            var Confess_Sched = new List<ConfessionSchedule>();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spGetChurches", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@simbahanID", SimbahanInfo.SimbahanID);

                        var dr = cmd.ExecuteReader();

                        while (dr.Read())
                        {
                            SimbahanInfo = new ChurchInfo();

                            SimbahanInfo.SimbahanID = Convert.ToInt32(dr["SimbahanID"]);
                            SimbahanInfo.StreetNo = Convert.IsDBNull(dr["StreetNo"])
                                ? null
                                : (int?) Convert.ToInt32(dr["StreetNo"]);
                            SimbahanInfo.StreetName = dr["StreetName"].ToString();
                            SimbahanInfo.Barangay = dr["Barangay"].ToString();
                            SimbahanInfo.City = dr["City"].ToString();
                            SimbahanInfo.StateProvince = dr["StateOrProvince"].ToString();
                            SimbahanInfo.ZipCode = dr["ZipCode"].ToString();
                            SimbahanInfo.Parish = dr["Parish"].ToString();
                            SimbahanInfo.Diocese = dr["Diocese"].ToString();
                            SimbahanInfo.Priest = dr["ParishPriest"].ToString();
                            SimbahanInfo.Vicariate = dr["Vicariate"].ToString();
                            SimbahanInfo.DateCreated = Convert.ToDateTime(dr["DateCreated"].ToString());
                            SimbahanInfo.LastUpdate = Convert.ToDateTime(dr["LastUpdate"].ToString());
                            SimbahanInfo.HasAdorationChapel = Convert.ToBoolean(dr["HasAdorationChapel"].ToString());
                            SimbahanInfo.ChurchHistory = dr["ChurchHistory"].ToString();
                            SimbahanInfo.CompleteAddress = dr["CompleteAddress"].ToString();
                            SimbahanInfo.ChurchTypeID = Convert.IsDBNull(dr["ChurchTypeID"])
                                ? 0
                                : Convert.ToInt32(dr["ChurchTypeID"]);
                            SimbahanInfo.Longitude = Convert.ToDouble(dr["Longitude"].ToString());
                            SimbahanInfo.Latitude = Convert.ToDouble(dr["Latitude"].ToString());
                            SimbahanInfo.ContactNo = dr["ContactNo"].ToString();
                            SimbahanInfo.Website = dr["Website"].ToString();
                            SimbahanInfo.EmailAddress = dr["EmailAddress"].ToString();
                            SimbahanInfo.DateEstablished = dr["DateEstablished"].ToString();
                            SimbahanInfo.FeastDay = dr["FeastDay"].ToString();
                            SimbahanInfo.LocationID = Convert.IsDBNull(dr["LocationID"])
                                ? 0
                                : Convert.ToInt32(dr["LocationID"]);
                            SimbahanInfo.OfficeHours = dr["OfficeHours"].ToString();
                            SimbahanInfo.DevotionSchedule = dr["DevotionSchedule"].ToString();
                        }

                        char[] separator = {','};

                        // Ventilation Processing...
                        dr.NextResult();
                        while (dr.Read())
                        {
                            var ventilation = dr["VentType"].ToString().Split(separator, StringSplitOptions.None);
                            foreach (var strVent in ventilation)
                                Vent.Add(new VentilationModel {VentType = strVent});
                        }
                        SimbahanInfo.Ventilations = Vent;

                        // Mass Schedules Processing...
                        dr.NextResult();
                        while (dr.Read())
                        {
                            var massDetails = new MassDetailsModel();
                            massDetails.MassDetailID = Convert.ToInt32(dr["MassDetailID"]);
                            massDetails.ScheduleID = Convert.ToInt32(dr["ScheduleID"]);
                            massDetails.TimeStandardID = Convert.IsDBNull(dr["TimeStandardID"])
                                ? 0
                                : Convert.ToInt32(dr["TimeStandardID"]);
                            massDetails.Time = dr["Time"].ToString();
                            massDetails.Language = dr["Language"].ToString();

                            switch (Convert.ToInt32(dr["ScheduleID"]))
                            {
                                case 1:
                                    massDetails.Days = "Sunday";
                                    SimbahanInfo.SundayMassSchedule.Add(massDetails);
                                    break;

                                case 2:
                                    massDetails.Days = "Monday";
                                    SimbahanInfo.MondayMassSchedule.Add(massDetails);
                                    break;

                                case 3:
                                    massDetails.Days = "Tuesday";
                                    SimbahanInfo.TuesdayMassSchedule.Add(massDetails);
                                    break;

                                case 4:
                                    massDetails.Days = "Wednesday";
                                    SimbahanInfo.WednesdayMassSchedule.Add(massDetails);
                                    break;

                                case 5:
                                    massDetails.Days = "Thursday";
                                    SimbahanInfo.ThursdayMassSchedule.Add(massDetails);
                                    break;

                                case 6:
                                    massDetails.Days = "Friday";
                                    SimbahanInfo.FridayMassSchedule.Add(massDetails);
                                    break;

                                case 7:
                                    massDetails.Days = "Saturday";
                                    SimbahanInfo.SaturdayMassSchedule.Add(massDetails);
                                    break;
                            }
                        }
                        SimbahanInfo.ChurchSchedules = Sched;

                        //// Church Reviews Processing...
                        dr.NextResult();
                        while (dr.Read())
                        {
                            var review = new ChurchReview();
                            review.Username = dr["Username"].ToString();
                            review.StarCount = Convert.ToDecimal(dr["StarCount"]);
                            review.Comments = dr["Comment"].ToString();

                            SimbahanInfo.ChurchReviews.Add(review);
                        }

                        // Church Parking Processing...
                        dr.NextResult();
                        while (dr.Read())
                        {
                            var parking = dr["ParkingType"].ToString().Split(separator, StringSplitOptions.None);
                            foreach (var strPark in parking)
                                Church_Parking.Add(new ParkingSlot {ParkingType = strPark});
                        }
                        SimbahanInfo.ChurchParking = Church_Parking;

                        // Church Photos Processing...
                        dr.NextResult();
                        while (dr.Read())
                        {
                            var photos = dr["ImagePath"].ToString().Split(separator, StringSplitOptions.None);
                            foreach (var strPix in photos)
                                Photos.Add(new ChurchPhotosModel {ChurchPhotos = strPix});
                        }
                        SimbahanInfo.ChurchPhotos = Photos;

                        // Church Announcement Processing...
                        dr.NextResult();
                        while (dr.Read())
                        {
                            var annoucement = new AnnoucementModel();
                            annoucement.ID = Convert.ToInt32(dr["AnnouncementID"]);
                            annoucement.Title = dr["TitleContent"].ToString();
                            annoucement.Description = dr["AnnouncementDesc"].ToString();
                            annoucement.ImagePath = dr["ImagePath"].ToString();
                            annoucement.Venue = dr["Address"].ToString();
                            annoucement.StartDate = Convert.ToDateTime(dr["StartDate"]);
                            annoucement.EndDate = Convert.ToDateTime(dr["EndDate"]);
                            annoucement.StartTime = dr["StartTime"].ToString();
                            annoucement.EndTime = dr["EndTime"].ToString();

                            SimbahanInfo.Announcements.Add(annoucement);
                        }

                        // Adoration Chapel Schedule Processing...
                        dr.NextResult();
                        while (dr.Read())
                            Adoration_Schedule.Add(new AdorationChapel
                            {
                                AdorationDay = dr["Days"].ToString(),
                                AdorationTime = dr["Time"].ToString(),
                                Open24Hours = dr["Open24Hours"].ToString()
                            });
                        SimbahanInfo.AdorationChapelSchedule = Adoration_Schedule;

                        // Church Type Processing...
                        dr.NextResult();
                        while (dr.Read())
                            SimbahanInfo.ChurchType = dr["ChurchType"].ToString();

                        // Location Type Processing...
                        dr.NextResult();
                        while (dr.Read())
                            SimbahanInfo.LocationType = dr["LocationType"].ToString();

                        // Baptism Details Processing...
                        dr.NextResult();
                        while (dr.Read())
                            SimbahanInfo.BaptismDetails = dr["Text"].ToString();

                        // Confession Details Processing...
                        dr.NextResult();
                        while (dr.Read())
                            Confess_Sched.Add(new ConfessionSchedule
                            {
                                Confess_Day = dr["ConfessDay"].ToString(),
                                Confess_Time = dr["ConfessTime"].ToString()
                            });
                        SimbahanInfo.ConfessionDetails = Confess_Sched;

                        // Wedding Details Processing...
                        dr.NextResult();
                        while (dr.Read())
                            SimbahanInfo.WeddingDetails = dr["Text"].ToString();

                        // Country Details Processing...
                        dr.NextResult();
                        while (dr.Read())
                            SimbahanInfo.Country = dr["Country"].ToString();

                        // Adoration Ventilation Processing...
                        dr.NextResult();
                        while (dr.Read())
                            SimbahanInfo.AdorationVentilations.Add(dr["VentType"].ToString());
                    }
                    catch (SqlException ex)
                    {
                        ex.Message.ToString();
                    }
                    finally
                    {
                        dbconn.Close();
                        dbconn.Dispose();
                    }
                }
            }

            return SimbahanInfo;
        }


        [WebMethod(EnableSession = true,
            Description = "Search churches with complete details (Mass schedules, location, etc.)")]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public List<ChurchInfo> Search_Churches(string Parish, string StateProvince, string ChurchTypeID,
            string ChurchLocationID,
            string HasAdorationChapel, string MassScheduleID, string MassTime, string MassLanguage,
            string AdorationTime, string AdorationScheduleID, string Ventilation, string Parking, string CountryID)
        {
            var SimbahanInfo = new ChurchInfo();
            var ListOfChurches = new List<ChurchInfo>();
            var Church_Reviews = new List<ChurchReview>();
            var Vent = new List<VentilationModel>();
            var Sched = new List<ChurchScheduleModel>();
            var UserReview = new List<ChurchReview>();
            var Photos = new List<ChurchPhotosModel>();
            var Confess = new List<ConfessionSchedule>();
            var Church_Parking = new List<ParkingSlot>();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spSearchChurches", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@parish", Parish);
                        cmd.Parameters.AddWithValue("@stateOrProvince", StateProvince);
                        cmd.Parameters.AddWithValue("@churchTypeID", ChurchTypeID);
                        cmd.Parameters.AddWithValue("@churchLocationID", ChurchLocationID);
                        cmd.Parameters.AddWithValue("@hasAdorationChapel", HasAdorationChapel);
                        cmd.Parameters.AddWithValue("@massScheduleID", MassScheduleID);
                        cmd.Parameters.AddWithValue("@massTime", MassTime);
                        cmd.Parameters.AddWithValue("@massLanguage", MassLanguage);
                        cmd.Parameters.AddWithValue("@adorationScheduleID", AdorationScheduleID);
                        cmd.Parameters.AddWithValue("@adorationTime", AdorationTime);
                        cmd.Parameters.AddWithValue("@ventilation", Ventilation);
                        cmd.Parameters.AddWithValue("@parking", Parking);
                        cmd.Parameters.AddWithValue("@countries", CountryID);

                        var dr = cmd.ExecuteReader();

                        while (dr.Read())
                        {
                            SimbahanInfo = new ChurchInfo();
                            Church_Reviews = new List<ChurchReview>();
                            Vent = new List<VentilationModel>();
                            Sched = new List<ChurchScheduleModel>();
                            UserReview = new List<ChurchReview>();
                            Photos = new List<ChurchPhotosModel>();
                            Confess = new List<ConfessionSchedule>();
                            Church_Parking = new List<ParkingSlot>();

                            SimbahanInfo.SimbahanID = Convert.ToInt32(dr["SimbahanID"]);
                            SimbahanInfo.StreetNo = Convert.IsDBNull(dr["StreetNo"])
                                ? null
                                : (int?) Convert.ToInt32(dr["StreetNo"]);
                            SimbahanInfo.StreetName = dr["StreetName"].ToString();
                            SimbahanInfo.Barangay = dr["Barangay"].ToString();
                            SimbahanInfo.City = dr["City"].ToString();
                            SimbahanInfo.StateProvince = dr["StateOrProvince"].ToString();
                            SimbahanInfo.ZipCode = dr["ZipCode"].ToString();
                            SimbahanInfo.Parish = dr["Parish"].ToString();
                            SimbahanInfo.Diocese = dr["Diocese"].ToString();
                            SimbahanInfo.Priest = dr["ParishPriest"].ToString();
                            SimbahanInfo.Vicariate = dr["Vicariate"].ToString();
                            SimbahanInfo.DateCreated = Convert.ToDateTime(dr["DateCreated"].ToString());
                            SimbahanInfo.LastUpdate = Convert.ToDateTime(dr["LastUpdate"].ToString());
                            SimbahanInfo.HasAdorationChapel = Convert.ToBoolean(dr["HasAdorationChapel"]);
                            SimbahanInfo.ChurchHistory = dr["ChurchHistory"].ToString();
                            SimbahanInfo.CompleteAddress = dr["CompleteAddress"].ToString();
                            SimbahanInfo.ChurchTypeID = Convert.IsDBNull(dr["ChurchTypeID"])
                                ? null
                                : (int?) Convert.ToInt32(dr["ChurchTypeID"]);
                            SimbahanInfo.Longitude = Convert.ToDouble(dr["Longitude"]);
                            SimbahanInfo.Latitude = Convert.ToDouble(dr["Latitude"]);
                            SimbahanInfo.ContactNo = dr["ContactNo"].ToString();
                            SimbahanInfo.Website = dr["Website"].ToString();
                            SimbahanInfo.EmailAddress = dr["EmailAddress"].ToString();
                            SimbahanInfo.DateEstablished = dr["DateEstablished"].ToString();
                            SimbahanInfo.FeastDay = dr["FeastDay"].ToString();
                            SimbahanInfo.LocationID = Convert.IsDBNull(dr["LocationID"])
                                ? null
                                : (int?) Convert.ToInt32(dr["LocationID"]);
                            SimbahanInfo.OfficeHours = dr["OfficeHours"].ToString();
                            SimbahanInfo.DevotionSchedule = dr["DevotionSchedule"].ToString();
                            SimbahanInfo.ChurchCode = dr["ChurchCode"].ToString();

                            // Ventilation Processing...
                            char[] separator = {','};
                            var ventilation = dr["Ventilations"].ToString().Split(separator, StringSplitOptions.None);
                            foreach (var strVent in ventilation)
                                Vent.Add(new VentilationModel {VentType = strVent});
                            SimbahanInfo.Ventilations = Vent;

                            // Mass Schedules Processing...
                            if (!Convert.IsDBNull(dr["MassSchedules"]))
                            {
                                var schedules = dr["MassSchedules"]
                                    .ToString()
                                    .Split(separator, StringSplitOptions.None);
                                foreach (var schedule in schedules)
                                {
                                    char[] pipeSeparator = {'|'};
                                    var massSchedule = schedule.Split(pipeSeparator, StringSplitOptions.None);

                                    var massDetail = new MassDetailsModel();
                                    massDetail.MassDetailID =
                                        massSchedule[0] == "" ? 0 : Convert.ToInt32(massSchedule[0]);
                                    massDetail.Language = massSchedule[2];
                                    massDetail.Time = massSchedule[3];
                                    massDetail.TimeStandardID =
                                        massSchedule[4] == "" ? 0 : Convert.ToInt32(massSchedule[4]);
                                    massDetail.DateCreated =
                                        massSchedule[5] == "" ? DateTime.Now : Convert.ToDateTime(massSchedule[5]);

                                    switch (Convert.ToInt32(massSchedule[1]))
                                    {
                                        case 1:
                                            massDetail.Days = "Sunday";
                                            massDetail.ScheduleID = 1;
                                            SimbahanInfo.SundayMassSchedule.Add(massDetail);
                                            break;

                                        case 2:
                                            massDetail.Days = "Monday";
                                            massDetail.ScheduleID = 2;
                                            SimbahanInfo.MondayMassSchedule.Add(massDetail);
                                            break;

                                        case 3:
                                            massDetail.Days = "Tuesday";
                                            massDetail.ScheduleID = 3;
                                            SimbahanInfo.TuesdayMassSchedule.Add(massDetail);
                                            break;

                                        case 4:
                                            massDetail.Days = "Wednesday";
                                            massDetail.ScheduleID = 4;
                                            SimbahanInfo.WednesdayMassSchedule.Add(massDetail);
                                            break;

                                        case 5:
                                            massDetail.Days = "Thursday";
                                            massDetail.ScheduleID = 5;
                                            SimbahanInfo.ThursdayMassSchedule.Add(massDetail);
                                            break;

                                        case 6:
                                            massDetail.Days = "Friday";
                                            massDetail.ScheduleID = 6;
                                            SimbahanInfo.FridayMassSchedule.Add(massDetail);
                                            break;

                                        case 7:
                                            massDetail.Days = "Saturday";
                                            massDetail.ScheduleID = 7;
                                            SimbahanInfo.SaturdayMassSchedule.Add(massDetail);
                                            break;
                                    }
                                }
                            }

                            switch (DateTime.Now.DayOfWeek)
                            {
                                case DayOfWeek.Sunday:
                                    SimbahanInfo.MassSchedules = SimbahanInfo.SundayMassSchedule;
                                    break;
                                case DayOfWeek.Monday:
                                    SimbahanInfo.MassSchedules = SimbahanInfo.MondayMassSchedule;
                                    break;
                                case DayOfWeek.Tuesday:
                                    SimbahanInfo.MassSchedules = SimbahanInfo.TuesdayMassSchedule;
                                    break;
                                case DayOfWeek.Wednesday:
                                    SimbahanInfo.MassSchedules = SimbahanInfo.WednesdayMassSchedule;
                                    break;
                                case DayOfWeek.Thursday:
                                    SimbahanInfo.MassSchedules = SimbahanInfo.ThursdayMassSchedule;
                                    break;
                                case DayOfWeek.Friday:
                                    SimbahanInfo.MassSchedules = SimbahanInfo.FridayMassSchedule;
                                    break;
                                case DayOfWeek.Saturday:
                                    SimbahanInfo.MassSchedules = SimbahanInfo.SaturdayMassSchedule;
                                    break;
                            }


                            // Church Reviews Processing...
                            var review = dr["Reviews"].ToString().Split(separator, StringSplitOptions.None);
                            foreach (var strRev in review)
                                UserReview.Add(new ChurchReview
                                {
                                    Comments = strRev
                                });
                            SimbahanInfo.ChurchReviews = UserReview;

                            // Church Photos Processing...
                            var photos = dr["ChurchPhotos"].ToString().Split(separator, StringSplitOptions.None);
                            foreach (var strPix in photos)
                                Photos.Add(new ChurchPhotosModel
                                {
                                    ChurchPhotos = strPix == string.Empty ? "" : @"Images\Photos\" + strPix
                                });
                            SimbahanInfo.ChurchPhotos = Photos;

                            // Baptism
                            SimbahanInfo.BaptismDetails = dr["BaptismSched"].ToString();

                            // Confession
                            char[] splitter = {',', '|'};
                            var confession = dr["ConfessionSched"].ToString().Split(splitter, StringSplitOptions.None);

                            if (confession.Length > 1)
                            {
                                int i = 0, j = 1;
                                for (; i < confession.Length;)
                                {
                                    Confess.Add(new ConfessionSchedule
                                    {
                                        Confess_Day = confession[i],
                                        Confess_Time = confession[j]
                                    });
                                    i = i + 2;
                                    j = j + 2;
                                }
                            }
                            SimbahanInfo.ConfessionDetails = Confess;

                            // Wedding
                            SimbahanInfo.WeddingDetails = dr["WeddingSched"].ToString();

                            // Parking
                            var parking = dr["ParkingSlot"].ToString().Split(separator, StringSplitOptions.None);
                            foreach (var strPark in parking)
                                Church_Parking.Add(new ParkingSlot {ParkingType = strPark});
                            SimbahanInfo.ChurchParking = Church_Parking;

                            ListOfChurches.Add(SimbahanInfo);
                        }
                    }
                    catch (Exception ex)
                    {
                        throw new Exception(ex.Message);
                    }
                    finally
                    {
                        dbconn.Close();
                        dbconn.Dispose();
                    }
                }
            }

            return ListOfChurches;
        }


        [WebMethod(EnableSession = true, Description = "Quick search criteria for church locator.")]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public List<ChurchInfo> Simbahan_Quick_Search(string Keyword, string Location)
        {
            var SimbahanQuickSearch = new ChurchInfo();
            SimbahanQuickSearch.Parish = Keyword;
            SimbahanQuickSearch.City = Location;

            var QuickSearchList = new List<ChurchInfo>();

            ////// INSERT DATA INTO TABLE ////// By: Ronald Alba
            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spQuickSearch", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@Keyword", SimbahanQuickSearch.Parish);
                        cmd.Parameters.AddWithValue("@Location", SimbahanQuickSearch.City);

                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            SimbahanQuickSearch = new ChurchInfo();

                            SimbahanQuickSearch.SimbahanID = Convert.ToInt32(reader["SimbahanID"]);
                            SimbahanQuickSearch.StreetNo = Convert.IsDBNull(reader["StreetNo"])
                                ? null
                                : (int?) Convert.ToInt32(reader["StreetNo"]);
                            SimbahanQuickSearch.StreetName = reader["StreetName"].ToString();
                            SimbahanQuickSearch.Barangay = reader["Barangay"].ToString();
                            SimbahanQuickSearch.City = reader["City"].ToString();
                            SimbahanQuickSearch.StateProvince = reader["StateOrProvince"].ToString();
                            SimbahanQuickSearch.ZipCode = reader["ZipCode"].ToString();
                            SimbahanQuickSearch.Parish = reader["Parish"].ToString();
                            SimbahanQuickSearch.Diocese = reader["Diocese"].ToString();
                            SimbahanQuickSearch.Priest = reader["ParishPriest"].ToString();
                            SimbahanQuickSearch.Vicariate = reader["Vicariate"].ToString();
                            SimbahanQuickSearch.DateCreated = (DateTime) reader["DateCreated"];
                            SimbahanQuickSearch.LastUpdate = (DateTime) reader["LastUpdate"];
                            SimbahanQuickSearch.HasAdorationChapel =
                                Convert.ToBoolean(reader["HasAdorationChapel"].ToString());
                            SimbahanQuickSearch.ChurchHistory = reader["ChurchHistory"].ToString();
                            SimbahanQuickSearch.CompleteAddress = reader["CompleteAddress"].ToString();
                            SimbahanQuickSearch.ChurchTypeID = Convert.IsDBNull(reader["ChurchTypeID"])
                                ? null
                                : (int?) Convert.ToInt32(reader["ChurchTypeID"]);
                            SimbahanQuickSearch.Longitude = Convert.ToDouble(reader["Longitude"].ToString());
                            SimbahanQuickSearch.Latitude = Convert.ToDouble(reader["Latitude"].ToString());
                            SimbahanQuickSearch.ContactNo = reader["ContactNo"].ToString();
                            SimbahanQuickSearch.Website = reader["Website"].ToString();
                            SimbahanQuickSearch.EmailAddress = reader["EmailAddress"].ToString();
                            SimbahanQuickSearch.DateEstablished = reader["DateEstablished"].ToString();
                            SimbahanQuickSearch.FeastDay = reader["FeastDay"].ToString();
                            SimbahanQuickSearch.LocationID = Convert.IsDBNull(reader["LocationID"])
                                ? null
                                : (int?) Convert.ToInt32(reader["LocationID"]);
                            SimbahanQuickSearch.OfficeHours = reader["OfficeHours"].ToString();
                            SimbahanQuickSearch.DevotionSchedule = reader["DevotionSchedule"].ToString();

                            QuickSearchList.Add(SimbahanQuickSearch);
                        }
                    }
                    catch (Exception ex)
                    {
                        throw new Exception(ex.Message);
                    }
                    finally
                    {
                        dbconn.Close();
                        dbconn.Dispose();
                    }
                }
            }

            return QuickSearchList;
        }

        // DECRYPTION TYPE  : AES
        // Added By         : Ronald Alba
        [WebMethod(EnableSession = true, Description = "Encrypt string using AES method.")]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public string Encrypt(string Your_Text)
        {
            var EncryptionKey = "MAKV2SPBNI99212";
            var clearBytes = Encoding.Unicode.GetBytes(Your_Text);
            using (var encryptor = Aes.Create())
            {
                var pdb = new Rfc2898DeriveBytes(EncryptionKey,
                    new byte[] {0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76});
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (var ms = new MemoryStream())
                {
                    using (var cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(clearBytes, 0, clearBytes.Length);
                        cs.Close();
                    }
                    Your_Text = Convert.ToBase64String(ms.ToArray());
                }
            }
            return Your_Text;
        }

        // DECRYPTION TYPE  : AES
        // Added By         : Ronald Alba
        [WebMethod(EnableSession = true, Description = "Decrypt string using AES method.")]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public string Decrypt(string Your_CipherText)
        {
            var EncryptionKey = "MAKV2SPBNI99212";
            var cipherBytes = Convert.FromBase64String(Your_CipherText);
            using (var encryptor = Aes.Create())
            {
                var pdb = new Rfc2898DeriveBytes(EncryptionKey,
                    new byte[] {0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76});
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (var ms = new MemoryStream())
                {
                    using (var cs = new CryptoStream(ms, encryptor.CreateDecryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(cipherBytes, 0, cipherBytes.Length);
                        cs.Close();
                    }
                    Your_CipherText = Encoding.Unicode.GetString(ms.ToArray());
                }
            }
            return Your_CipherText;
        }


        [WebMethod(EnableSession = true, Description = "Get Daily Gospel.")]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public DailyGospelModel Get_Daily_Gospel(DateTime dateOfGospel)
        {
            var dailyGospel = new DailyGospelModel();

            ////// INSERT DATA INTO TABLE ////// By: Ronald Alba
            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spGetDailyGospel", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@dateofGospel", dateOfGospel);

                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            dailyGospel = new DailyGospelModel();

                            dailyGospel.Source = reader["Source"].ToString();
                            dailyGospel.DateOfGospel = Convert.ToDateTime(reader["DateOfGospel"].ToString());
                            dailyGospel.FirstReadingTitle = reader["FirstReadingTitle"].ToString();
                            dailyGospel.FirstReadingContent = reader["FirstReadingContent"].ToString();
                            dailyGospel.ResponsorialPsalmTitle = reader["ResponsorialPsalmTitle"].ToString();
                            dailyGospel.ResponsorialPsalmContent = reader["ResponsorialPsalmContent"].ToString();
                            dailyGospel.SecondReadingTitle = reader["SecondReadingTitle"].ToString();
                            dailyGospel.SecondReadingContent = reader["SecondReadingContent"].ToString();
                            dailyGospel.VerseBeforeGospelTitle = reader["VerseBeforeGospelTitle"].ToString();
                            dailyGospel.VerseBeforeGospelContent = reader["VerseBeforeGospelContent"].ToString();
                            dailyGospel.GospelTitle = reader["GospelTitle"].ToString();
                            dailyGospel.GospelContent = reader["GospelContent"].ToString();
                        }
                    }
                    catch (Exception ex)
                    {
                        throw new Exception(ex.Message);
                    }
                    finally
                    {
                        dbconn.Close();
                        dbconn.Dispose();
                    }
                }
            }

            return dailyGospel;
        }

        [WebMethod(EnableSession = true, Description = "Get Daily Reflection.")]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public DailyReflectionModel Get_Daily_Reflection(DateTime dateOfReflection)
        {
            var dailyReflection = new DailyReflectionModel();

            ////// INSERT DATA INTO TABLE ////// By: Ronald Alba
            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spGetDailyReflection", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@dateofReflection", dateOfReflection);

                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            dailyReflection = new DailyReflectionModel();

                            dailyReflection.Source = reader["Source"].ToString();
                            dailyReflection.DateOfReflection =
                                Convert.ToDateTime(reader["DateOfReflection"].ToString());
                            dailyReflection.FirstContentTitle = reader["FirstContentTitle"].ToString();
                            dailyReflection.FirstContent = reader["FirstContent"].ToString();
                            dailyReflection.SecondContentTitle = reader["SecondContentTitle"].ToString();
                            dailyReflection.SecondContent = reader["SecondContent"].ToString();
                            dailyReflection.ThirdContentTitle = reader["ThirdContentTitle"].ToString();
                            dailyReflection.ThirdContent = reader["ThirdContent"].ToString();
                            dailyReflection.FourthContentTitle = reader["FourthContentTitle"].ToString();
                            dailyReflection.FourthContent = reader["FourthContent"].ToString();
                            dailyReflection.FifthContentTitle = reader["FifthContentTitle"].ToString();
                            dailyReflection.FifthContent = reader["FifthContent"].ToString();
                            dailyReflection.SixthContentTitle = reader["SixthContentTitle"].ToString();
                            dailyReflection.SixthContent = reader["SixthContent"].ToString();
                            dailyReflection.Prayer = reader["Prayer"].ToString();
                        }
                    }
                    catch (Exception ex)
                    {
                        throw new Exception(ex.Message);
                    }
                    finally
                    {
                        dbconn.Close();
                        dbconn.Dispose();
                    }
                }
            }

            return dailyReflection;
        }

        [WebMethod(EnableSession = true, Description = "Get Religious Quotes By Mood.")]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public List<ReligiousQuotesModel> Get_Religious_Quotes(string Mood)
        {
            var ReligiousQuote = new List<ReligiousQuotesModel>();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spGetReligiousQuote", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@moods", Mood);

                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                            ReligiousQuote.Add(new ReligiousQuotesModel
                            {
                                ReligiousQuoteID = Convert.ToInt32(reader["ReligiousQuoteID"]),
                                DateOfQuote = Convert.ToDateTime(reader["DateOfQuote"]),
                                RQCode = reader["RQCode"].ToString(),
                                EmotionsReactions = reader["EmotionsReactions"].ToString(),
                                Author = reader["Author"].ToString(),
                                Quote = reader["Quote"].ToString(),
                                DisplayListForMobile = reader["DisplayListForMobile"].ToString()
                            });
                    }
                    catch (Exception ex)
                    {
                        throw new Exception(ex.Message);
                    }
                    finally
                    {
                        dbconn.Close();
                        dbconn.Dispose();
                    }
                }
            }

            return ReligiousQuote;
        }


        [WebMethod(EnableSession = true, Description = "Get Daily Religious Quote By Date.")]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public ReligiousQuotesModel Get_Daily_Religious_Quote(DateTime DateOfQuote)
        {
            var ReligiousQuote = new ReligiousQuotesModel();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spGetDailyReligiousQuote", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@dateofQuote", DateOfQuote);

                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            ReligiousQuote.ReligiousQuoteID = Convert.ToInt32(reader["ReligiousQuoteID"]);
                            ReligiousQuote.DateOfQuote = Convert.ToDateTime(reader["DateOfQuote"]);
                            ReligiousQuote.RQCode = reader["RQCode"].ToString();
                            ReligiousQuote.EmotionsReactions = reader["EmotionsReactions"].ToString();
                            ReligiousQuote.Author = reader["Author"].ToString();
                            ReligiousQuote.Quote = reader["Quote"].ToString();
                            ReligiousQuote.DisplayListForMobile = reader["DisplayListForMobile"].ToString();
                        }
                    }
                    catch (Exception ex)
                    {
                        throw new Exception(ex.Message);
                    }
                    finally
                    {
                        dbconn.Close();
                        dbconn.Dispose();
                    }
                }
            }

            return ReligiousQuote;
        }

        [WebMethod(EnableSession = true, Description = "Get Nearby Churches (For Visita Iglesia).")]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public List<ChurchInfo> GetNearByChurches(double Longitude, double Latitude)
        {
            var SimbahanInfo = new ChurchInfo();
            var ListOfChurches = new List<ChurchInfo>();
            var Church_Reviews = new List<ChurchReview>();
            var Vent = new List<VentilationModel>();
            var Sched = new List<ChurchScheduleModel>();
            var UserReview = new List<ChurchReview>();
            var Photos = new List<ChurchPhotosModel>();
            var Confess = new List<ConfessionSchedule>();
            var Church_Parking = new List<ParkingSlot>();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spGetChurchesNearby", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@latitude", Latitude);
                        cmd.Parameters.AddWithValue("@longitude", Longitude);

                        var dr = cmd.ExecuteReader();

                        while (dr.Read())
                        {
                            SimbahanInfo = new ChurchInfo();
                            Church_Reviews = new List<ChurchReview>();
                            Vent = new List<VentilationModel>();
                            Sched = new List<ChurchScheduleModel>();
                            UserReview = new List<ChurchReview>();
                            Photos = new List<ChurchPhotosModel>();
                            Confess = new List<ConfessionSchedule>();
                            Church_Parking = new List<ParkingSlot>();

                            SimbahanInfo.SimbahanID = Convert.ToInt32(dr["SimbahanID"]);
                            SimbahanInfo.StreetNo = Convert.IsDBNull(dr["StreetNo"])
                                ? null
                                : (int?) Convert.ToInt32(dr["StreetNo"]);
                            SimbahanInfo.StreetName = dr["StreetName"].ToString();
                            SimbahanInfo.Barangay = dr["Barangay"].ToString();
                            SimbahanInfo.City = dr["City"].ToString();
                            SimbahanInfo.StateProvince = dr["StateOrProvince"].ToString();
                            SimbahanInfo.ZipCode = dr["ZipCode"].ToString();
                            SimbahanInfo.Parish = dr["Parish"].ToString();
                            SimbahanInfo.Diocese = dr["Diocese"].ToString();
                            SimbahanInfo.Priest = dr["ParishPriest"].ToString();
                            SimbahanInfo.Vicariate = dr["Vicariate"].ToString();
                            SimbahanInfo.DateCreated = Convert.ToDateTime(dr["DateCreated"].ToString());
                            SimbahanInfo.LastUpdate = Convert.ToDateTime(dr["LastUpdate"].ToString());
                            SimbahanInfo.HasAdorationChapel = Convert.ToBoolean(dr["HasAdorationChapel"]);
                            SimbahanInfo.ChurchHistory = dr["ChurchHistory"].ToString();
                            SimbahanInfo.CompleteAddress = dr["CompleteAddress"].ToString();
                            SimbahanInfo.ChurchTypeID = Convert.IsDBNull(dr["ChurchTypeID"])
                                ? null
                                : (int?) Convert.ToInt32(dr["ChurchTypeID"]);
                            SimbahanInfo.Longitude = Convert.ToDouble(dr["Longitude"]);
                            SimbahanInfo.Latitude = Convert.ToDouble(dr["Latitude"]);
                            SimbahanInfo.ContactNo = dr["ContactNo"].ToString();
                            SimbahanInfo.Website = dr["Website"].ToString();
                            SimbahanInfo.EmailAddress = dr["EmailAddress"].ToString();
                            SimbahanInfo.DateEstablished = dr["DateEstablished"].ToString();
                            SimbahanInfo.FeastDay = dr["FeastDay"].ToString();
                            SimbahanInfo.LocationID = Convert.IsDBNull(dr["LocationID"])
                                ? null
                                : (int?) Convert.ToInt32(dr["LocationID"]);
                            SimbahanInfo.OfficeHours = dr["OfficeHours"].ToString();
                            SimbahanInfo.DevotionSchedule = dr["DevotionSchedule"].ToString();
                            SimbahanInfo.ChurchCode = dr["ChurchCode"].ToString();

                            // Ventilation Processing...
                            char[] separator = {','};
                            var ventilation = dr["Ventilations"].ToString().Split(separator, StringSplitOptions.None);
                            foreach (var strVent in ventilation)
                                Vent.Add(new VentilationModel {VentType = strVent});
                            SimbahanInfo.Ventilations = Vent;

                            // Mass Schedules Processing...
                            if (!Convert.IsDBNull(dr["MassSchedules"]))
                            {
                                var schedules = dr["MassSchedules"]
                                    .ToString()
                                    .Split(separator, StringSplitOptions.None);
                                foreach (var schedule in schedules)
                                {
                                    char[] pipeSeparator = {'|'};
                                    var massSchedule = schedule.Split(pipeSeparator, StringSplitOptions.None);

                                    var massDetail = new MassDetailsModel();
                                    massDetail.MassDetailID =
                                        massSchedule[0] == "" ? 0 : Convert.ToInt32(massSchedule[0]);
                                    massDetail.Language = massSchedule[2];
                                    massDetail.Time = massSchedule[3];
                                    massDetail.TimeStandardID =
                                        massSchedule[4] == "" ? 0 : Convert.ToInt32(massSchedule[4]);
                                    massDetail.DateCreated =
                                        massSchedule[5] == "" ? DateTime.Now : Convert.ToDateTime(massSchedule[5]);

                                    switch (Convert.ToInt32(massSchedule[1]))
                                    {
                                        case 1:
                                            massDetail.Days = "Sunday";
                                            massDetail.ScheduleID = 1;
                                            SimbahanInfo.SundayMassSchedule.Add(massDetail);
                                            break;

                                        case 2:
                                            massDetail.Days = "Monday";
                                            massDetail.ScheduleID = 2;
                                            SimbahanInfo.MondayMassSchedule.Add(massDetail);
                                            break;

                                        case 3:
                                            massDetail.Days = "Tuesday";
                                            massDetail.ScheduleID = 3;
                                            SimbahanInfo.TuesdayMassSchedule.Add(massDetail);
                                            break;

                                        case 4:
                                            massDetail.Days = "Wednesday";
                                            massDetail.ScheduleID = 4;
                                            SimbahanInfo.WednesdayMassSchedule.Add(massDetail);
                                            break;

                                        case 5:
                                            massDetail.Days = "Thursday";
                                            massDetail.ScheduleID = 5;
                                            SimbahanInfo.ThursdayMassSchedule.Add(massDetail);
                                            break;

                                        case 6:
                                            massDetail.Days = "Friday";
                                            massDetail.ScheduleID = 6;
                                            SimbahanInfo.FridayMassSchedule.Add(massDetail);
                                            break;

                                        case 7:
                                            massDetail.Days = "Saturday";
                                            massDetail.ScheduleID = 7;
                                            SimbahanInfo.SaturdayMassSchedule.Add(massDetail);
                                            break;
                                    }
                                }
                            }

                            switch (DateTime.Now.DayOfWeek)
                            {
                                case DayOfWeek.Sunday:
                                    SimbahanInfo.MassSchedules = SimbahanInfo.SundayMassSchedule;
                                    break;
                                case DayOfWeek.Monday:
                                    SimbahanInfo.MassSchedules = SimbahanInfo.MondayMassSchedule;
                                    break;
                                case DayOfWeek.Tuesday:
                                    SimbahanInfo.MassSchedules = SimbahanInfo.TuesdayMassSchedule;
                                    break;
                                case DayOfWeek.Wednesday:
                                    SimbahanInfo.MassSchedules = SimbahanInfo.WednesdayMassSchedule;
                                    break;
                                case DayOfWeek.Thursday:
                                    SimbahanInfo.MassSchedules = SimbahanInfo.ThursdayMassSchedule;
                                    break;
                                case DayOfWeek.Friday:
                                    SimbahanInfo.MassSchedules = SimbahanInfo.FridayMassSchedule;
                                    break;
                                case DayOfWeek.Saturday:
                                    SimbahanInfo.MassSchedules = SimbahanInfo.SaturdayMassSchedule;
                                    break;
                            }


                            // Church Reviews Processing...
                            var review = dr["Reviews"].ToString().Split(separator, StringSplitOptions.None);
                            foreach (var strRev in review)
                                UserReview.Add(new ChurchReview
                                {
                                    Comments = strRev
                                });
                            SimbahanInfo.ChurchReviews = UserReview;

                            // Church Photos Processing...
                            var photos = dr["ChurchPhotos"].ToString().Split(separator, StringSplitOptions.None);
                            foreach (var strPix in photos)
                                Photos.Add(new ChurchPhotosModel
                                {
                                    ChurchPhotos = strPix == string.Empty
                                        ? ""
                                        : "http://www.mycatholicportal.org/images/photos/" + strPix
                                });
                            SimbahanInfo.ChurchPhotos = Photos;

                            // Baptism
                            SimbahanInfo.BaptismDetails = dr["BaptismSched"].ToString();

                            // Confession
                            char[] splitter = {',', '|'};
                            var confession = dr["ConfessionSched"].ToString().Split(splitter, StringSplitOptions.None);

                            if (confession.Length > 1)
                            {
                                int i = 0, j = 1;
                                for (; i < confession.Length;)
                                {
                                    Confess.Add(new ConfessionSchedule
                                    {
                                        Confess_Day = confession[i],
                                        Confess_Time = confession[j]
                                    });
                                    i = i + 2;
                                    j = j + 2;
                                }
                            }
                            SimbahanInfo.ConfessionDetails = Confess;

                            // Wedding
                            SimbahanInfo.WeddingDetails = dr["WeddingSched"].ToString();

                            // Parking
                            var parking = dr["ParkingSlot"].ToString().Split(separator, StringSplitOptions.None);
                            foreach (var strPark in parking)
                                Church_Parking.Add(new ParkingSlot {ParkingType = strPark});
                            SimbahanInfo.ChurchParking = Church_Parking;

                            ListOfChurches.Add(SimbahanInfo);
                        }
                    }
                    catch (Exception ex)
                    {
                        throw new Exception(ex.Message);
                    }
                    finally
                    {
                        dbconn.Close();
                        dbconn.Dispose();
                    }
                }
            }

            return ListOfChurches;
        }

        [WebMethod(EnableSession = true, Description = "Search Adoration Chapel.")]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public List<Adoration> Search_Adoration_Chapel(string Keyword, string Location, string Day, string Time,
            string ChapelLocation, string Ventilation)
        {
            var adorations = new List<Adoration>();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spSearchAdorations", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@keyword", Keyword);
                        cmd.Parameters.AddWithValue("@location", Location);
                        cmd.Parameters.AddWithValue("@scheduleTime", Time);
                        cmd.Parameters.AddWithValue("@scheduleDay", Day);
                        cmd.Parameters.AddWithValue("@chapelLocation", ChapelLocation);
                        cmd.Parameters.AddWithValue("@ventilation", Ventilation);

                        var dr = cmd.ExecuteReader();

                        while (dr.Read())
                        {
                            var adoration = new Adoration();

                            adoration.AdorationID = Convert.ToInt32(dr["AdorationID"]);
                            adoration.SimbahanID = Convert.ToInt32(dr["SimbahanID"]);
                            adoration.Is247 = Convert.ToBoolean(dr["IsOpen24By7"]);

                            char[] separator = {','};
                            char[] pipeSeparator = {'|'};

                            var ventilations = dr["Ventilations"].ToString().Split(separator, StringSplitOptions.None);

                            foreach (var ventilation in ventilations)
                                adoration.Ventilations.Add(ventilation);

                            var photos = dr["AdorationPhotos"].ToString().Split(separator, StringSplitOptions.None);
                            foreach (var strPix in photos)
                                adoration.Images.Add(strPix == string.Empty ? "" : @"Images\Photos\" + strPix);

                            var masses = dr["Masses"].ToString().Split(separator, StringSplitOptions.None);

                            foreach (var massDB in masses)
                            {
                                var massDetail = massDB.Split(pipeSeparator, StringSplitOptions.None);

                                var mass = new MassDetailsModel();
                                mass.ScheduleID = Convert.ToInt32(massDetail[2]);
                                mass.Time = massDetail[3];
                                mass.TimeStandardID = Convert.ToInt32(massDetail[4]);

                                switch (Convert.ToInt32(massDetail[2]))
                                {
                                    case 1:
                                        mass.Days = "Sunday";
                                        adoration.SundaySchedule.Add(mass);
                                        break;
                                    case 2:
                                        mass.Days = "Monday";
                                        adoration.MondaySchedule.Add(mass);
                                        break;
                                    case 3:
                                        mass.Days = "Tuesday";
                                        adoration.TuesdaySchedule.Add(mass);
                                        break;
                                    case 4:
                                        mass.Days = "Wednesday";
                                        adoration.WednesdaySchedule.Add(mass);
                                        break;
                                    case 5:
                                        mass.Days = "Thursday";
                                        adoration.ThursdaySchedule.Add(mass);
                                        break;
                                    case 6:
                                        mass.Days = "Friday";
                                        adoration.FridaySchedule.Add(mass);
                                        break;
                                    case 7:
                                        mass.Days = "Saturday";
                                        adoration.SaturdaySchedule.Add(mass);
                                        break;
                                }
                            }

                            adoration.Church = new ChurchInfo();

                            adoration.Church.SimbahanID = Convert.ToInt32(dr["SimbahanID"]);
                            adoration.Church.StreetNo = Convert.IsDBNull(dr["StreetNo"])
                                ? null
                                : (int?) Convert.ToInt32(dr["StreetNo"]);
                            adoration.Church.StreetName = dr["StreetName"].ToString();
                            adoration.Church.Barangay = dr["Barangay"].ToString();
                            adoration.Church.City = dr["City"].ToString();
                            adoration.Church.StateProvince = dr["StateOrProvince"].ToString();
                            adoration.Church.ZipCode = dr["ZipCode"].ToString();
                            adoration.Church.Parish = dr["Parish"].ToString();
                            adoration.Church.Diocese = dr["Diocese"].ToString();
                            adoration.Church.Priest = dr["ParishPriest"].ToString();
                            adoration.Church.Vicariate = dr["Vicariate"].ToString();
                            adoration.Church.DateCreated = Convert.ToDateTime(dr["DateCreated"].ToString());
                            adoration.Church.LastUpdate = Convert.ToDateTime(dr["LastUpdate"].ToString());
                            adoration.Church.HasAdorationChapel =
                                Convert.ToBoolean(dr["HasAdorationChapel"].ToString());
                            adoration.Church.ChurchHistory = dr["ChurchHistory"].ToString();
                            adoration.Church.CompleteAddress = dr["CompleteAddress"].ToString();
                            adoration.Church.ChurchTypeID = Convert.IsDBNull(dr["ChurchTypeID"])
                                ? 0
                                : Convert.ToInt32(dr["ChurchTypeID"]);
                            adoration.Church.Longitude = Convert.ToDouble(dr["Longitude"].ToString());
                            adoration.Church.Latitude = Convert.ToDouble(dr["Latitude"].ToString());
                            adoration.Church.ContactNo = dr["ContactNo"].ToString();
                            adoration.Church.Website = dr["Website"].ToString();
                            adoration.Church.EmailAddress = dr["EmailAddress"].ToString();
                            adoration.Church.DateEstablished = dr["DateEstablished"].ToString();
                            adoration.Church.FeastDay = dr["FeastDay"].ToString();
                            adoration.Church.LocationID = Convert.IsDBNull(dr["LocationID"])
                                ? 0
                                : Convert.ToInt32(dr["LocationID"]);
                            adoration.Church.OfficeHours = dr["OfficeHours"].ToString();
                            adoration.Church.DevotionSchedule = dr["DevotionSchedule"].ToString();

                            adorations.Add(adoration);
                        }
                    }
                    catch (Exception)
                    {
                        // Ignored
                    }
                }
            }

            return adorations;
        }
    }
}
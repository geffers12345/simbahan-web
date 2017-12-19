using SimbahanApp.Models;
using SimbahanApp.Transformers;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SimbahanApp
{
    public partial class OrganizationAddListing : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static void InsertOrganization(string name, string address, string streetNo,
            string streetName, string barangay, string city,
            string province, string country, string dateEstablished, string parentorg,
            string feastBuilder, string branch, string contact, string email,
            string website, string retreat, string recollect, string talks,
            string camp, string volunteer, float latitude, float longitude,
            string about)
        {
            ChurchTransformer churchTransformer = new ChurchTransformer();
            ChurchInfo org = new ChurchInfo();

            using (SqlConnection dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                {
                    dbconn.Close();
                }
                dbconn.Open();

                using (SqlCommand cmd = new SqlCommand("[spInsertCatholicOrganization]", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.AddWithValue("@OrgName", name);
                        cmd.Parameters.AddWithValue("@LastUpdate", DateTime.UtcNow);
                        cmd.Parameters.AddWithValue("@CompleteAddress", address);
                        cmd.Parameters.AddWithValue("@StreetNo", streetNo);
                        cmd.Parameters.AddWithValue("@StreetName", streetName);
                        cmd.Parameters.AddWithValue("@Barangay", barangay);
                        cmd.Parameters.AddWithValue("@CityOrMunicipality", city);
                        cmd.Parameters.AddWithValue("@StateOrProvince", province);
                        cmd.Parameters.AddWithValue("@Country", country);
                        cmd.Parameters.AddWithValue("@DateEstablished", dateEstablished);
                        cmd.Parameters.AddWithValue("@ParentOrganization", parentorg);
                        cmd.Parameters.AddWithValue("@FeastBuilderOrPreacher", feastBuilder);
                        cmd.Parameters.AddWithValue("@BranchOrLocation", branch);
                        cmd.Parameters.AddWithValue("@ContactNo", contact);
                        cmd.Parameters.AddWithValue("@EmailAddress", email);
                        cmd.Parameters.AddWithValue("@Website", website);
                        cmd.Parameters.AddWithValue("@RetreatSchedule", retreat);
                        cmd.Parameters.AddWithValue("@RecollectSchedule", recollect);
                        cmd.Parameters.AddWithValue("@TalkSchedule", talks);
                        cmd.Parameters.AddWithValue("@CampSchedule", camp);
                        cmd.Parameters.AddWithValue("@VolunteerSchedule", volunteer);
                        cmd.Parameters.AddWithValue("@Latitude", latitude);
                        cmd.Parameters.AddWithValue("@Longitude", longitude);
                        cmd.Parameters.AddWithValue("@About", about);
                        cmd.Parameters.Add("@CatholicOrgAutoId", SqlDbType.BigInt).Direction = ParameterDirection.Output;

                        var reader = cmd.ExecuteReader();

                        HttpContext.Current.Session["orgID"] = Convert.ToInt32(cmd.Parameters["@CatholicOrgAutoId"].Value.ToString());
                        org.SimbahanID = Convert.ToInt32(HttpContext.Current.Session["orgID"]);
                        
                        while (reader.Read())
                        {
                            org = churchTransformer.Transform(reader);
                        }
                    }
                    catch (Exception ex)
                    {
                        throw new Exception(ex.Message.ToString());

                    }
                }
            }
        }

        [WebMethod]
        public static void InsertVentilation(int id)
        {
            using (SqlConnection dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                {
                    dbconn.Close();
                }
                dbconn.Open();

                using (SqlCommand cmd = new SqlCommand("insert into [tblOrganizationVentilation] values(@orgID, @ventID)", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.Text;

                        cmd.Parameters.AddWithValue("@orgID", HttpContext.Current.Session["orgID"]);
                        cmd.Parameters.AddWithValue("@ventId", id);
                        cmd.ExecuteNonQuery();
                    }
                    catch (Exception ex)
                    {
                        throw new Exception(ex.Message.ToString());

                    }
                }
            }
        }

        [WebMethod]
        public static void InsertVenue(int id)
        {
            using (SqlConnection dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                {
                    dbconn.Close();
                }
                dbconn.Open();

                using (SqlCommand cmd = new SqlCommand("insert into [tblOrgLocation] values(@orgID, @venueId)", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.Text;

                        cmd.Parameters.AddWithValue("@orgID", HttpContext.Current.Session["orgID"]);
                        cmd.Parameters.AddWithValue("@venueId", id);
                        cmd.ExecuteNonQuery();
                    }
                    catch (Exception ex)
                    {
                        throw new Exception(ex.Message.ToString());

                    }
                }
            }
        }

        [WebMethod]
        public static void InsertParking(int id)
        {
            using (SqlConnection dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                {
                    dbconn.Close();
                }
                dbconn.Open();

                using (SqlCommand cmd = new SqlCommand("insert into [tblOrganizationParking] values(@orgID, @parkID)", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.Text;

                        cmd.Parameters.AddWithValue("@orgID", HttpContext.Current.Session["orgID"]);
                        cmd.Parameters.AddWithValue("@parkID", id);
                        cmd.ExecuteNonQuery();
                    }
                    catch (Exception ex)
                    {
                        throw new Exception(ex.Message.ToString());

                    }
                }
            }
        }

        [WebMethod]
        public static void InsertActivity(int id)
        {
            using (SqlConnection dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                {
                    dbconn.Close();
                }
                dbconn.Open();

                using (SqlCommand cmd = new SqlCommand("insert into [tblOrganizationActivities] values(@orgID, @actID)", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.Text;

                        cmd.Parameters.AddWithValue("@orgID", HttpContext.Current.Session["orgID"]);
                        cmd.Parameters.AddWithValue("@actID", id);
                        cmd.ExecuteNonQuery();
                    }
                    catch (Exception ex)
                    {
                        throw new Exception(ex.Message.ToString());

                    }
                }
            }
        }

        [WebMethod]
        public static void InsertAttendees(int id)
        {
            using (SqlConnection dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                {
                    dbconn.Close();
                }
                dbconn.Open();

                using (SqlCommand cmd = new SqlCommand("insert into [tblOrganizationAttendees] values(@orgID, @attID)", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.Text;

                        cmd.Parameters.AddWithValue("@orgID", HttpContext.Current.Session["orgID"]);
                        cmd.Parameters.AddWithValue("@attID", id);
                        cmd.ExecuteNonQuery();
                    }
                    catch (Exception ex)
                    {
                        throw new Exception(ex.Message.ToString());

                    }
                }
            }
        }

        [WebMethod]
        public static void insertWorship(string FromDate, string ToDate, int ScheduleID, int TimeStandard)
        {
            using (SqlConnection dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                {
                    dbconn.Close();
                }
                dbconn.Open();

                var time = FromDate + " - " + ToDate;

                using (SqlCommand cmd = new SqlCommand("insert into [tblWorshipSchedules] values(@orgID, @schedID, @tsID, @time)", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.Text;

                        cmd.Parameters.AddWithValue("@orgID", HttpContext.Current.Session["orgID"]);
                        cmd.Parameters.AddWithValue("@schedID", ScheduleID);
                        cmd.Parameters.AddWithValue("@tsID", TimeStandard);
                        cmd.Parameters.AddWithValue("@time", time);
                        cmd.ExecuteNonQuery();
                    }
                    catch (Exception ex)
                    {
                        throw new Exception(ex.Message.ToString());

                    }
                }
            }
        }

        [WebMethod]
        public static void insertMass(string FromDate, string ToDate, int ScheduleID, int TimeStandard)
        {
            using (SqlConnection dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                {
                    dbconn.Close();
                }
                dbconn.Open();

                var time = FromDate + " - " + ToDate;

                using (SqlCommand cmd = new SqlCommand("insert into [tblMassDetails] values(@schedID, @tsID, @time, @orgID)", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.Text;

                        cmd.Parameters.AddWithValue("@orgID", HttpContext.Current.Session["orgID"]);
                        cmd.Parameters.AddWithValue("@schedID", ScheduleID);
                        cmd.Parameters.AddWithValue("@tsID", TimeStandard);
                        cmd.Parameters.AddWithValue("@time", time);
                        cmd.ExecuteNonQuery();
                    }
                    catch (Exception ex)
                    {
                        throw new Exception(ex.Message.ToString());

                    }
                }
            }
        }

        [WebMethod]
        public static void insertBible(string FromDate, string ToDate, int ScheduleID, int TimeStandard)
        {
            using (SqlConnection dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                {
                    dbconn.Close();
                }
                dbconn.Open();

                var time = FromDate + " - " + ToDate;

                using (SqlCommand cmd = new SqlCommand("insert into [tblBibleSchedules] values(@orgID, @schedID, @tsID, @time)", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.Text;

                        cmd.Parameters.AddWithValue("@orgID", HttpContext.Current.Session["orgID"]);
                        cmd.Parameters.AddWithValue("@schedID", ScheduleID);
                        cmd.Parameters.AddWithValue("@tsID", TimeStandard);
                        cmd.Parameters.AddWithValue("@time", time);
                        cmd.ExecuteNonQuery();
                    }
                    catch (Exception ex)
                    {
                        throw new Exception(ex.Message.ToString());

                    }
                }
            }
        }


        [WebMethod]
        public static void insertEvent(string eventName, string eventVenue, string desc, string filename, string startDate, string startTime,
            string endDate, string endTime)
        {
            using (SqlConnection dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                {
                    dbconn.Close();
                }
                dbconn.Open();

                using (SqlCommand cmd = new SqlCommand("INSERT INTO [dbo].[tblAnnouncement]" +
                                                       " ([OrganizationID]" +
                                                       " ,[TitleContent]" +
                                                       " ,[AnnouncementDesc]" +
                                                       " ,[Address]" +
                                                       " ,[ImagePath]" +
                                                       " ,[StartDate]" +
                                                       " ,[StartTime]" +
                                                       " ,[EndDate]" +
                                                       " ,[EndTime])" +
                                                       "VALUES" +
                                                       " (@orgID" +
                                                       " ,@name" +
                                                       " ,@desc" +
                                                       " ,@venue" +
                                                       " ,@filename" +
                                                       " ,@sDate" +
                                                       " ,@sTime" +
                                                       " ,@eDate" +
                                                       " ,@eTime)", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Parameters.AddWithValue("@orgID", HttpContext.Current.Session["orgID"]);
                        cmd.Parameters.AddWithValue("@name", eventName);
                        cmd.Parameters.AddWithValue("@venue", eventVenue);
                        cmd.Parameters.AddWithValue("@desc", desc);
                        cmd.Parameters.AddWithValue("@filename", filename);
                        cmd.Parameters.AddWithValue("@sDate", startDate);
                        cmd.Parameters.AddWithValue("@sTime", startTime);
                        cmd.Parameters.AddWithValue("@eDate", endDate);
                        cmd.Parameters.AddWithValue("@eTime", endTime);
                        cmd.ExecuteNonQuery();
                    }
                    catch (Exception ex)
                    {
                        throw new Exception(ex.Message.ToString());

                    }
                }
            }
        }

        protected void triggerME_Click(object sender, EventArgs e)
        {
            if (FileUpload1.PostedFile != null && FileUpload1.PostedFile.FileName != "")
            {
                var filename = FileUpload1.FileName.Split('.')[FileUpload1.FileName.Split('.').Length - 1];

                FileUpload1.SaveAs(Server.MapPath("Images/Organizations/" + FileUpload1.FileName.ToString()));
            }

        }

        protected void trigger_Click(object sender, EventArgs e)
        {
            var orgID = HttpContext.Current.Session["orgID"];

            if (FileUpload2.PostedFile != null && FileUpload2.PostedFile.FileName != "")
            {
                var ext = FileUpload2.FileName.Split('.')[FileUpload2.FileName.Split('.').Length - 1];

                FileUpload2.SaveAs(Server.MapPath("Images/Organizations/" + orgID + ".1." + ext));
            }

            if (FileUpload3.PostedFile != null && FileUpload3.PostedFile.FileName != "")
            {
                var ext = FileUpload3.FileName.Split('.')[FileUpload3.FileName.Split('.').Length - 1];

                FileUpload3.SaveAs(Server.MapPath("Images/Organizations/" + orgID + ".2." + ext));
            }

            if (FileUpload4.PostedFile != null && FileUpload4.PostedFile.FileName != "")
            {
                var ext = FileUpload4.FileName.Split('.')[FileUpload4.FileName.Split('.').Length - 1];

                FileUpload4.SaveAs(Server.MapPath("Images/Organizations/" + orgID + ".3." + ext));
            }

            if (FileUpload5.PostedFile != null && FileUpload5.PostedFile.FileName != "")
            {
                var ext = FileUpload5.FileName.Split('.')[FileUpload5.FileName.Split('.').Length - 1];

                FileUpload5.SaveAs(Server.MapPath("Images/Organizations/" + orgID + "." + ext));
            }
        }
    }
}
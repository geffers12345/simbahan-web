using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using SimbahanAPI.Models;
using SimbahanApp.Transformers;
using SimbahanApp.Models;

namespace SimbahanApp
{
    public partial class ChurchAdminPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Events"] != null)
            {
                HttpContext.Current.Session.Add("Events", Session["Events"] + "|" + "{\"name\": \"" + eventName.Value + "\", \"venue\": \"" + eventVenue.Value + "\" , \"desc\": \"" + eventDesc.Value + "\", \"path\": \"" + FileUpload4.FileName + "\", \"startdate\": \"" + eventDate.Value + "\", \"starttime\": \"" + eventTime.Value + "\", \"enddate\": \"" + eventEndDate.Value + "\", \"endtime\": \"" + eventEndTime.Value + "\"}");
            } else
            {
                HttpContext.Current.Session.Add("Events", "{\"name\": \"" + eventName.Value + "\", \"venue\": \"" + eventVenue.Value + "\" , \"desc\": \"" + eventDesc.Value + "\", \"path\": \"" + FileUpload4.FileName + "\", \"startdate\": \"" + eventDate.Value + "\", \"starttime\": \"" + eventTime.Value + "\", \"enddate\": \"" + eventEndDate.Value + "\", \"endtime\": \"" + eventEndTime.Value + "\"}");
            }

            if (Page.IsPostBack)
            {
                if (Session["Events"] != null)
                    EventSchedules.Value = (Session["Events"].ToString());
            }
            else
            {
                Session.Clear();
                Session.Abandon();
            }
        }

        
        [WebMethod]
        public static ChurchInfo CreateChurch(string name, string address, string city, string province, string country, string vicariate, string feastday, string parishPriest, string administeredBy, string diocese, string dateEstablished, string phoneNumber, string email, string website, int activated, int LocationID, int HasAdorationChapel, int IsOpen24By7, string DisplayText, bool HasAircon, bool HasCeilingFan, bool HasOrdinaryFan, string OfficeHours, string DevotionSchedule, string textBapt, string DateCreatedBapt, string textWedd, string DateCreatedWedd, float Long, float Lat)
        {
            
            ChurchTransformer churchTransformer = new ChurchTransformer();
            ChurchInfo church =  new ChurchInfo();

            using (SqlConnection dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                {
                    dbconn.Close();
                }
                dbconn.Open();

                using (SqlCommand cmd = new SqlCommand("InsertSimbahanInfo", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.AddWithValue("@ChurchName", name);
                        cmd.Parameters.AddWithValue("@Address", address);
                        cmd.Parameters.AddWithValue("@City", city);
                        cmd.Parameters.AddWithValue("@Province", province);
                        cmd.Parameters.AddWithValue("@Vicariate", vicariate);
                        cmd.Parameters.AddWithValue("@FeastDay", feastday);
                        cmd.Parameters.AddWithValue("@ParishPriest", parishPriest);
                        //cmd.Parameters.AddWithValue("@AdministeredBy", administeredBy);
                        cmd.Parameters.AddWithValue("@Diocese", diocese);
                        cmd.Parameters.AddWithValue("@DateEstablished", dateEstablished);
                        cmd.Parameters.AddWithValue("@PhoneNumber", phoneNumber);
                        cmd.Parameters.AddWithValue("@Email", email);
                        cmd.Parameters.AddWithValue("@Website", website);
                        cmd.Parameters.AddWithValue("@Activated", activated);
                        cmd.Parameters.AddWithValue("@LocationID", LocationID);
                        cmd.Parameters.AddWithValue("@HasAdorationChapel", HasAdorationChapel);
                        cmd.Parameters.AddWithValue("@OfficeHours", OfficeHours);
                        cmd.Parameters.AddWithValue("@DevotionSchedule", DevotionSchedule);

                        cmd.Parameters.AddWithValue("@StreetNo", 0);
                        cmd.Parameters.AddWithValue("@StreetName", "");
                        cmd.Parameters.AddWithValue("@Barangay", "");
                        cmd.Parameters.AddWithValue("@DateCreated", DateTime.UtcNow);
                        cmd.Parameters.AddWithValue("@LastUpdate", DateTime.UtcNow);
                        cmd.Parameters.AddWithValue("@churchType", 1);
                        cmd.Parameters.AddWithValue("@Long", Long);
                        cmd.Parameters.AddWithValue("@Lat", Lat);
                        cmd.Parameters.AddWithValue("@churchCode", "");
                        cmd.Parameters.AddWithValue("@churchHistory", "");
                        cmd.Parameters.Add("@SimbahanAutoID", SqlDbType.BigInt).Direction = ParameterDirection.Output;

                        var reader = cmd.ExecuteReader();

                        HttpContext.Current.Session["sid"] = Convert.ToInt32(cmd.Parameters["@SimbahanAutoID"].Value.ToString());
                        church.SimbahanID = Convert.ToInt32(HttpContext.Current.Session["sid"]);

                        //this.ClearFields();

                        while (reader.Read()) {
                            church = churchTransformer.Transform(reader);
                        }
                    }
                    catch (Exception ex)
                    {
                        throw new Exception(ex.Message.ToString());

                    }
                }
            }

            var adorationID = InsertAdorations(church.SimbahanID, IsOpen24By7, DisplayText, HasAircon, HasCeilingFan, HasOrdinaryFan);
            church.AdorationID = adorationID;
            InsertBaptismDetails(textBapt, church.SimbahanID, DateCreatedBapt);
            InsertWeddingDetails(textWedd, church.SimbahanID, DateCreatedWedd);
            return church;
        }

        [WebMethod]
        public static void InsertMassDetails(int ScheduleID, string Language, string FromDate, string ToDate, int SimbahanID, int TimeStandard)
        {
            string massSched = FromDate + " to " + ToDate;

            using (SqlConnection dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                {
                    dbconn.Close();
                }
                dbconn.Open();

                using (SqlCommand cmd = new SqlCommand("spInsertMass", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.AddWithValue("@DateCreated", DateTime.UtcNow);
                        cmd.Parameters.AddWithValue("@ScheduleID", ScheduleID);
                        cmd.Parameters.AddWithValue("@Language", Language);
                        cmd.Parameters.AddWithValue("@Time", massSched);
                        cmd.Parameters.AddWithValue("@SimbahanID", SimbahanID);
                        cmd.Parameters.AddWithValue("@TimeStandard", TimeStandard);
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
        public static void InsertConfessionDetails(int ScheduleID, string Text, string FromDate, string ToDate, int SimbahanID, int TimeStandard)
        {
            string confessionSched = FromDate + " to " + ToDate;

            using (SqlConnection dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                {
                    dbconn.Close();
                }
                dbconn.Open();

                using (SqlCommand cmd = new SqlCommand("spInsertConfessionDetails", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.AddWithValue("@DateCreated", DateTime.UtcNow);
                        cmd.Parameters.AddWithValue("@ScheduleID", ScheduleID);
                        cmd.Parameters.AddWithValue("@Text", Text);
                        cmd.Parameters.AddWithValue("@Time", confessionSched);
                        cmd.Parameters.AddWithValue("@SimbahanID", SimbahanID);
                        cmd.Parameters.AddWithValue("@TimeStandard", TimeStandard);
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
        public static void UploadEventImage(string[] paths)
        {
            foreach (string path in paths)
            {
                var file = path.Replace('~', '\\');
                var fileContent = HttpContext.Current.Request.Files[file];
                var fileName = Path.GetFileName(file);
                var serverPath = Path.Combine(HttpContext.Current.Server.MapPath("Images/Photos/"), fileName);
                
                using (var fileStream = File.Create(serverPath))
                {
                    fileStream.Dispose();
                    FileInfo fi = new FileInfo(serverPath);
                    fi.CopyTo(fileStream.Name, true);
                }
            }
        }

        [WebMethod]
        public static void CreateEvent(string eventDesc, Int32 SimbahanID, DateTime StartDate, string StartTime, DateTime EndDate, string EndTime, string Title, string Address, string ImagePath)
        {

            using (SqlConnection dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                {
                    dbconn.Close();
                }
                dbconn.Open();

                using (SqlCommand cmd = new SqlCommand("spInsertEvents", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        //date.AddHours(time.Hours);
                        //date.AddMinutes(time.Minutes);
                        var ImgPth = "Images/Churches/" + ImagePath;

                        cmd.Parameters.AddWithValue("@AnnouncementDesc", eventDesc);
                        cmd.Parameters.AddWithValue("@SimbahanID", SimbahanID);
                        cmd.Parameters.AddWithValue("@StartDate", StartDate);
                        cmd.Parameters.AddWithValue("@StartTime", StartTime);
                        cmd.Parameters.AddWithValue("@EndDate", EndDate);
                        cmd.Parameters.AddWithValue("@EndTime", EndTime);
                        cmd.Parameters.AddWithValue("@TitleContent", Title);
                        cmd.Parameters.AddWithValue("@Address", Address);
                        cmd.Parameters.AddWithValue("@ImagePath", ImgPth);
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
        public static void InsertBaptismDetails(string textBapt, int SimbahanID, string DateCreatedBapt)
        {

            using (SqlConnection dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                {
                    dbconn.Close();
                }
                dbconn.Open();

                using (SqlCommand cmd = new SqlCommand("spInsertBaptismDetails", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        
                        cmd.Parameters.AddWithValue("@text", textBapt);
                        cmd.Parameters.AddWithValue("@SimbahanID", SimbahanID);
                        cmd.Parameters.AddWithValue("@DateCreated", DateTime.UtcNow);
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
        public static void InsertWeddingDetails(string textWedd, int SimbahanID, string DateCreatedWedd)
        {

            using (SqlConnection dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                {
                    dbconn.Close();
                }
                dbconn.Open();

                using (SqlCommand cmd = new SqlCommand("spInsertWeddingDetails", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.AddWithValue("@text", textWedd);
                        cmd.Parameters.AddWithValue("@SimbahanID", SimbahanID);
                        cmd.Parameters.AddWithValue("@DateCreated", DateTime.UtcNow);
                        cmd.ExecuteNonQuery();
                    }
                    catch (Exception ex)
                    {
                        throw new Exception(ex.Message.ToString());
                    }
                }
            }
        }

        private void StartUpLoad(int SimbahanID)
        {
            if (FileUpload1.PostedFile != null && FileUpload1.PostedFile.FileName != "")
            {
                    FileUpload1.SaveAs(Server.MapPath("Images/Photos/" + FileUpload1.FileName.ToString()));

                    ExecuteInsert(SimbahanID, FileUpload1.FileName.ToString());
            }

            if (FileUpload2.PostedFile != null && FileUpload2.PostedFile.FileName != "")
            {
                FileUpload2.SaveAs(Server.MapPath("Images/Photos/" + FileUpload2.FileName.ToString()));

                ExecuteInsert(SimbahanID, FileUpload2.FileName.ToString());
            }

            if (FileUpload3.PostedFile != null && FileUpload3.PostedFile.FileName != "")
            {
                FileUpload3.SaveAs(Server.MapPath("Images/Photos/" + FileUpload3.FileName.ToString()));

                ExecuteInsert(SimbahanID, FileUpload3.FileName.ToString());
            }
            
        }

        private void ExecuteInsert(int SimbahanID, string path)

        {

            using (SqlConnection dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                {
                    dbconn.Close();
                }
                dbconn.Open();

                using (SqlCommand cmd = new SqlCommand("spInsertChurchImage", dbconn))
                {
                    try

                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.AddWithValue("@SimbahanID", SimbahanID);
                        cmd.Parameters.AddWithValue("@ImgPath", path);
                        
                        cmd.ExecuteNonQuery();

                    }

                    catch (System.Data.SqlClient.SqlException ex)

                    {

                        string msg = "Insert Error:";

                        msg += ex.Message;

                        throw new Exception(msg);

                    }
                }
            }

        }

        private void InsertFacilities(int VentID, int SimbahanID)
        {

            using (SqlConnection dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                {
                    dbconn.Close();
                }
                dbconn.Open();

                using (SqlCommand cmd = new SqlCommand("spInsertSimbahanVentilation", dbconn))
                {
                    try

                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.AddWithValue("@VentID", VentID);
                        cmd.Parameters.AddWithValue("@SimbahanID", SimbahanID);

                        cmd.ExecuteNonQuery();

                    }

                    catch (System.Data.SqlClient.SqlException ex)

                    {
                        string msg = "Insert Error:";

                        msg += ex.Message;

                        throw new Exception(msg);

                    }
                }
            }

        }
             

        private void StartInsertFacilities(int SimbahanID)
        {
            
            if (facAirCon.Checked == true)
            {
                var aircon = 1;
                SimbahanID = Convert.ToInt32(HttpContext.Current.Session["sid"]);
                InsertFacilities(aircon, SimbahanID);
            }
            if (facCeilingFan.Checked == true)
            {
                var aircon = 2;
                SimbahanID = Convert.ToInt32(HttpContext.Current.Session["sid"]);
                InsertFacilities(aircon, SimbahanID);
            }
            if (facOrdinaryFan.Checked == true)
            {
                var aircon = 3;
                SimbahanID = Convert.ToInt32(HttpContext.Current.Session["sid"]);
                InsertFacilities(aircon, SimbahanID);
            }

        }

        private void InsertSimbahanParking(int ParkingID, int SimbahanID)
        {

            using (SqlConnection dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                {
                    dbconn.Close();
                }
                dbconn.Open();

                using (SqlCommand cmd = new SqlCommand("[spInsertChurchParking]", dbconn))
                {
                    try

                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.AddWithValue("@ParkingID", ParkingID);
                        cmd.Parameters.AddWithValue("@SimbahanID", SimbahanID);

                        cmd.ExecuteNonQuery();

                    }

                    catch (System.Data.SqlClient.SqlException ex)

                    {

                        string msg = "Insert Error:";

                        msg += ex.Message;

                        throw new Exception(msg);

                    }
                }
            }

        }
        private void StartInsertSimbahanParking(int SimbahanID)
        {

            if (parkStreet.Checked == true)
            {
                var parking = 3;
                SimbahanID = Convert.ToInt32(HttpContext.Current.Session["sid"]);
                InsertSimbahanParking(parking, SimbahanID);
            }
            if (parkMall.Checked == true)
            {
                var parking = 2;
                SimbahanID = Convert.ToInt32(HttpContext.Current.Session["sid"]);
                InsertSimbahanParking(parking, SimbahanID);
            }
            if (parkPrivate.Checked == true)
            {
                var parking = 1;
                SimbahanID = Convert.ToInt32(HttpContext.Current.Session["sid"]);
                InsertSimbahanParking(parking, SimbahanID);
            }
            if (parkOther.Checked == true)
            {
                var parking = 4;
                SimbahanID = Convert.ToInt32(HttpContext.Current.Session["sid"]);
                InsertSimbahanParking(parking, SimbahanID);
            }

        }

        [WebMethod]
        public static int InsertAdorations(int SimbahanID, int IsOpen24By7, string DisplayText, bool HasAircon, bool HasCeilingFan, bool HasOrdinaryFan)
        {

            ChurchTransformer churchTransformer = new ChurchTransformer();
            ChurchInfo adoration = new ChurchInfo();

            using (SqlConnection dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                {
                    dbconn.Close();
                }
                dbconn.Open();

                using (SqlCommand cmd = new SqlCommand("spInsertAdorations", dbconn))
                {
                    try

                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.AddWithValue("@SimbahanID", SimbahanID);
                        cmd.Parameters.AddWithValue("@IsOpen24By7", IsOpen24By7);
                        cmd.Parameters.AddWithValue("@DisplayText", DisplayText);
                        cmd.Parameters.Add("@AdorationAutoID", SqlDbType.BigInt).Direction = ParameterDirection.Output;

                        var reader = cmd.ExecuteReader();

                        HttpContext.Current.Session["adoID"] = Convert.ToInt32(cmd.Parameters["@AdorationAutoID"].Value.ToString());
                        adoration.AdorationID = Convert.ToInt32(HttpContext.Current.Session["adoID"]);

                        while (reader.Read())
                        {
                            adoration = churchTransformer.Transform(reader);
                        }
                    }
                    catch (System.Data.SqlClient.SqlException ex)

                    {

                        string msg = "Insert Error:";

                        msg += ex.Message;

                        throw new Exception(msg);

                    }
                }
            }
            StartInsertAdorationVentilation(adoration.AdorationID, HasAircon, HasCeilingFan, HasOrdinaryFan);

            return adoration.AdorationID;
        }
        [WebMethod]
        public static void InsertAdorationVentilation(int AdorationID, int VentID, bool HasAircon, bool  HasCeilingFan, bool HasOrdinaryFan)
        {

            using (SqlConnection dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                {
                    dbconn.Close();
                }
                dbconn.Open();

                using (SqlCommand cmd = new SqlCommand("[spInsertAdoVentilation]", dbconn))
                {
                    try

                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.AddWithValue("@AdorationID", AdorationID);
                        cmd.Parameters.AddWithValue("@VentID", VentID);
                        cmd.ExecuteNonQuery();

                    }

                    catch (System.Data.SqlClient.SqlException ex)

                    {

                        string msg = "Insert Error:";

                        msg += ex.Message;

                        throw new Exception(msg);

                    }
                }
            }

        }

        private static void StartInsertAdorationVentilation(int AdorationID, bool HasAircon, bool HasCeilingFan, bool HasOrdinaryFan)
        {
            AdorationID = Convert.ToInt32(HttpContext.Current.Session["AdoID"]);
            var ventilations = new List<int>();

            if (HasAircon)
            {
                ventilations.Add(1);
            }
            if (HasCeilingFan)
            {
                ventilations.Add(2);
            }
            if (HasOrdinaryFan)
            {
                ventilations.Add(3);
            }

            foreach(int ventilation in ventilations)
            {
                InsertAdorationVentilation(AdorationID, ventilation, HasAircon, HasCeilingFan, HasOrdinaryFan);
            }
        }

        [WebMethod]
        public static void InsertAdorationChapelSched(int AdorationID, string FromDate, string ToDate, int ScheduleID, int TimeStandard)
        {
            string chapSched = FromDate + " to " + ToDate;

            using (SqlConnection dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                {
                    dbconn.Close();
                }
                dbconn.Open();

                using (SqlCommand cmd = new SqlCommand("spInsertAdorationChapelSchedule", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.AddWithValue("@AdorationID", AdorationID);
                        cmd.Parameters.AddWithValue("@ScheduleID", ScheduleID);
                        cmd.Parameters.AddWithValue("@Time", chapSched);
                        cmd.Parameters.AddWithValue("@TimeStandard", TimeStandard);
                        cmd.ExecuteNonQuery();
                    }
                    catch (System.Data.SqlClient.SqlException ex)

                    {
                        string msg = "Insert Error:";
                        msg += ex.Message;
                        throw new Exception(msg);
                    }
                }
            }
        }
      
        private void ClearFields()
        {
            churchName.Value = "";
            address.Value = "";
            city.Value = "";
            province.Value = "";
            vicariate.Value = "";
            feastDay.Value = "";
            parishPriest.Value = "";
            diocese.Value = "";
            dateEstablished.Value = "";
            phoneNo.Value = "";
            emailAdd.Value = "";
            website.Value = "";
            facAirCon.Checked = false;
            facOrdinaryFan.Checked = false;
            facCeilingFan.Checked = false;
            locSchool.Checked = false;
            locMall.Checked = false;
            locConvent.Checked = false;
            locSeparate.Checked = false;
            locHospital.Checked = false;
            parkPrivate.Checked = false;
            parkStreet.Checked = false;
            parkMall.Checked = false;
            parkOther.Checked = false;
            yes.Checked = false;
            no.Checked = false;
            openYes.Checked = false;
            openNo.Checked = false;
            displayText.Value = "";
            ventAirCon.Checked = false;
            ventCeilingFan.Checked = false;
            ventOrdinaryFan.Checked = false;
            confessionText.Value = "";
            OfficeSchedule.Value = "";
            SchedOfDevotion.Value = "";
            BaptismSched.Value = "";
            WeddingSchedule.Value = "";
            MassSchedules.Value = "";
            ConfessionSchedules.Value = "";
            AdorationSchedules.Value = "";
            EventSchedules.Value = "";
            eventName.Value = "";
            eventVenue.Value = "";
            eventDate.Value = "";
            eventTime.Value = "";
            administeredBy.Value = "";
            }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            StartUpLoad(Convert.ToInt32(Session["sid"]));
            StartInsertFacilities(Convert.ToInt32(Session["sid"]));
            StartInsertSimbahanParking(Convert.ToInt32(Session["sid"]));
            this.ClearFields();
            //ClientScript.RegisterStartupScript(GetType(), "resetfields", "ClearFields();", true);
            //ClientScript.RegisterStartupScript(GetType(), "Javascript", "javascript:ClearFields(); ", true);
            //Page.ClientScript.RegisterStartupScript(Page.GetType(), "my", "ClearFields();", true);
            //ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "ClearFields();", true);
            Session.Clear();
            Session.Abandon();
        }

        protected void btnAddEvent_Click(object sender, EventArgs e)
        {
            if (FileUpload4.PostedFile != null && FileUpload4.PostedFile.FileName != "")
            {
                    FileUpload4.SaveAs(Server.MapPath("Images/Churches/" + FileUpload4.FileName.ToString()));
            }
        }

        protected void btnAddThumbnail_Click(object sender, EventArgs e)
        {
            int simbahanId = Convert.ToInt32(Request["id"]);
            if (FileUpload6.PostedFile != null && FileUpload6.PostedFile.FileName != "")
            {
                var filename = FileUpload6.FileName.Split('.')[FileUpload6.FileName.Split('.').Length - 1];

                FileUpload6.SaveAs(Server.MapPath("Images/Photos/Thumbnails/" + simbahanId + "." + filename));
            }
        }
    }
}

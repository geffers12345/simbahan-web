using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.Services;
using SimbahanAPI.Models;
using SimbahanApp.Transformers;
using SimbahanApp.Services;

namespace SimbahanApp
{
    public partial class ChurchAdminPageUpdate : System.Web.UI.Page
    {
        protected string uploadedImgPath;

        protected void Page_Load(object sender, EventArgs e)
        {
            
            //if (FileUpload1.HasFile)
            //{
            //    uploadedImgPath = "Images/Photos/"+ FileUpload1.FileName.ToString();
            //    FileUpload1.SaveAs(Server.MapPath(uploadedImgPath));
            //}
            //else
            //{
            //    emptyupload.Text = "Choose your file";
            //}

            if (IsPostBack) return;

            int simbahanId = Convert.ToInt32(Request["id"]);

            using (SqlConnection dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                {
                    dbconn.Close();
                }
                dbconn.Open();

                //Table Simabahan
                //using (SqlCommand cmd = new SqlCommand("SELECT SimbahanID, Parish, CompleteAddress, City, StateOrProvince, Vicariate, FeastDay, ParishPriest, Diocese, DateEstablished, ContactNo, EmailAddress, Website, LocationID, HasAdorationChapel, OfficeHours, DevotionSchedule FROM Simbahan where SimbahanID = " + simbahanId, dbconn))
                //using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                var churchService = new ChurchService();
                var church = churchService.Find(simbahanId);
                //using (DataTable table = new DataTable())

                {
                    //adapter.Fill(table);
                    try
                    {
                        churchName.Value = church.Parish;
                        address.Value = church.CompleteAddress;
                        city.Value = church.City;
                        province.Value = church.StateProvince;
                        vicariate.Value = church.Vicariate;
                        feastDay.Value = church.FeastDay;
                        parishPriest.Value = church.Priest;
                        diocese.Value = church.Diocese;
                        dateEstablished.Value = church.DateEstablished;
                        phoneNo.Value = church.ContactNo;
                        emailAdd.Value = church.EmailAddress;
                        website.Value = church.Website;
                        OfficeSchedule.Value = church.OfficeHours;
                        SchedOfDevotion.Value = church.DevotionSchedule;
                        Longitude.Value = church.Longitude.ToString();
                        Latitude.Value = church.Latitude.ToString();

                        int locID;

                        if (Convert.IsDBNull(church.LocationID))
                            locID = 0;
                        else
                            locID = Convert.ToInt32(church.LocationID);

                        int HasAdo;

                        if (Convert.IsDBNull(church.HasAdorationChapel))
                            HasAdo = 0;
                        else
                            HasAdo = Convert.ToInt32(church.HasAdorationChapel);

                        //LocationID
                        if (locID == 1)
                        {
                            locSeparate.Checked = true;
                        }
                        else if (locID == 2)
                        {
                            locConvent.Checked = true;
                        } else if (locID == 3)
                        {
                            locMall.Checked = true;
                        } else if (locID == 5)
                        {
                            locHospital.Checked = true;
                        }
                        else if (locID == 4)
                        {
                            locSchool.Checked = true;
                        }

                        if (HasAdo == 0)
                        {
                            hasAdoNo.Checked = true;
                        }
                        else if (HasAdo == 1)
                        {
                            hasAdoYes.Checked = true;
                        }

                    }
                    catch (Exception ex)
                    {
                        
                    }
                }
                SimbahanId.Value = simbahanId.ToString();
                SimbahanVentilation();
                SimbahanParking();
                Adoration();
                AdorationVentulation();
                MassDetails();
                ConfessionDetails();
                AdorationDetails();
                BaptismSchedules();
                WeddingSchedules();
                EventDetails();
                adoration();
                Images();
            }
        }
        
        private void BaptismSchedules()
        {
            using (SqlConnection dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                {
                    dbconn.Close();
                }
                dbconn.Open();

                //Simbahan Ventilation
                using (SqlCommand cmd = new SqlCommand("SELECT BaptismID, Text FROM [BaptismDetails] where SimbahanID = " + SimbahanId.Value, dbconn))
                //using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                //using (DataTable table = new DataTable())

                {
                    //adapter.Fill(table);

                    var reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        BaptismSched.Value = reader["Text"].ToString();
                    }
                }
            }
        }

        private void WeddingSchedules()
        {
            using (SqlConnection dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                {
                    dbconn.Close();
                }
                dbconn.Open();

                //Simbahan Ventilation
                using (SqlCommand cmd = new SqlCommand("SELECT WeddingID, Text FROM [WeddingDetails] where SimbahanID = " + SimbahanId.Value, dbconn))
                //using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                //using (DataTable table = new DataTable())

                {
                    //adapter.Fill(table);

                    var reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        WeddingSchedule.Value = reader["Text"].ToString();
                    }
                }
            }
        }
        private void SimbahanVentilation()
        {
            using (SqlConnection dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                {
                    dbconn.Close();
                }
                dbconn.Open();

                //Simbahan Ventilation
                using (SqlCommand cmd1 = new SqlCommand("SELECT SimbahanID, VentID FROM SimbahanVentilation where SimbahanID = " + SimbahanId.Value, dbconn))
                //using (SqlDataAdapter adapter1 = new SqlDataAdapter(cmd1))
                //using (DataTable table1 = new DataTable())
                {

                    //adapter1.Fill(table1);
                    var reader = cmd1.ExecuteReader();

                    while (reader.Read())
                    {
                        var ventId = Convert.ToInt32(reader["VentID"].ToString());

                        if (ventId == 1)
                        {
                            facAirCon.Checked = true;
                        }
                        if (ventId == 2)
                        {
                            facCeilingFan.Checked = true;
                        }
                        if (ventId == 3)
                        {
                            facOrdinaryFan.Checked = true;

                        }
                    }

                    int ventID;
                    try
                    {
                        if (Convert.IsDBNull(reader["VentID"].ToString()))
                            ventID = 0;
                        else
                        ventID = Convert.ToInt32(reader["VentID"].ToString());
                    }
                    catch (Exception e)
                    {
                        ventID = 0;
                    }
                }
                
                //CheckBox1.Checked = Convert.ToBoolean(table1.Rows[0][].ToString());
            }
        }

        private void SimbahanParking()
        {
            using (SqlConnection dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                {
                    dbconn.Close();
                }
                dbconn.Open();

                //Simbahan Parking
                using (SqlCommand cmd = new SqlCommand("SELECT SimbahanID, ParkingID FROM SimbahanParking where SimbahanID = " + SimbahanId.Value, dbconn))
                using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                using (DataTable table = new DataTable())
                {
                    adapter.Fill(table);

                    var reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        var parkId = Convert.ToInt32(reader["ParkingID"].ToString());

                        if (parkId == 1)
                        {
                            parkPrivate.Checked = true;
                        }
                        if (parkId == 2)
                        {
                            parkMall.Checked = true;
                        }
                        if (parkId == 3)
                        {
                            parkStreet.Checked = true;

                        }
                        if (parkId == 4)
                        {
                            parkOther.Checked = true;

                        }
                    }
                }
            }
        }
        private void Adoration()
        {
            using (SqlConnection dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                {
                    dbconn.Close();
                }
                dbconn.Open();

                //Simbahan Parking
                using (SqlCommand cmd = new SqlCommand("SELECT SimbahanID, IsOpen24By7, DisplayText, AdorationID FROM Adorations where SimbahanID = " + SimbahanId.Value, dbconn))
                //using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                //using (DataTable table = new DataTable())
                {
                    //adapter.Fill(table);

                    var reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        try
                        {
                            if (Convert.IsDBNull(reader["DisplayText"].ToString()))
                                displayText.Value = "none";
                            else
                                displayText.Value = reader["DisplayText"].ToString();
                        }
                        catch (Exception e)
                        {
                            displayText.Value = "none";
                        }

                        try
                        {
                            if (Convert.IsDBNull(reader["AdorationID"].ToString()))
                                adoID.Text = "0";
                            else
                                adoID.Text = reader["AdorationID"].ToString();
                        }
                        catch (Exception e)
                        {
                            adoID.Text = "0";
                        }
                    }
                    
                    while (reader.Read())
                    {
                        var isOpen = Convert.ToInt32(reader["IsOpen24By7"].ToString());

                        if (isOpen == 0)
                        {
                            openYes.Checked = true;
                        }
                        else if (isOpen == 1)
                        {
                            openNo.Checked = true;
                        }
                    }
                }
            }
        }

        private void AdorationVentulation()
        {
            using (SqlConnection dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                {
                    dbconn.Close();
                }
                dbconn.Open();

                //Simbahan Parking
                using (SqlCommand cmd = new SqlCommand("SELECT VentID, AdorationID FROM AdoVent3rdTable where AdorationID = '" + adoID.Text + "'", dbconn))
                using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                using (DataTable table = new DataTable())
                {
                    adapter.Fill(table);

                    var reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        var adoVent = Convert.ToInt32(reader["VentID"].ToString());

                        if (adoVent == 1)
                        {
                            ventAirCon.Checked = true;
                        }
                        if (adoVent == 2)
                        {
                            ventCeilingFan.Checked = true;
                        }
                        if (adoVent == 3)
                        {
                            ventOrdinaryFan.Checked = true;
                        }
                    }
                }
            }
        }

        private void MassDetails()
        {
            using (SqlConnection dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                {
                    dbconn.Close();
                }
                dbconn.Open();

                SqlCommand cmd = new SqlCommand("SELECT MassDetailID, ScheduleID, Language, Time, TimeStandardID from [MassDetails] where SimbahanID = "  + SimbahanId.Value , dbconn);

                var reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    var tr = new HtmlGenericControl("td");
                    var time = reader["Time"].ToString();
                    var language = reader["Language"].ToString();
                    var times = time.ToString().Split('-');
                    var from = times[0].ToString();
                    var to = "";
                    if (times.Length > 1)
                    {
                        to = times[1];
                    }
                    else
                    {
                        to = (Convert.ToInt32(times[0].Split(':')[0]) + 1) + ":" + times[0].Split(':')[1];
                    }

                    int days = Convert.ToInt32(reader["ScheduleID"].ToString());
                    int id = Convert.ToInt32(reader["MassDetailID"].ToString());
                    string dayStr = "";

                    if (days == 1)
                    {
                        dayStr = "Sunday";
                    } else if (days == 2)
                    {
                        dayStr = "Monday";
                    }
                    else if (days == 3)
                    {
                        dayStr = "Tuesday";
                    }
                    else if (days == 4)
                    {
                        dayStr = "Wednesday";
                    }
                    else if (days == 5)
                    {
                        dayStr = "Thursday";
                    }
                    else if (days == 6)
                    {
                        dayStr = "Friday";
                    }
                    else if (days == 7)
                    {
                        dayStr = "Saturday";
                    }

                    tr.InnerHtml = string.Format("<tr name=\"{4}\"><td>{0}</td><td>{1}</td><td>{2}</td><td>{3}</td><td><button id=\"delete\" class=\"btn btn-danger\" data-id='" + id + "'>Delete</button>&nbsp&nbsp<button id=\"edit\" data-id='" + id + "' class=\"btn btn-success\">Edit</button></td></tr>", dayStr, language, from, to, id);
                    tableMassSchedules.Controls.Add(tr);
                }
                
            }
        }

        private void ConfessionDetails()
        {
            using (SqlConnection dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                {
                    dbconn.Close();
                }
                dbconn.Open();

                SqlCommand cmd = new SqlCommand("SELECT ConfessionID, ScheduleID, Time, TimeStandardID, Text from [ConfessionDetails] where SimbahanID = " + SimbahanId.Value, dbconn);

                var reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    var tr = new HtmlGenericControl("td");
                    var time = reader["Time"];
                    var DisplayText = reader["Text"];
                    var times = time.ToString().Split('-');
                    var from = times[0];
                    var to = "";
                    if (times.Length > 1)
                    {
                        to = times[1];
                    }
                    else
                    {
                        to = (Convert.ToInt32(times[0].Split(':')[0]) + 1) + ":" + times[0].Split(':')[1];
                    }


                    int days = Convert.ToInt32(reader["ScheduleID"].ToString());
                    int id = Convert.ToInt32(reader["ConfessionID"].ToString());
                    string dayStr = "";

                    if (days == 1)
                    {
                        dayStr = "Sunday";
                    }
                    else if (days == 2)
                    {
                        dayStr = "Monday";
                    }
                    else if (days == 3)
                    {
                        dayStr = "Tuesday";
                    }
                    else if (days == 4)
                    {
                        dayStr = "Wednesday";
                    }
                    else if (days == 5)
                    {
                        dayStr = "Thursday";
                    }
                    else if (days == 6)
                    {
                        dayStr = "Friday";
                    }
                    else if (days == 7)
                    {
                        dayStr = "Saturday";
                    }

                    tr.InnerHtml = string.Format("<tr name=\"{3}\"><td>{0}</td><td>{1}</td><td>{2}</td><td>{4}</td><td><button id=\"deleteConfession\" class=\"btn btn-danger\" data-id='" + id + "'>Delete</button>&nbsp&nbsp<button id=\"editConfession\" data-id='" + id + "' class=\"btn btn-success\">Edit</button></td></tr>", dayStr, from, to, id, DisplayText);
                    tableConfessionSchedules.Controls.Add(tr);
                }

            }
        }

        private void AdorationDetails()
        {
            using (SqlConnection dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                {
                    dbconn.Close();
                }
                dbconn.Open();

                SqlCommand cmd = new SqlCommand("SELECT AdChapelID, AdorationID, ScheduleID, Time, TimeStandardID from [AdorationChapel] where AdorationID = " + SimbahanId.Value, dbconn);

                var reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    var tr = new HtmlGenericControl("td");
                    var time = reader["Time"];
                    var times = time.ToString().Split('-');
                    var from = times[0];
                    var to = "";
                    if (times.Length > 1)
                    {
                        to = times[1];
                    } else {
                        to = (Convert.ToInt32(times[0].Split(':')[0]) + 1) + ":" + times[0].Split(':')[1];
                    }

                    
                    int days = Convert.ToInt32(reader["ScheduleID"].ToString());
                    int id = Convert.ToInt32(reader["AdChapelID"].ToString());

                    string dayStr = "";

                    if (days == 1)
                    {
                        dayStr = "Sunday";
                    }
                    else if (days == 2)
                    {
                        dayStr = "Monday";
                    }
                    else if (days == 3)
                    {
                        dayStr = "Tuesday";
                    }
                    else if (days == 4)
                    {
                        dayStr = "Wednesday";
                    }
                    else if (days == 5)
                    {
                        dayStr = "Thursday";
                    }
                    else if (days == 6)
                    {
                        dayStr = "Friday";
                    }
                    else if (days == 7)
                    {
                        dayStr = "Saturday";
                    }

                    tr.InnerHtml = string.Format("<tr name=\"{3}\"><td>{0}</td><td>{1}</td><td>{2}</td><td><button id=\"deleteAdoration\" class=\"btn btn-danger\" data-id='" + id + "'>Delete</button>&nbsp&nbsp<button id=\"editAdoration\" data-id='" + id + "' class=\"btn btn-success\">Edit</button></td></tr>", dayStr, from, to, id);
                    tableAdorationSchedules.Controls.Add(tr);
                }

            }
        }

        private void EventDetails()
        {
            using (SqlConnection dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                {
                    dbconn.Close();
                }
                dbconn.Open();

                SqlCommand cmd = new SqlCommand("SELECT AnnouncementID, TitleContent, Address, AnnouncementDesc, StartDate, StartTime, EndDate, EndTime, ImagePath from [Announcements] where SimbahanID = " + SimbahanId.Value, dbconn);

                var reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    var eventName = reader["TitleContent"];
                    var venue = reader["Address"];
                    var desc = reader["AnnouncementDesc"];
                    var path = reader["ImagePath"];
                    var tr = new HtmlGenericControl("td");
                    var startDate = reader["StartDate"];
                    var startTime = reader["StartTime"];
                    var endDate = reader["EndDate"];
                    var endTime = reader["EndTime"];
                    int id = Convert.ToInt32(reader["AnnouncementID"].ToString());

                    tr.InnerHtml = string.Format("<tr name=\"{8}\"><td>{0}</td><td>{1}</td><td>{2}</td><td>{3}</td><td>{4}</td><td>{5}</td><td>{6}</td><td>{7}</td><td><i class=\"fa fa-remove\" style=\"font - size: 24pt; color: #db0c0c;\" id=\"deleteEvent\" data-id='" + id + "'></i>&nbsp&nbsp<i class=\"fa fa-edit\" style=\"font - size: 24pt; color: #46cd20;\" id=\"editEvent\" data-id='" + id + "'></i></td></tr>", eventName, venue, desc, path, startDate, startTime, endDate, endTime, id);
                    tableEventSchedules.Controls.Add(tr);
                }

            }
        }

        private void Images()
        {
            using (SqlConnection dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                {
                    dbconn.Close();
                }
                dbconn.Open();

                SqlCommand cmd = new SqlCommand("SELECT * from [ChurchPhotos] where SimbahanID = " + SimbahanId.Value, dbconn);

                var reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    var path = reader["ImagePath"];
                    var tr = new HtmlGenericControl("td");
                    int id = Convert.ToInt32(reader["ChurchPhotoID"].ToString());

                    tr.InnerHtml = string.Format("<tr name=\"{1}\"><td class=\"text-center\">{0}</td><td><img src=\"Images/Photos/{0}\" /></td><td class=\"text-center\"><i class=\"fa fa-remove\" style=\"font-size: 28px; color: #db0c0c;\" id=\"deleteImage\" data-id='" + id + "'></i></td></tr>", path, id);
                    imagesList.Controls.Add(tr);
                }

            }
        }

        [WebMethod]
        public static void UpdateEventDetails(int eventDetailsId, string eventName, string eventStartDate, string eventStartTime, string eventEndDate, string eventEndTime, int SimbahanId, string venue, string path, string desc)
        {
            using (SqlConnection dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                {
                    dbconn.Close();
                }
                dbconn.Open();

                //var EventDateTime = eventDate + ' ' + eventTime;
                var ImgPath = "Images/Churches/" + path;
                string query = String.Format("UPDATE Announcements SET TitleContent = '{1}', Address = '{2}', AnnouncementDesc = '{3}', ImagePath = '{4}', SimbahanID = {5}, StartDate = '{6}', StartTime = '{7}', EndDate = '{8}', EndTime = '{9}' WHERE AnnouncementID = {0}", eventDetailsId, eventName, venue, desc, ImgPath, SimbahanId, eventStartDate, eventStartTime, eventEndDate, eventEndTime);

                SqlCommand cmd = new SqlCommand(query.ToString(), dbconn);

                cmd.ExecuteNonQuery();
            }
        }

        [WebMethod]
        public static void DeleteEventDetails(int eventDetailsId)
        {
            using (SqlConnection dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                {
                    dbconn.Close();
                }
                dbconn.Open();

                SqlCommand cmd = new SqlCommand("DELETE from Announcements where AnnouncementID = '" + eventDetailsId + "'", dbconn);

                cmd.ExecuteReader();
            }
        }

        [WebMethod]
        public static void DeleteMassDetails(int massDetailsId)
        {
            using (SqlConnection dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                {
                    dbconn.Close();
                }
                dbconn.Open();

                SqlCommand cmd = new SqlCommand("DELETE from MassDetails where MassDetailID = '" + massDetailsId + "'", dbconn);

                cmd.ExecuteReader();
            }
        }

        [WebMethod]
        public static void DeleteImage(int imgId)
        {
            using (SqlConnection dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                {
                    dbconn.Close();
                }
                dbconn.Open();

                SqlCommand cmd = new SqlCommand("DELETE from [ChurchPhotos] where [ChurchPhotoID] = '" + imgId + "'", dbconn);

                cmd.ExecuteReader();
            }
        }

        [WebMethod]
        public static void UpdateMassDetails(int massDetailsId, int ScheduleId, string Language, string Time, int SimbahanId,  int TimeStandard)
        {
            using (SqlConnection dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                {
                    dbconn.Close();
                }
                dbconn.Open();

                string query = String.Format("UPDATE MassDetails SET ScheduleID = '{0}', Language = '{1}', Time = '{2}', SimbahanID = '{3}', TimeStandardID = '{4}' WHERE MassDetailID = {5}", ScheduleId, Language, Time, SimbahanId, TimeStandard, massDetailsId);

                SqlCommand cmd = new SqlCommand(query.ToString(), dbconn);

                cmd.ExecuteNonQuery();
            }
        }

        [WebMethod]
        public static void DeleteConfessionDetails(int confessionDetailsId)
        {
            using (SqlConnection dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                {
                    dbconn.Close();
                }
                dbconn.Open();

                SqlCommand cmd = new SqlCommand("DELETE from [ConfessionDetails] where ConfessionID = '" + confessionDetailsId + "'", dbconn);

                cmd.ExecuteReader();
            }
        }

        [WebMethod]
        public static void UpdateConfessionDetails(int confessionDetailsId, int ScheduleId, string text, string Time, int SimbahanId, int TimeStandard)
        {
            using (SqlConnection dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                {
                    dbconn.Close();
                }
                dbconn.Open();

                string query = String.Format("UPDATE [ConfessionDetails] SET ScheduleID = '{0}', Text = '{1}', Time = '{2}', SimbahanID = '{3}', TimeStandardID = '{4}' WHERE ConfessionID = {5}", ScheduleId, text, Time, SimbahanId, TimeStandard, confessionDetailsId);

                SqlCommand cmd = new SqlCommand(query.ToString(), dbconn);

                cmd.ExecuteNonQuery();
            }
        }

        [WebMethod]
        public static void DeleteAdorationDetails(int adorationDetailsId)
        {
            using (SqlConnection dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                {
                    dbconn.Close();
                }
                dbconn.Open();

                SqlCommand cmd = new SqlCommand("DELETE from [AdorationChapel] where AdChapelID = '" + adorationDetailsId + "'", dbconn);

                cmd.ExecuteReader();
            }
        }

        [WebMethod]
        public static void UpdateAdorationDetails(int adorationDetailsId, int ScheduleId, string Time, int TimeStandard)
        {
            using (SqlConnection dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                {
                    dbconn.Close();
                }
                dbconn.Open();

                string query = String.Format("UPDATE [AdorationChapel] SET ScheduleID = '{0}', Time = '{1}', TimeStandardID = '{2}' WHERE AdChapelID = {3}", ScheduleId, Time, TimeStandard, adorationDetailsId);

                SqlCommand cmd = new SqlCommand(query.ToString(), dbconn);

                cmd.ExecuteNonQuery();
            }
        }

        protected void btnAddEvent_Click(object sender, EventArgs e)
        {
            if (FileUpload4.PostedFile != null && FileUpload4.PostedFile.FileName != "")
            {
                FileUpload4.SaveAs(Server.MapPath("Images/Churches/" + FileUpload4.FileName.ToString()));
            }
        }

        public void copyImage()
        {
            if (FileUpload5.PostedFile != null && FileUpload5.PostedFile.FileName != "")
            {
                FileUpload5.SaveAs(Server.MapPath("Images/Churches/" + FileUpload5.FileName.ToString()));
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            int simbahanId = Convert.ToInt32(Request["id"]);

            using (SqlConnection dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                {
                    dbconn.Close();
                }
                dbconn.Open();

                int locID = 0;
                int hasAdo = 0;

                //Location ID
                if (locSeparate.Checked) {
                    locID = 1;
                } else if (locMall.Checked)
                {
                    locID = 3;
                } else if (locSchool.Checked)
                {
                    locID = 4;
                } else if (locConvent.Checked)
                {
                    locID = 2;
                } else if (locHospital.Checked)
                {
                    locID = 5;
                }

                //Has Adoration
                if (hasAdoYes.Checked)
                {
                    hasAdo = 1;
                } else if(hasAdoNo.Checked)
                {
                    hasAdo = 0;
                }

                string query = String.Format("UPDATE Simbahan SET Parish = '" + churchName.Value + "', CompleteAddress = '" + address.Value + "', City = '" + city.Value + "', StateOrProvince = '" + province.Value + "', Vicariate = '" + vicariate.Value + "', FeastDay = '" + feastDay.Value + "', ParishPriest = '" + parishPriest.Value + "', Diocese = '" + diocese.Value + "', DateEstablished = '" + dateEstablished.Value + "', ContactNo = '" + phoneNo.Value + "', EmailAddress = '" + emailAdd.Value + "', Website = '" + website.Value + "', LocationID = '" + locID + "', HasAdorationChapel = '" + hasAdo + "', OfficeHours = '" + OfficeSchedule.Value + "', DevotionSchedule = '" + SchedOfDevotion.Value + "', Latitude = '" + Latitude.Value + "', Longitude = '" + Longitude.Value + "', LastUpdate = '" + DateTime.Now + "' FROM Simbahan where SimbahanID = " + simbahanId);

                SqlCommand cmd = new SqlCommand(query.ToString(), dbconn);

                cmd.ExecuteNonQuery();

                InsertVentilation(simbahanId);
                InsertParking(simbahanId);
                UpdateAdoration(simbahanId);
                UpdateAdorationVentilation(simbahanId);
                UpdateWedding(simbahanId);
                UpdateBaptism(simbahanId);
                StartUpLoad(simbahanId);
            }
        }

        private void InsertVentilation(int simbahanId)
        {
            DeleteVentilation(simbahanId);

            using (SqlConnection dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                {
                    dbconn.Close();
                }
                dbconn.Open();

                var ventilations = new List<int>();

                if (facAirCon.Checked)
                {
                    ventilations.Add(1);
                }
                if (facCeilingFan.Checked)
                {
                    ventilations.Add(2);
                }
                if (facOrdinaryFan.Checked)
                {
                    ventilations.Add(3);
                }

                foreach (int ventilation in ventilations)
                {
                    string query = String.Format("Insert into [SimbahanVentilation] values(" + ventilation + ", " + simbahanId + ")");

                    SqlCommand cmd = new SqlCommand(query.ToString(), dbconn);

                    cmd.ExecuteNonQuery();
                }
            }

        }

        private void DeleteVentilation(int simbahanId)
        {

            using (SqlConnection dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                {
                    dbconn.Close();
                }
                dbconn.Open();

                string query = String.Format("Delete from [SimbahanVentilation] where SimbahanID  =" + simbahanId);

                SqlCommand cmd = new SqlCommand(query.ToString(), dbconn);

                cmd.ExecuteNonQuery();
            }

        }

        private void InsertParking(int simbahanId)
        {
            DeleteParking(simbahanId);

            using (SqlConnection dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                {
                    dbconn.Close();
                }
                dbconn.Open();

                var parkings = new List<int>();

                if (parkStreet.Checked)
                {
                    parkings.Add(3);
                }
                if (parkMall.Checked)
                {
                    parkings.Add(2);
                }
                if (parkPrivate.Checked)
                {
                    parkings.Add(1);
                }
                if (parkOther.Checked)
                {
                    parkings.Add(4);
                }

                foreach (int parking in parkings)
                {
                    string query = String.Format("Insert into [SimbahanParking] values(" + parking + ", " + simbahanId + ")");

                    SqlCommand cmd = new SqlCommand(query.ToString(), dbconn);

                    cmd.ExecuteNonQuery();
                }
            }

        }

        private void DeleteParking(int simbahanId)
        {
            
            using (SqlConnection dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                {
                    dbconn.Close();
                }
                dbconn.Open();

                string query = String.Format("Delete from [SimbahanParking] where SimbahanID  =" + simbahanId);

                SqlCommand cmd = new SqlCommand(query.ToString(), dbconn);

                cmd.ExecuteNonQuery();
            }

        }

        private void UpdateAdoration(int simbahanId)
        {

            using (SqlConnection dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                {
                    dbconn.Close();
                }
                dbconn.Open();

                int isOpen = 0;

                if (openYes.Checked)
                {
                    isOpen = 1;
                } else if (openNo.Checked)
                {
                    isOpen = 0;
                }

                string query = String.Format("Update [Adorations] set IsOpen24by7 = " + isOpen + ", DisplayText = '" + displayText.Value + "' where SimbahanID  =" + simbahanId);

                SqlCommand cmd = new SqlCommand(query.ToString(), dbconn);

                cmd.ExecuteNonQuery();
            }

        }
        private void adoration()
        {
            using (SqlConnection dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                {
                    dbconn.Close();
                }
                dbconn.Open();
                
                using (SqlCommand cmd = new SqlCommand("SELECT AdorationID from Adorations where SimbahanID = " + SimbahanId.Value, dbconn))
                //using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                //using (DataTable table = new DataTable())

                {
                    //adapter.Fill(table);

                    var reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        var adoID = reader["AdorationID"].ToString();
                        HttpContext.Current.Session["adoID"] = adoID;
                    }
                }
            }
        }
        private void UpdateAdorationVentilation(int simbahanId)
        {
            DeleteAdorationVentilation(simbahanId);
            using (SqlConnection dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                {
                    dbconn.Close();
                }
                dbconn.Open();

                var adoVents = new List<int>();

                if (ventAirCon.Checked)
                {
                    adoVents.Add(1);
                }
                if (ventCeilingFan.Checked)
                {
                    adoVents.Add(2);
                }
                if (ventOrdinaryFan.Checked)
                {
                    adoVents.Add(3);
                }
                foreach (int adoVent in adoVents)
                {
                    int ado = Convert.ToInt32(Session["adoID"]);

                    string query = String.Format("Insert Into [AdoVent3rdTable] values (" + ado +", " + adoVent + ")");

                    SqlCommand cmd = new SqlCommand(query.ToString(), dbconn);

                    cmd.ExecuteNonQuery();
                }
            }

        }

        private void DeleteAdorationVentilation(int simbahanId)
        {

            using (SqlConnection dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                {
                    dbconn.Close();
                }
                dbconn.Open();

                int ado = Convert.ToInt32(Session["adoID"]);

                string query = String.Format("Delete from [AdoVent3rdTable] where AdorationID = " + ado);

                SqlCommand cmd = new SqlCommand(query.ToString(), dbconn);

                cmd.ExecuteNonQuery();
            }

        }

        private void UpdateBaptism(int simbahanId)
        {

            using (SqlConnection dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                {
                    dbconn.Close();
                }
                dbconn.Open();

                string query = String.Format("Update [BaptismDetails] set Text = '" + BaptismSched.Value + "' where SimbahanID =" + simbahanId);

                SqlCommand cmd = new SqlCommand(query.ToString(), dbconn);

                cmd.ExecuteNonQuery();
            }

        }

        private void UpdateWedding(int simbahanId)
        {

            using (SqlConnection dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                {
                    dbconn.Close();
                }
                dbconn.Open();

                string query = String.Format("Update [WeddingDetails] set Text = '" + WeddingSchedule.Value + "' where SimbahanID =" + simbahanId);

                SqlCommand cmd = new SqlCommand(query.ToString(), dbconn);

                cmd.ExecuteNonQuery();
            }

        }

        private void StartUpLoad(int SimbahanID)
        {
            //if (FileUpload1.PostedFile != null && FileUpload1.PostedFile.FileName != "")
            //{
            //    FileUpload1.SaveAs(Server.MapPath("Images/Photos/" + FileUpload1.FileName.ToString()));

            //    ExecuteInsert(SimbahanID, FileUpload1.FileName.ToString());
            //}

            //if (FileUpload2.PostedFile != null && FileUpload2.PostedFile.FileName != "")
            //{
            //    FileUpload2.SaveAs(Server.MapPath("Images/Photos/" + FileUpload2.FileName.ToString()));

            //    ExecuteInsert(SimbahanID, FileUpload2.FileName.ToString());
            //}

            //if (FileUpload3.PostedFile != null && FileUpload3.PostedFile.FileName != "")
            //{
            //    FileUpload3.SaveAs(Server.MapPath("Images/Photos/" + FileUpload3.FileName.ToString()));

            //    ExecuteInsert(SimbahanID, FileUpload3.FileName.ToString());
            //}
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

        protected void btnAddNewEvent_Click(object sender, EventArgs e)
        {
            int simbahanId = Convert.ToInt32(Request["id"]);

            using (SqlConnection dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                {
                    dbconn.Close();
                }
                dbconn.Open();
                copyImage();
                //string newEventDateTime = newEventDate.Value + ' ' + newEventTime.Value;
                string filename = "Images/Churches/" + FileUpload5.FileName.ToString();

                string query = String.Format("Insert into [Announcements] values('" + newEventDesc.Value + "', '" + simbahanId + "','" + newEventDate.Value + "', '" + newEventTime.Value + "', '" + newEventEndDate.Value + "', '" + newEventEndTime.Value + "', '" + newEventName.Value + "', '" + newEventVenue.Value + "', '" + filename + "')");

                SqlCommand cmd = new SqlCommand(query.ToString(), dbconn);

                cmd.ExecuteNonQuery();
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

        [WebMethod]
        public static void addNewMass(int day, string massStart, string massEnd, string lang, int timestandard, int simbahanID)
        {
            using (SqlConnection dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                {
                    dbconn.Close();
                }
                dbconn.Open();

                var massDateTime = massStart + " - " + massEnd;
                //var ImgPath = "Images/Churches/" + path;
                string query = String.Format("Insert Into MassDetails values('" + DateTime.Now + "', '" + day + "', '" + lang + "', '" + massDateTime + "', '" + simbahanID + "', '" + timestandard + "')");

                SqlCommand cmd = new SqlCommand(query.ToString(), dbconn);

                cmd.ExecuteNonQuery();
            }
        }

        [WebMethod]
        public static void addNewConfession(int conday, string conStart, string conEnd, string display, int timestandard, int simbahanID)
        {
            using (SqlConnection dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                {
                    dbconn.Close();
                }
                dbconn.Open();

                var confessionDateTime = conStart + " - " + conEnd;
                //var ImgPath = "Images/Churches/" + path;
                string query = String.Format("Insert Into [ConfessionDetails] values('" + confessionDateTime + "', '" + simbahanID + "', '" + conday + "', '" + DateTime.Now + "', '" + display + "', '" + timestandard + "')");

                SqlCommand cmd = new SqlCommand(query.ToString(), dbconn);

                cmd.ExecuteNonQuery();
            }
        }

        [WebMethod]
        public static void addNewAdoration(int adoday, string adoStart, string adoEnd, int timestandard, int simbahanID)
        {
            using (SqlConnection dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                {
                    dbconn.Close();
                }
                dbconn.Open();

                var adoDateTime = adoStart + " - " + adoEnd;
                //var ImgPath = "Images/Churches/" + path;
                string query = String.Format("Insert Into [AdorationChapel] values('" + simbahanID + "', '" + adoday + "', '" + adoDateTime + "', '" + timestandard + "')");

                SqlCommand cmd = new SqlCommand(query.ToString(), dbconn);

                cmd.ExecuteNonQuery();
            }
        }

        protected void addChurchImages_Click(object sender, EventArgs e)
        {
            var SimbahanID = Convert.ToInt32(Request["id"]);
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
    }
}
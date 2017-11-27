using SimbahanApp.Services;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace SimbahanApp
{
    public partial class OrganizationUpdate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;

            int orgID = Convert.ToInt32(Request["id"]);

            using (SqlConnection dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                {
                    dbconn.Close();
                }
                dbconn.Open();

                var orgService = new OrganizationService();
                var org = orgService.Find(orgID);

                {
                    //adapter.Fill(table);
                    try
                    {
                        orgName.Value = org.Name;
                        latitude.Value = org.Latitude.ToString();
                        longitude.Value = org.Longitude.ToString();
                        address.Value = org.Address;
                        City.Value = org.City;
                        streetNo.Value = org.StreetNumber.ToString();
                        streetName.Value = org.StreetName;
                        barangay.Value = org.Barangay;
                        province.Value = org.State;
                        builder.Value = org.Preacher;
                        branch.Value = org.Branch;
                        parent.Value = org.ParentOrganization;
                        contact.Value = org.ContactNumber;
                        website.Value = org.Website;
                        email.Value = org.Email;
                        date.Value = org.DateEstablished;
                        abouts.Value = org.About;
                        retreat.Value = org.RetreatSchedule;
                        recollection.Value = org.RecollectionSchedule;
                        camps.Value = org.CampSchedule;
                        talks.Value = org.TalkSchedule;
                        volunteerWorks.Value = org.VolunteerSchedule;
                        //metadesc.Value = org..ToString();
                        //metatitle.Value = church.MetaTitle.ToString();

                    }
                    catch (Exception ex)
                    {

                    }
                }
                organizationId.Value = orgID.ToString();
                OrgOtherInfo();
                worshipSched();
                massSched();
                bibleSched();
            }
        }

        private void OrgOtherInfo()
        {
            using (SqlConnection dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                {
                    dbconn.Close();
                }
                dbconn.Open();

                using (SqlCommand cmd = new SqlCommand("SELECT * FROM [tblOrganizationVentilation] where OrganizationID = " + organizationId.Value, dbconn))
                {
                    var reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        var ventId = Convert.ToInt32(reader["VentilationID"].ToString());

                        if (ventId == 1)
                        {
                            airCon.Checked = true;
                        }
                        if (ventId == 2)
                        {
                            ceiling.Checked = true;
                        }
                        if (ventId == 3)
                        {
                            wallFan.Checked = true;

                        }
                        if (ventId == 4)
                        {
                            standFan.Checked = true;

                        }
                    }

                    int ventID;
                    try
                    {
                        if (Convert.IsDBNull(reader["VentilationID"].ToString()))
                            ventID = 0;
                        else
                            ventID = Convert.ToInt32(reader["VentilationID"].ToString());
                    }
                    catch (Exception e)
                    {
                        ventID = 0;
                    }

                    reader.Close();
                }


                using (SqlCommand cmd = new SqlCommand("SELECT * FROM [tblOrgLocation] where OrganizationID = " + organizationId.Value, dbconn))
                {
                    var reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        var LocID = Convert.ToInt32(reader["OrgLocationID"].ToString());

                        if (LocID == 1)
                        {
                            church.Checked = true;
                        }
                        if (LocID == 2)
                        {
                            school.Checked = true;
                        }
                        if (LocID == 3)
                        {
                            mall.Checked = true;

                        }
                        if (LocID == 4)
                        {
                            publicPlace.Checked = true;

                        }
                        if (LocID == 5)
                        {
                            privatebuilding.Checked = true;

                        }
                    }

                    int LocId;
                    try
                    {
                        if (Convert.IsDBNull(reader["OrgLocationID"].ToString()))
                            LocId = 0;
                        else
                            LocId = Convert.ToInt32(reader["OrgLocationID"].ToString());
                    }
                    catch (Exception e)
                    {
                        LocId = 0;
                    }

                    reader.Close();
                }

                using (SqlCommand cmd = new SqlCommand("SELECT * FROM [tblOrganizationParking] where OrganizationID = " + organizationId.Value, dbconn))
                {
                    var reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        var parkID = Convert.ToInt32(reader["ParkingID"].ToString());

                        if (parkID == 1)
                        {
                            street.Checked = true;
                        }
                        if (parkID == 2)
                        {
                            mallPark.Checked = true;
                        }
                        if (parkID == 3)
                        {
                            privateLot.Checked = true;

                        }
                        if (parkID == 4)
                        {
                            otherParking.Checked = true;

                        }
                    }

                    int parkId;
                    try
                    {
                        if (Convert.IsDBNull(reader["ParkingID"].ToString()))
                            parkId = 0;
                        else
                            parkId = Convert.ToInt32(reader["ParkingID"].ToString());
                    }
                    catch (Exception e)
                    {
                        parkId = 0;
                    }

                    reader.Close();
                }


                using (SqlCommand cmd = new SqlCommand("SELECT * FROM [tblOrganizationActivities] where OrganizationID = " + organizationId.Value, dbconn))
                {
                    var reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        var actID = Convert.ToInt32(reader["ActivityID"].ToString());

                        if (actID == 2)
                        {
                            worship.Checked = true;
                        }
                        if (actID == 3)
                        {
                            bibleStudy.Checked = true;
                        }
                        if (actID == 4)
                        {
                            mass.Checked = true;

                        }
                        if (actID == 5)
                        {
                            retreats.Checked = true;

                        }
                        if (actID == 6)
                        {
                            recollect.Checked = true;
                        }
                        if (actID == 7)
                        {
                            vw.Checked = true;
                        }
                        if (actID == 8)
                        {
                            talk.Checked = true;

                        }
                        if (actID == 9)
                        {
                            camp.Checked = true;

                        }
                    }

                    int actId;
                    try
                    {
                        if (Convert.IsDBNull(reader["ActivityID"].ToString()))
                            actId = 0;
                        else
                            actId = Convert.ToInt32(reader["ActivityID"].ToString());
                    }
                    catch (Exception e)
                    {
                        actId = 0;
                    }

                    reader.Close();
                }

                using (SqlCommand cmd = new SqlCommand("SELECT * FROM [tblOrganizationAttendees] where OrganizationID = " + organizationId.Value, dbconn))
                {
                    var reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        var attID = Convert.ToInt32(reader["AttendeeID"].ToString());

                        if (attID == 1)
                        {
                            men.Checked = true;

                        }
                        if (attID == 2)
                        {
                            singles.Checked = true;
                        }
                        if (attID == 3)
                        {
                            prof.Checked = true;
                        }
                        if (attID == 4)
                        {
                            student.Checked = true;

                        }
                        if (attID == 5)
                        {
                            couples.Checked = true;

                        }
                        if (attID == 6)
                        {
                            women.Checked = true;
                        }
                        if (attID == 7)
                        {
                            missionaries.Checked = true;
                        }
                        if (attID == 8)
                        {
                            nonCath.Checked = true;

                        }
                    }

                    int attId;
                    try
                    {
                        if (Convert.IsDBNull(reader["AttendeeID"].ToString()))
                            attId = 0;
                        else
                            attId = Convert.ToInt32(reader["AttendeeID"].ToString());
                    }
                    catch (Exception e)
                    {
                        attId = 0;
                    }

                    reader.Close();
                }
            }
        }

        private void worshipSched()
        {
            using (SqlConnection dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                {
                    dbconn.Close();
                }
                dbconn.Open();

                SqlCommand cmd = new SqlCommand("SELECT [OrgWorshipScheduleID] " +
                                                ",[OrganizationID] " +
                                                ",[ScheduleID] " +
                                                ",[TimeStandardID] " +
                                                ",[Time] " +
                                                "FROM [tblWorshipSchedules] where OrganizationID = " + organizationId.Value, dbconn);

                var reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    var tr = new HtmlGenericControl("td");
                    var time = reader["Time"].ToString();

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
                    int id = Convert.ToInt32(reader["OrgWorshipScheduleID"].ToString());

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

                    tr.InnerHtml = string.Format("<tr name=\"{3}\"><td>{0}</td><td>{1}</td><td>{2}</td><td><i class=\"fa fa-remove\" id=\"delete\" data-id='" + id + "'></1>&nbsp&nbsp<i class=\"fa fa-edit\" id=\"edit\" data-id='" + id + "'></i></td></tr>", dayStr, from, to, id);
                    worshipTable.Controls.Add(tr);
                }
            }
        }

        [WebMethod]
        public static void UpdateWorshipDetails(int worshipDetailsId, int ScheduleId,
            string Time, int OrgId, int TimeStandard)
        {
            using (SqlConnection dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                {
                    dbconn.Close();
                }
                dbconn.Open();

                string query = String.Format("UPDATE tblWorshipSchedules SET ScheduleID = '{0}', Time = '{1}', TimeStandardID = '{2}' WHERE [OrgWorshipScheduleID] = {3}", ScheduleId, Time, TimeStandard, worshipDetailsId);

                SqlCommand cmd = new SqlCommand(query.ToString(), dbconn);

                cmd.ExecuteNonQuery();
            }
        }

        private void massSched()
        {
            using (SqlConnection dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                {
                    dbconn.Close();
                }
                dbconn.Open();

                SqlCommand cmd = new SqlCommand("SELECT [OrgMassID] " +
                                                ",[OrganizationID] " +
                                                ",[ScheduleID] " +
                                                ",[TimeStandardID] " +
                                                ",[Time] " +
                                                "FROM [tblMassDetails] where OrganizationID = " + organizationId.Value, dbconn);

                var reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    var tr = new HtmlGenericControl("td");
                    var time = reader["Time"].ToString();

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
                    int id = Convert.ToInt32(reader["OrgMassID"].ToString());

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

                    tr.InnerHtml = string.Format("<tr name=\"{3}\"><td>{0}</td><td>{1}</td><td>{2}</td><td><i class=\"fa fa-remove\" id=\"deletemass\" data-id='" + id + "'></1>&nbsp&nbsp<i class=\"fa fa-edit\" id=\"editmass\" data-id='" + id + "'></i></td></tr>", dayStr, from, to, id);
                    massTable.Controls.Add(tr);
                }
            }
        }

        [WebMethod]
        public static void UpdateMassDetails(int massDetailsId, int ScheduleId,
            string Time, int OrgId, int TimeStandard)
        {
            using (SqlConnection dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                {
                    dbconn.Close();
                }
                dbconn.Open();

                string query = String.Format("UPDATE tblMassDetails SET ScheduleID = '{0}', Time = '{1}', TimeStandardID = '{2}' WHERE [OrgMassID] = {3}", ScheduleId, Time, TimeStandard, massDetailsId);

                SqlCommand cmd = new SqlCommand(query.ToString(), dbconn);

                cmd.ExecuteNonQuery();
            }
        }

        private void bibleSched()
        {
            using (SqlConnection dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                {
                    dbconn.Close();
                }
                dbconn.Open();

                SqlCommand cmd = new SqlCommand("SELECT [OrgBibleScheduleID] " +
                                                ",[OrganizationID] " +
                                                ",[ScheduleID] " +
                                                ",[TimeStandardID] " +
                                                ",[Time] " +
                                                "FROM [tblBibleSchedules] where OrganizationID = " + organizationId.Value, dbconn);

                var reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    var tr = new HtmlGenericControl("td");
                    var time = reader["Time"].ToString();

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
                    int id = Convert.ToInt32(reader["OrgBibleScheduleID"].ToString());

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

                    tr.InnerHtml = string.Format("<tr name=\"{3}\"><td>{0}</td><td>{1}</td><td>{2}</td><td><i class=\"fa fa-remove\" id=\"deletebible\" data-id='" + id + "'></1>&nbsp&nbsp<i class=\"fa fa-edit\" id=\"editbible\" data-id='" + id + "'></i></td></tr>", dayStr, from, to, id);
                    bibleTable.Controls.Add(tr);
                }
            }
        }

        [WebMethod]
        public static void UpdateBibleDetails(int bibleDetailsId, int ScheduleId,
            string Time, int OrgId, int TimeStandard)
        {
            using (SqlConnection dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                {
                    dbconn.Close();
                }
                dbconn.Open();

                string query = String.Format("UPDATE tblBibleSchedules SET ScheduleID = '{0}', Time = '{1}', TimeStandardID = '{2}' WHERE [OrgMassID] = {3}", ScheduleId, Time, TimeStandard, bibleDetailsId);

                SqlCommand cmd = new SqlCommand(query.ToString(), dbconn);

                cmd.ExecuteNonQuery();
            }
        }
    }
}
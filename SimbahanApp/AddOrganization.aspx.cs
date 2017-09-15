using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SimbahanApp
{
    public partial class AddOrganization : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            using (SqlConnection dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                {
                    dbconn.Close();
                }
                dbconn.Open();

                var country = "Philippines";

                using (SqlCommand cmd = new SqlCommand("spInsertOrganizationInfo", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.AddWithValue("@OrganizationName", organizationName.Value);
                        cmd.Parameters.AddWithValue("@LastUpdate", DateTime.Now);
                        cmd.Parameters.AddWithValue("@CompleteAddress", address.Value);
                        cmd.Parameters.AddWithValue("@CityOrMunicipality", city.Value);
                        cmd.Parameters.AddWithValue("@StateOrProvince", province.Value);
                        cmd.Parameters.AddWithValue("@Country", country);
                        cmd.Parameters.AddWithValue("@DateEstablished", dateEstablished.Value);
                        cmd.Parameters.AddWithValue("@ParentOrganization", parentOrganization.Value);
                        cmd.Parameters.AddWithValue("@FeastBuilderOrPreacher", preacher.Value);
                        cmd.Parameters.AddWithValue("@BranchOrLocation", branch.Value);
                        cmd.Parameters.AddWithValue("@ContactNo", telephoneNumber.Value);
                        cmd.Parameters.AddWithValue("@EmailAddress", emailAdd.Value);
                        cmd.Parameters.AddWithValue("@Website", website.Value);
                        cmd.Parameters.Add("@organizationAutoID", SqlDbType.BigInt).Direction = ParameterDirection.Output;

                        var reader = cmd.ExecuteReader();

                        HttpContext.Current.Session["oid"] = Convert.ToInt32(cmd.Parameters["@organizationAutoID"].Value.ToString());
                        var orgID = Convert.ToInt32(HttpContext.Current.Session["oid"]);

                    }
                    catch (Exception ex)
                    {
                        throw new Exception(ex.Message.ToString());

                    }

                    StartInsertActivities(Convert.ToInt32(Session["oid"]));
                    StartInsertAttendees(Convert.ToInt32(Session["oid"]));
                    StartInsertVentilation(Convert.ToInt32(Session["oid"]));
                    StartInsertLocation(Convert.ToInt32(Session["oid"]));
                    //Session.Clear();
                    //Session.Abandon();
                }
            }
        }

        private void insertActivities(int ActID, int OrgID)
        {
            using (SqlConnection dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                {
                    dbconn.Close();
                }
                dbconn.Open();

                using (SqlCommand cmd = new SqlCommand("spInsertActivities", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.AddWithValue("@OrganizationID", OrgID);
                        cmd.Parameters.AddWithValue("@ActivityID", ActID);
                        cmd.ExecuteNonQuery();
                    }
                    catch (Exception ex)
                    {
                        throw new Exception(ex.Message.ToString());

                    }
                }
            }
        }

        private void StartInsertActivities(int OrgID)
        {

            if (worship.Checked == true)
            {
                var worship = 2;
                OrgID = Convert.ToInt32(HttpContext.Current.Session["oid"]);
                insertActivities(worship, OrgID);
            }
            if (bibleStudy.Checked == true)
            {
                var bibleStudy = 3;
                OrgID = Convert.ToInt32(HttpContext.Current.Session["oid"]);
                insertActivities(bibleStudy, OrgID);
            }
            if (mass.Checked == true)
            {
                var mass = 4;
                OrgID = Convert.ToInt32(HttpContext.Current.Session["oid"]);
                insertActivities(mass, OrgID);
            }
            if (retreats.Checked == true)
            {
                var retreats = 5;
                OrgID = Convert.ToInt32(HttpContext.Current.Session["oid"]);
                insertActivities(retreats, OrgID);
            }
            if (recollection.Checked == true)
            {
                var recollection = 6;
                OrgID = Convert.ToInt32(HttpContext.Current.Session["oid"]);
                insertActivities(recollection, OrgID);
            }
            if (volunteerWorks.Checked == true)
            {
                var volunter = 7;
                OrgID = Convert.ToInt32(HttpContext.Current.Session["oid"]);
                insertActivities(volunter, OrgID);
            }
            if (talks.Checked == true)
            {
                var talks = 8;
                OrgID = Convert.ToInt32(HttpContext.Current.Session["oid"]);
                insertActivities(talks, OrgID);
            }
            if (camps.Checked == true)
            {
                var camps = 9;
                OrgID = Convert.ToInt32(HttpContext.Current.Session["oid"]);
                insertActivities(camps, OrgID);
            }
        }

        private void insertAttendees(int AttID, int OrgID)
        {
            using (SqlConnection dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                {
                    dbconn.Close();
                }
                dbconn.Open();

                using (SqlCommand cmd = new SqlCommand("spInsertAttendees", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.AddWithValue("@OrganizationID", OrgID);
                        cmd.Parameters.AddWithValue("@AtteendeeID", AttID);
                        cmd.ExecuteNonQuery();

                    }
                    catch (Exception ex)
                    {
                        throw new Exception(ex.Message.ToString());

                    }
                }
            }
        }

        private void StartInsertAttendees(int OrgID)
        {

            if (men.Checked == true)
            {
                var men = 1;
                OrgID = Convert.ToInt32(HttpContext.Current.Session["oid"]);
                insertAttendees(men, OrgID);
            }
            if (women.Checked == true)
            {
                var women = 6;
                OrgID = Convert.ToInt32(HttpContext.Current.Session["oid"]);
                insertAttendees(women, OrgID);
            }
            if (singles.Checked == true)
            {
                var singles = 2;
                OrgID = Convert.ToInt32(HttpContext.Current.Session["oid"]);
                insertAttendees(singles, OrgID);
            }
            if (couples.Checked == true)
            {
                var couples = 5;
                OrgID = Convert.ToInt32(HttpContext.Current.Session["oid"]);
                insertAttendees(couples, OrgID);
            }
            if (professionals.Checked == true)
            {
                var professionals = 3;
                OrgID = Convert.ToInt32(HttpContext.Current.Session["oid"]);
                insertAttendees(professionals, OrgID);
            }
            if (students.Checked == true)
            {
                var students = 4;
                OrgID = Convert.ToInt32(HttpContext.Current.Session["oid"]);
                insertAttendees(students, OrgID);
            }
            if (missionaries.Checked == true)
            {
                var missionaries = 7;
                OrgID = Convert.ToInt32(HttpContext.Current.Session["oid"]);
                insertAttendees(missionaries, OrgID);
            }
            if (nonCatholic.Checked == true)
            {
                var nonCatholic = 8;
                OrgID = Convert.ToInt32(HttpContext.Current.Session["oid"]);
                insertAttendees(nonCatholic, OrgID);
            }
        }

        private void insertVentilation(int VentID, int OrgID)
        {
            using (SqlConnection dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                {
                    dbconn.Close();
                }
                dbconn.Open();

                using (SqlCommand cmd = new SqlCommand("spInsertVentilation", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.AddWithValue("@OrganizationID", OrgID);
                        cmd.Parameters.AddWithValue("@VentilationID", VentID);
                        cmd.ExecuteNonQuery();

                    }
                    catch (Exception ex)
                    {
                        throw new Exception(ex.Message.ToString());

                    }
                }
            }
        }

        private void StartInsertVentilation(int OrgID)
        {
            if (aircon.Checked == true)
            {
                var aircon = 1;
                OrgID = Convert.ToInt32(HttpContext.Current.Session["oid"]);
                insertVentilation(aircon, OrgID);
            }
            if (ceiling.Checked == true)
            {
                var ceiling = 2;
                OrgID = Convert.ToInt32(HttpContext.Current.Session["oid"]);
                insertVentilation(ceiling, OrgID);
            }
            if (wallfan.Checked == true)
            {
                var wallfan = 3;
                OrgID = Convert.ToInt32(HttpContext.Current.Session["oid"]);
                insertVentilation(wallfan, OrgID);
            }
            if (stdfan.Checked == true)
            {
                var stdfan = 4;
                OrgID = Convert.ToInt32(HttpContext.Current.Session["oid"]);
                insertVentilation(stdfan, OrgID);
            }
        }

        private void insertLocation(int LocID, int OrgID)
        {
            using (SqlConnection dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                {
                    dbconn.Close();
                }
                dbconn.Open();

                using (SqlCommand cmd = new SqlCommand("spInsertLocation", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.AddWithValue("@OrganizationID", OrgID);
                        cmd.Parameters.AddWithValue("@OrgLocationID", LocID);
                        cmd.ExecuteNonQuery();

                    }
                    catch (Exception ex)
                    {
                        throw new Exception(ex.Message.ToString());

                    }
                }
            }
        }

        private void StartInsertLocation(int OrgID)
        {
            int locID = 0;

            if (locChurch.Checked == true)
            {
                locID = 1;
                OrgID = Convert.ToInt32(HttpContext.Current.Session["oid"]);
                insertLocation(locID, OrgID);
            }
            else if (locSchool.Checked == true)
            {
                locID = 2;
                OrgID = Convert.ToInt32(HttpContext.Current.Session["oid"]);
                insertLocation(locID, OrgID);
            }
            else if (locMall.Checked == true)
            {
                locID = 3;
                OrgID = Convert.ToInt32(HttpContext.Current.Session["oid"]);
                insertLocation(locID, OrgID);
            }
            else if (locPublic.Checked == true)
            {
                locID = 4;
                OrgID = Convert.ToInt32(HttpContext.Current.Session["oid"]);
                insertLocation(locID, OrgID);
            }
            else if (locPrivate.Checked == true)
            {
                locID = 5;
                OrgID = Convert.ToInt32(HttpContext.Current.Session["oid"]);
                insertLocation(locID, OrgID);
            }
        }
    }
}
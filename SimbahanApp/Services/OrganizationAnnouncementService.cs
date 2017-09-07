using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using SimbahanApp.Models;
using SimbahanApp.Transformers;

namespace SimbahanApp.Services
{
    public class OrganizationAnnouncementService : IBasicService<OrganizationAnnouncement>
    {
        private OrganizationAnnouncementTransformer _organizationAnnouncementTransformer;

        public OrganizationAnnouncementService()
        {
            _organizationAnnouncementTransformer = new OrganizationAnnouncementTransformer();
        }

        public OrganizationAnnouncement Create(OrganizationAnnouncement model)
        {
            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spInsertOrgAnnouncement", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@organizationID", model.OrganizationId);
                        cmd.Parameters.AddWithValue("@title", model.Title);
                        cmd.Parameters.AddWithValue("@description", model.Description);
                        cmd.Parameters.AddWithValue("@address", model.Venue);
                        cmd.Parameters.AddWithValue("@startDate", model.StartDate);
                        cmd.Parameters.AddWithValue("@startTime", model.StartTime);
                        cmd.Parameters.AddWithValue("@endDate", model.EndDate);
                        cmd.Parameters.AddWithValue("@endTime", model.EndTime);
                        cmd.Parameters.AddWithValue("@imagePath", model.ImagePath);


                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                            model = _organizationAnnouncementTransformer.Transform(reader);
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return model;
        }

        public OrganizationAnnouncement Find(int id)
        {
            var model = new OrganizationAnnouncement();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spFindOrgAnnouncement", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@announcementID", id);


                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                            model = _organizationAnnouncementTransformer.Transform(reader);
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return model;
        }

        public OrganizationAnnouncement Update(int id, OrganizationAnnouncement model)
        {
            var updatedAnnouncement = new OrganizationAnnouncement();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spUpdateOrgAnnouncement", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@announcementID", id);
                        cmd.Parameters.AddWithValue("@title", model.Title);
                        cmd.Parameters.AddWithValue("@description", model.Description);
                        cmd.Parameters.AddWithValue("@address", model.Venue);
                        cmd.Parameters.AddWithValue("@imagePath", model.ImagePath);
                        cmd.Parameters.AddWithValue("@organizationID", model.OrganizationId);
                        cmd.Parameters.AddWithValue("@startDate", model.StartDate);
                        cmd.Parameters.AddWithValue("@startTime", model.StartTime);
                        cmd.Parameters.AddWithValue("@endDate", model.EndDate);
                        cmd.Parameters.AddWithValue("@endTime", model.EndTime);


                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                            updatedAnnouncement = _organizationAnnouncementTransformer.Transform(reader);
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return updatedAnnouncement;
        }

        public void Delete(OrganizationAnnouncement model)
        {
            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spRemoveOrgAnnouncement", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@announcementID", model.Id);


                        cmd.ExecuteNonQuery();
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }
        }

        public List<OrganizationAnnouncement> Get(int relationId = 0, int relationId2 = 0, int relationId3 = 0, int relationId4 = 0)
        {
            var announcements = new List<OrganizationAnnouncement>();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spGetOrgAnnouncement", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@simbahanID", relationId);


                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                            announcements.Add(_organizationAnnouncementTransformer.Transform(reader));

                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return announcements;
        }
    }
}
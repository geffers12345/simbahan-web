using System;
using System.Data;
using SimbahanApp.Models;
using System.Configuration;
using System.Data.SqlClient;
using SimbahanApp.Transformers;
using System.Collections.Generic;

namespace SimbahanApp.Services
{
    public class AnnouncementService : IBasicService<Announcement>
    {
        private AnnouncementTransformer _announcementTransformer;

        public AnnouncementService()
        {
            _announcementTransformer = new AnnouncementTransformer();
        }

        public Announcement Create(Announcement model)
        {
            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spInsertAnnouncement", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@simbahanID", model.SimbahanId);
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
                            model = _announcementTransformer.Transform(reader);
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return model;
        }

        public Announcement Find(int id)
        {
            var model = new Announcement();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spFindAnnouncement", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@announcementID", id);


                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                            model = _announcementTransformer.Transform(reader);
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return model;
        }

        public Announcement Update(int id, Announcement model)
        {
            var updatedAnnouncement = new Announcement();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spUpdateAnnouncement", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@announcementID", id);
                        cmd.Parameters.AddWithValue("@title", model.Title);
                        cmd.Parameters.AddWithValue("@description", model.Description);
                        cmd.Parameters.AddWithValue("@address", model.Venue);
                        cmd.Parameters.AddWithValue("@imagePath", model.ImagePath);
                        cmd.Parameters.AddWithValue("@simbahanID", model.SimbahanId);
                        cmd.Parameters.AddWithValue("@startDate", model.StartDate);
                        cmd.Parameters.AddWithValue("@startTime", model.StartTime);
                        cmd.Parameters.AddWithValue("@endDate", model.EndDate);
                        cmd.Parameters.AddWithValue("@endTime", model.EndTime);


                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                            updatedAnnouncement = _announcementTransformer.Transform(reader);
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return updatedAnnouncement;
        }

        public void Delete(Announcement model)
        {
            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spRemoveAnnouncement", dbconn))
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

        public List<Announcement> Get(int relationId = 0, int relationId2 = 0, int relationId3 = 0, int relationId4 = 0)
        {
            var announcements = new List<Announcement>();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spRemoveAnnouncement", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@simbahanID", relationId);


                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                            announcements.Add(_announcementTransformer.Transform(reader));

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
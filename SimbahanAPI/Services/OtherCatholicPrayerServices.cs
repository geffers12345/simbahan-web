using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using SimbahanApp.Transformers;

namespace SimbahanApp.Services
{
    public class OtherCatholicPrayerService : IBasicService<Models.OtherCatholicPrayer>
    {
        private readonly OtherCatholicPrayerTransformer _otherCatholicPrayerTransformer;

        public OtherCatholicPrayerService()
        {
            _otherCatholicPrayerTransformer = new OtherCatholicPrayerTransformer();
        }

        public Models.OtherCatholicPrayer Create(Models.OtherCatholicPrayer model)
        {
            throw new NotImplementedException();
        }

        public Models.OtherCatholicPrayer Find(int id)
        {
            var otherCatholicPrayer = new Models.OtherCatholicPrayer();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spFindOtherCatholicPrayer", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@othercatholicprayerID", id);


                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                            otherCatholicPrayer = _otherCatholicPrayerTransformer.Transform(reader);
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return otherCatholicPrayer;
        }

        public Models.OtherCatholicPrayer Update(int id, Models.OtherCatholicPrayer model)
        {
            throw new NotImplementedException();
        }

        public void Delete(Models.OtherCatholicPrayer model)
        {
            throw new NotImplementedException();
        }

        public List<Models.OtherCatholicPrayer> Get(int relationId = 0, int relationId2 = 0, int relationId3 = 0,
            int relationId4 = 0)
        {
            var otherCatholicPrayers = new List<Models.OtherCatholicPrayer>();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spGetOtherCatholicPrayers", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;


                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                            otherCatholicPrayers.Add(_otherCatholicPrayerTransformer.Transform(reader));
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return otherCatholicPrayers;
        }

        public List<string> GetCategories()
        {
            var categories = new List<string>();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spGetOtherCatholicPrayerCategories", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;


                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                            categories.Add(reader["Categories"].ToString());
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return categories;
        }
    }
}
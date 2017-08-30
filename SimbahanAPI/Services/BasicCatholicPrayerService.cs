using System;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using SimbahanApp.Transformers;
using System.Collections.Generic;

namespace SimbahanApp.Services
{
    public class BasicCatholicPrayerService : IBasicService<Models.BasicCatholicPrayer>
    {
        private BasicCatholicPrayerTransformer _basicCatholicPrayerTransformer;

        public BasicCatholicPrayerService()
        {
            _basicCatholicPrayerTransformer = new BasicCatholicPrayerTransformer();
        }

        public Models.BasicCatholicPrayer Create(Models.BasicCatholicPrayer model)
        {
            throw new NotImplementedException();
        }

        public Models.BasicCatholicPrayer Find(int id)
        {
            var basicCatholicPrayer = new Models.BasicCatholicPrayer();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spFindBasicCatholicPrayer", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@BasicCatholicPrayerID", id);


                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                            basicCatholicPrayer = _basicCatholicPrayerTransformer.Transform(reader);
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return basicCatholicPrayer;
        }

        public Models.BasicCatholicPrayer Update(int id, Models.BasicCatholicPrayer model)
        {
            throw new NotImplementedException();
        }

        public void Delete(Models.BasicCatholicPrayer model)
        {
            throw new NotImplementedException();
        }

        public List<Models.BasicCatholicPrayer> Get(int relationId = 0, int relationId2 = 0, int relationId3 = 0, int relationId4 = 0)
        {
            var basicCatholicPrayers = new List<Models.BasicCatholicPrayer>();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spGetBasicCatholicPrayers", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;


                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                            basicCatholicPrayers.Add(_basicCatholicPrayerTransformer.Transform(reader));
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return basicCatholicPrayers;
        }
    }
}
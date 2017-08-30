using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using SimbahanApp.Transformers;

namespace SimbahanApp.Services
{
    public class DevotionService : IBasicService<Models.Devotion>
    {
        private readonly DevotionTransformer _devotionTransformer;

        public DevotionService()
        {
            _devotionTransformer = new DevotionTransformer();
        }

        public Models.Devotion Create(Models.Devotion model)
        {
            throw new NotImplementedException();
        }

        public Models.Devotion Find(int id)
        {
            var devotion = new Models.Devotion();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spFindDevotion", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@devotionID", id);


                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                            devotion = _devotionTransformer.Transform(reader);
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return devotion;
        }

        public Models.Devotion Update(int id, Models.Devotion model)
        {
            throw new NotImplementedException();
        }

        public void Delete(Models.Devotion model)
        {
            throw new NotImplementedException();
        }

        public List<Models.Devotion> Get(int relationId = 0, int relationId2 = 0, int relationId3 = 0,
            int relationId4 = 0)
        {
            var devotions = new List<Models.Devotion>();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spGetDevotions", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;


                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                            devotions.Add(_devotionTransformer.Transform(reader));
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return devotions;
        }
    }
}
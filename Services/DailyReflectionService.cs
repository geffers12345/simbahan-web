using System;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using SimbahanApp.Transformers;
using System.Collections.Generic;

namespace SimbahanApp.Services
{
    public class DailyReflectionService : IBasicService<Models.DailyReflection>
    {
        private readonly DailyReflectionTransformer _dailyReflectionTransformer;

        public DailyReflectionService()
        {
            _dailyReflectionTransformer = new DailyReflectionTransformer();
        }

        public Models.DailyReflection Create(Models.DailyReflection model)
        {
            throw new NotImplementedException();
        }

        public Models.DailyReflection Find(int id)
        {
            var dailyReflection = new Models.DailyReflection();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spFindDailyReflection", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@id", id);


                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                            dailyReflection = _dailyReflectionTransformer.Transform(reader);
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return dailyReflection;
        }

        public Models.DailyReflection FindByDate(DateTime date)
        {
            var reflection = new Models.DailyReflection();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spGetDailyReflection", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@dateofReflection", date.ToString("MM/dd/yyyy"));


                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                            reflection = _dailyReflectionTransformer.Transform(reader);
                    }
                    catch (Exception)
                    {
                        // Ignored
                    }
                }
            }

            return reflection;
        }

        public Models.DailyReflection Update(int id, Models.DailyReflection model)
        {
            throw new NotImplementedException();
        }

        public void Delete(Models.DailyReflection model)
        {
            throw new NotImplementedException();
        }

        public List<Models.DailyReflection> Get(int relationId = 0, int relationId2 = 0, int relationId3 = 0,
            int relationId4 = 0)
        {
            throw new NotImplementedException();
        }
    }
}
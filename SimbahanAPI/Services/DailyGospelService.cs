using System;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using SimbahanApp.Transformers;
using System.Collections.Generic;

namespace SimbahanApp.Services
{
    public class DailyGospelService : IBasicService<Models.DailyGospel>
    {
        private readonly DailyGospelTransformer _dailyGospelTransformer;

        public DailyGospelService()
        {
            _dailyGospelTransformer = new DailyGospelTransformer();
        }

        public Models.DailyGospel Create(Models.DailyGospel model)
        {
            throw new NotImplementedException();
        }

        public Models.DailyGospel Find(int id)
        {
            var dailyGospel = new Models.DailyGospel();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spFindDailyGospel", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@id", id);


                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            dailyGospel = _dailyGospelTransformer.Transform(reader);
                            dailyGospel.DateOfGospel = Convert.ToDateTime(reader["DateOfGospel"]);
                        }
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return dailyGospel;
        }

        public Models.DailyGospel FindByDate(DateTime date)
        {
            var gospel = new Models.DailyGospel();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spGetDailyGospel", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@dateofGospel", date.ToString("MM/dd/yyyy"));


                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                            gospel = _dailyGospelTransformer.Transform(reader);
                    }
                    catch (Exception)
                    {
                        // Ignored
                    }
                }
            }
            return gospel;
        }

        public Models.DailyGospel Update(int id, Models.DailyGospel model)
        {
            throw new NotImplementedException();
        }

        public void Delete(Models.DailyGospel model)
        {
            throw new NotImplementedException();
        }

        public List<Models.DailyGospel> Get(int relationId = 0, int relationId2 = 0, int relationId3 = 0,
            int relationId4 = 0)
        {
            throw new NotImplementedException();
        }
    }
}
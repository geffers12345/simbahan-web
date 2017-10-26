using System;
using System.Data;
using SimbahanApp.Models;
using System.Configuration;
using System.Data.SqlClient;
using SimbahanApp.Transformers;
using System.Collections.Generic;

namespace SimbahanApp.Services
{
    public class DailyGospelReflectionService : IBasicService<DailyGospelReflection>
    {
        private readonly GospelReflectionTransformer _dailyGospelReflectionTransformer;
        private readonly DailyGospelTransformer _dailyGospelTransformer;
        private readonly UserTransformer _userTransformer;

        public DailyGospelReflectionService()
        {
            _dailyGospelReflectionTransformer = new GospelReflectionTransformer();
            _dailyGospelTransformer = new DailyGospelTransformer();
            _userTransformer = new UserTransformer();
        }

        public DailyGospelReflection Create(DailyGospelReflection model)
        {
            var dailyGospelReflection = new DailyGospelReflection();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spInsertUserDailyGospelReflection", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@userID", model.UserId);
                        cmd.Parameters.AddWithValue("@gospelID", model.DailyGospelId);
                        cmd.Parameters.AddWithValue("@title", model.Title);
                        cmd.Parameters.AddWithValue("@content", model.ReflectionContent);


                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            dailyGospelReflection = _dailyGospelReflectionTransformer.Transform(reader);
                            dailyGospelReflection.DailyGospel = _dailyGospelTransformer.Transform(reader);
                            dailyGospelReflection.User = _userTransformer.Transform(reader);
                        }
                    }
                    catch (Exception e)
                    {
                        // ignored
                    }
                }
            }

            return dailyGospelReflection;
        }

        public DailyGospelReflection Find(int id)
        {
            throw new NotImplementedException();
        }

        public DailyGospelReflection Update(int id, DailyGospelReflection model)
        {
            var dailyGospelReflection = new DailyGospelReflection();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spUpdateUserDailyGospelReflection", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@userID", model.UserId);
                        cmd.Parameters.AddWithValue("@gospelID", model.DailyGospelId);
                        cmd.Parameters.AddWithValue("@title", model.Title);
                        cmd.Parameters.AddWithValue("@content", model.ReflectionContent);


                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            dailyGospelReflection = _dailyGospelReflectionTransformer.Transform(reader);
                            dailyGospelReflection.DailyGospel = _dailyGospelTransformer.Transform(reader);
                            dailyGospelReflection.User = _userTransformer.Transform(reader);
                        }
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return dailyGospelReflection;
        }

        public void Delete(DailyGospelReflection model)
        {
            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spRemoveUserDailyGospelReflection", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@userID", model.UserId);
                        cmd.Parameters.AddWithValue("@gospelID", model.DailyGospelId);


                        cmd.ExecuteNonQuery();
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }
        }

        /// <summary>
        /// </summary>
        /// <param name="relationId">User Id</param>
        /// <param name="relationId2"></param>
        /// <param name="relationId3"></param>
        /// <param name="relationId4"></param>
        /// <returns></returns>
        public List<DailyGospelReflection> Get(int relationId = 0, int relationId2 = 0, int relationId3 = 0,
            int relationId4 = 0)
        {
            var dailyGospelReflections = new List<DailyGospelReflection>();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spGetUserDailyGospelReflection", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@userID", relationId);
                        cmd.Parameters.AddWithValue("@gospelID", 0);


                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            var dailyGospelReflection = _dailyGospelReflectionTransformer.Transform(reader);
                            dailyGospelReflection.DailyGospel = _dailyGospelTransformer.Transform(reader);
                            dailyGospelReflection.User = _userTransformer.Transform(reader);
                            dailyGospelReflection.GospelDate = Convert.ToDateTime(reader["DateOfGospel"]);

                            dailyGospelReflections.Add(dailyGospelReflection);
                        }
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return dailyGospelReflections;
        }

        public bool UserHasReflection(int userId, int gospelId)
        {
            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spCheckUserHasGospelReflection", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@userID", userId);
                        cmd.Parameters.AddWithValue("@gospelID", gospelId);

                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                            if (Convert.ToInt32(reader["result"]) == 1)
                                return true;
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return false;
        }

        public DailyGospelReflection GetUserReflection(int userId, int gospelId)
        {
            var dailyGospelReflection = new DailyGospelReflection();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spGetUserDailyGospelReflection", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@userID", userId);
                        cmd.Parameters.AddWithValue("@gospelID", gospelId);


                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            dailyGospelReflection = _dailyGospelReflectionTransformer.Transform(reader);
                            dailyGospelReflection.DailyGospel = _dailyGospelTransformer.Transform(reader);
                            dailyGospelReflection.User = _userTransformer.Transform(reader);
                            dailyGospelReflection.GospelDate = Convert.ToDateTime(reader["DateOfGospel"]);
                        }
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return dailyGospelReflection;
        }
    }
}
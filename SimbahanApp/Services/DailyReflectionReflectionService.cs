using System;
using System.Data;
using SimbahanApp.Models;
using System.Configuration;
using System.Data.SqlClient;
using SimbahanApp.Transformers;
using System.Collections.Generic;

namespace SimbahanApp.Services
{
    public class DailyReflectionReflectionService : IBasicService<DailyReflectionReflection>
    {
        private readonly DailyReflectionTransformer _dailyReflectionTransformer;
        private readonly ReflectionReflectionTransformer _reflectionReflectionTransformer;
        private readonly UserTransformer _userTransformer;

        public DailyReflectionReflectionService()
        {
            _reflectionReflectionTransformer = new ReflectionReflectionTransformer();
            _dailyReflectionTransformer = new DailyReflectionTransformer();
            _userTransformer = new UserTransformer();
        }

        public DailyReflectionReflection Create(DailyReflectionReflection model)
        {
            var dailyReflectionReflection = new DailyReflectionReflection();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spInsertUserDailyReflectionReflection", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@userID", model.UserId);
                        cmd.Parameters.AddWithValue("@reflectionID", model.DailyReflectionId);
                        cmd.Parameters.AddWithValue("@title", model.Title);
                        cmd.Parameters.AddWithValue("@content", model.ReflectionContent);


                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            dailyReflectionReflection = _reflectionReflectionTransformer.Transform(reader);
                            dailyReflectionReflection.DailyReflection = _dailyReflectionTransformer.Transform(reader);
                            dailyReflectionReflection.User = _userTransformer.Transform(reader);
                        }
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return dailyReflectionReflection;
        }

        public DailyReflectionReflection Find(int id)
        {
            throw new NotImplementedException();
        }

        public DailyReflectionReflection Update(int id, DailyReflectionReflection model)
        {
            var dailyReflectionReflection = new DailyReflectionReflection();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spUpdateUserDailyReflectionReflection", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@userID", model.UserId);
                        cmd.Parameters.AddWithValue("@reflectionID", model.DailyReflectionId);
                        cmd.Parameters.AddWithValue("@title", model.Title);
                        cmd.Parameters.AddWithValue("@content", model.ReflectionContent);


                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            dailyReflectionReflection = _reflectionReflectionTransformer.Transform(reader);
                            dailyReflectionReflection.DailyReflection = _dailyReflectionTransformer.Transform(reader);
                            dailyReflectionReflection.User = _userTransformer.Transform(reader);
                        }
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return dailyReflectionReflection;
        }

        public void Delete(DailyReflectionReflection model)
        {
            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spRemoveUserDailyReflectionReflection", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@userID", model.UserId);
                        cmd.Parameters.AddWithValue("@reflectionID", model.DailyReflectionId);


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
        public List<DailyReflectionReflection> Get(int relationId = 0, int relationId2 = 0, int relationId3 = 0,
            int relationId4 = 0)
        {
            var dailyRefletionReflections = new List<DailyReflectionReflection>();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spGetUserDailyReflectionReflection", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@userID", relationId);
                        cmd.Parameters.AddWithValue("@reflectionID", 0);


                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            var reflection = _reflectionReflectionTransformer.Transform(reader);
                            reflection.DailyReflection = _dailyReflectionTransformer.Transform(reader);
                            reflection.User = _userTransformer.Transform(reader);
                            reflection.ReflectionDate = Convert.ToDateTime(reader["DateOfReflection"]);

                            dailyRefletionReflections.Add(reflection);
                        }
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return dailyRefletionReflections;
        }

        public bool UserHasReflection(int userId, int reflectionId)
        {
            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spCheckUserHasReflectionReflection", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@userID", userId);
                        cmd.Parameters.AddWithValue("@reflectionID", reflectionId);

                        var dr = cmd.ExecuteReader();

                        while (dr.Read())
                            if (Convert.ToInt32(dr["result"]) == 1)
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


        public DailyReflectionReflection GetUserReflection(int userId, int reflectionId)
        {
            var reflectionReflectionTransformer = new ReflectionReflectionTransformer();
            var reflection = new DailyReflectionReflection();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spGetUserDailyReflectionReflection", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@userID", userId);
                        cmd.Parameters.AddWithValue("@reflectionID", reflectionId);


                        var dr = cmd.ExecuteReader();

                        while (dr.Read())
                        {
                            reflection = reflectionReflectionTransformer.Transform(dr);
                            reflection.ReflectionDate = Convert.ToDateTime(dr["DateOfReflection"]);
                        }
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return reflection;
        }
    }
}
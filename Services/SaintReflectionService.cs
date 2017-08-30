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
    public class SaintReflectionService : IBasicService<SaintReflection>
    {
        private readonly SaintTransformer _saintTransformer;
        private readonly UserTransformer _userTransformer;
        private readonly SaintReflectionTransformer _saintReflectionTransformer;

        public SaintReflectionService()
        {
            _saintReflectionTransformer = new SaintReflectionTransformer();
            _saintTransformer = new SaintTransformer();
            _userTransformer = new UserTransformer();
        }

        public bool UserHasReflection(int userId, int saintId)
        {
            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spCheckUserHasSaintReflection", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@userID", userId);
                        cmd.Parameters.AddWithValue("@saintID", saintId);


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

        public SaintReflection GetUserReflection(int userId, int saintId)
        {
            var saintReflection = new SaintReflection();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spGetUserDailySaintReflection", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@userID", userId);
                        cmd.Parameters.AddWithValue("@saintID", saintId);


                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            saintReflection = _saintReflectionTransformer.Transform(reader);
                            saintReflection.Saint = _saintTransformer.Transform(reader);
                            saintReflection.User = _userTransformer.Transform(reader);
                        }
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return saintReflection;
        }

        #region IBasicService Implementation

        public SaintReflection Create(SaintReflection model)
        {
            var saintReflection = new SaintReflection();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spInsertSaintReflection", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@userID", model.UserId);
                        cmd.Parameters.AddWithValue("@saintID", model.SaintId);
                        cmd.Parameters.AddWithValue("@title", model.Title);
                        cmd.Parameters.AddWithValue("@content", model.Content);


                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            saintReflection = _saintReflectionTransformer.Transform(reader);
                            saintReflection.User = _userTransformer.Transform(reader);
                            saintReflection.Saint = _saintTransformer.Transform(reader);
                        }
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return saintReflection;
        }

        public SaintReflection FindSaintReflection(int userId, int saintId)
        {
            var saintReflection = new SaintReflection();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spFindSaintReflection", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@userID", userId);
                        cmd.Parameters.AddWithValue("@saintID", saintId);


                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            saintReflection = _saintReflectionTransformer.Transform(reader);
                            saintReflection.User = _userTransformer.Transform(reader);
                            saintReflection.Saint = _saintTransformer.Transform(reader);
                        }
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return saintReflection;
        }

        public SaintReflection Find(int id)
        {
            var saintReflection = new SaintReflection();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spFindSaintReflectionById", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@saintReflectionID", id);


                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            saintReflection = _saintReflectionTransformer.Transform(reader);
                            saintReflection.User = _userTransformer.Transform(reader);
                            saintReflection.Saint = _saintTransformer.Transform(reader);
                        }
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return saintReflection;
        }

        public SaintReflection Update(int id, SaintReflection model)
        {
            var saintReflection = new SaintReflection();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spUpdateSaintReflection", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@userID", model.UserId);
                        cmd.Parameters.AddWithValue("@saintID", model.SaintId);
                        cmd.Parameters.AddWithValue("@title", model.Title);
                        cmd.Parameters.AddWithValue("@content", model.Content);


                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            saintReflection = _saintReflectionTransformer.Transform(reader);
                            saintReflection.User = _userTransformer.Transform(reader);
                            saintReflection.Saint = _saintTransformer.Transform(reader);
                        }
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return saintReflection;
        }

        public void Delete(SaintReflection model)
        {
            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spRemoveSaintReflection", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@userID", model.UserId);
                        cmd.Parameters.AddWithValue("@saintID", model.SaintId);


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
        /// 
        /// </summary>
        /// <param name="relationId">User Id</param>
        /// <param name="relationId2"></param>
        /// <param name="relationId3"></param>
        /// <param name="relationId4"></param>
        /// <returns></returns>
        public List<SaintReflection> Get(int relationId = 0, int relationId2 = 0, int relationId3 = 0, int relationId4 = 0)
        {
            var saintReflections = new List<SaintReflection>();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spGetUserDailySaintReflection", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@userID", relationId);
                        cmd.Parameters.AddWithValue("@saintID", 0);


                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            var saintReflection = _saintReflectionTransformer.Transform(reader);
                            saintReflection.User = _userTransformer.Transform(reader);
                            saintReflection.Saint = _saintTransformer.Transform(reader);

                            saintReflections.Add(saintReflection);
                        }
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return saintReflections;
        }

        #endregion
    }
}
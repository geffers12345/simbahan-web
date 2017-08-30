using System;
using System.Data;
using SimbahanApp.Models;
using System.Configuration;
using System.Data.SqlClient;
using SimbahanApp.Transformers;
using System.Collections.Generic;

namespace SimbahanApp.Services
{
    public class VisitaIglesiaService : IBasicService<Models.VisitaIglesia>
    {
        private readonly ChurchTransformer _churchTransformer;
        private readonly UserTransformer _userTransformer;
        private readonly VisitaIglesiaTransformer _visitaIglesiaTransformer;
        // TODO: CREATE A TRANSFORMER FOR STATUS.

        public VisitaIglesiaService()
        {
            _visitaIglesiaTransformer = new VisitaIglesiaTransformer();
            _churchTransformer = new ChurchTransformer();
            _userTransformer = new UserTransformer();
        }

        public Models.VisitaIglesia Create(Models.VisitaIglesia model)
        {
            var visitaIglesia = new Models.VisitaIglesia();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spInsertVisitaIglesia", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@userID", model.UserId);
                        cmd.Parameters.AddWithValue("@simbahanID", model.SimbahanId);
                        cmd.Parameters.AddWithValue("@statusID", model.StatusId);


                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            visitaIglesia = _visitaIglesiaTransformer.Transform(reader);
                            visitaIglesia.Church = _churchTransformer.Transform(reader);
                            visitaIglesia.User = _userTransformer.Transform(reader);
                        }
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return visitaIglesia;
        }

        public Models.VisitaIglesia Find(int id)
        {
            throw new NotImplementedException();
        }

        public Models.VisitaIglesia Update(int id, Models.VisitaIglesia model)
        {
            var visitaIglesia = new Models.VisitaIglesia();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spUpdateVisitaIglesiaStatus", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@userID", model.UserId);
                        cmd.Parameters.AddWithValue("@simbahanID", model.SimbahanId);
                        cmd.Parameters.AddWithValue("@statusID", model.StatusId);


                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            visitaIglesia = _visitaIglesiaTransformer.Transform(reader);
                            visitaIglesia.Church = _churchTransformer.Transform(reader);
                            visitaIglesia.User = _userTransformer.Transform(reader);
                        }
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return visitaIglesia;
        }

        public void Delete(Models.VisitaIglesia model)
        {
            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spResetUserVisitaIglesia", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@userID", model.UserId);

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
        public List<Models.VisitaIglesia> Get(int relationId = 0, int relationId2 = 0, int relationId3 = 0,
            int relationId4 = 0)
        {
            var visitaIglesias = new List<Models.VisitaIglesia>();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spGetVisitaIglesia", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@userID", relationId);


                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            var visitaIglesia = _visitaIglesiaTransformer.Transform(reader);
                            visitaIglesia.Church = _churchTransformer.Transform(reader);
                            visitaIglesia.User = _userTransformer.Transform(reader);

                            char[] separator = {','};
                            var photos = reader["ChurchPhotos"].ToString().Split(separator, StringSplitOptions.None);

                            foreach (var photo in photos)
                                visitaIglesia.Church.ChurchPhotos.Add(new ChurchPhotosModel
                                {
                                    ChurchPhotos = photo == string.Empty ? "" : @"Images\Photos\Thumbnails\" + photo
                                });

                            visitaIglesias.Add(visitaIglesia);
                        }
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return visitaIglesias;
        }

        public bool HasExistingData(int id)
        {
            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spCheckUserHasExistingVisitaIglesia", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@userID", id);

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

        public void ResetCurrentlyHere(int userId)
        {
            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spResetCurrentlyHere", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@userID", userId);

                        cmd.ExecuteNonQuery();
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }
        }
    }
}
using System;
using System.Data;
using SimbahanApp.Models;
using System.Configuration;
using System.Data.SqlClient;
using SimbahanApp.Transformers;
using System.Collections.Generic;

namespace SimbahanApp.Services
{
    public class SaintService : IBasicService<Saint>
    {
        private readonly SaintTransformer _saintTransformer;

        public SaintService()
        {
            _saintTransformer = new SaintTransformer();
        }

        public Saint Create(Saint model)
        {
            throw new NotImplementedException();
        }

        public Saint Find(int id)
        {
            var saint = new Saint();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spFindSaints", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@SaintsID", id);


                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                            saint = _saintTransformer.Transform(reader);
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return saint;
        }

        public Saint Update(int id, Saint model)
        {
            throw new NotImplementedException();
        }

        public void Delete(Saint model)
        {
            throw new NotImplementedException();
        }

        public List<Saint> Get(int relationId = 0, int relationId2 = 0, int relationId3 = 0, int relationId4 = 0)
        {
            var saints = new List<Saint>();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();

                dbconn.Open();

                using (var cmd = new SqlCommand("spGetSaints", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;


                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                            saints.Add(_saintTransformer.Transform(reader));
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return saints;
        }

        public List<string> GetPatron()
        {
            var patron = new List<string>();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spGetSaintsPatron", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;


                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                            patron.Add(reader["Categories"].ToString());
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return patron;
        }
    }
}
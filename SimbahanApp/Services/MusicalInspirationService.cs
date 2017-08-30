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
    public class MusicalInspirationService : IBasicService<Models.MusicalInspiration>
    {
        private readonly InspirationalMusicTransformer _inspirationalMusicTransformer;

        public MusicalInspirationService()
        {
            _inspirationalMusicTransformer = new InspirationalMusicTransformer();
        }

        public Models.MusicalInspiration Create(Models.MusicalInspiration model)
        {
            throw new NotImplementedException();
        }

        public Models.MusicalInspiration Find(int id)
        {
            var musicalInspiration = new Models.MusicalInspiration();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spFindInspirationalMusic", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@musicID", id);


                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                            musicalInspiration = _inspirationalMusicTransformer.Transform(reader);
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return musicalInspiration;
        }

        public Models.MusicalInspiration Update(int id, Models.MusicalInspiration model)
        {
            throw new NotImplementedException();
        }

        public void Delete(Models.MusicalInspiration model)
        {
            throw new NotImplementedException();
        }
        
        public List<Models.MusicalInspiration> Get(int relationId = 0, int relationId2 = 0, int relationId3 = 0, int relationId4 = 0)
        {
            throw new NotImplementedException();
        }

        public List<Models.MusicalInspiration> GetAll(string mood, int userId)
        {
            var musicalInspirations = new List<Models.MusicalInspiration>();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spGetInspirationalMusic", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@moods", mood);
                        cmd.Parameters.AddWithValue("@title", "");
                        cmd.Parameters.AddWithValue("@userID", userId);


                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                            musicalInspirations.Add(_inspirationalMusicTransformer.Transform(reader));
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return musicalInspirations;
        }
    }
}
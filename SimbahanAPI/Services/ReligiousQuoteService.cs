using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using SimbahanApp.Models;
using SimbahanApp.Transformers;

namespace SimbahanApp.Services
{
    public class ReligiousQuoteService : IBasicService<ReligiousQuote>
    {
        private readonly ReligiousQuoteTransformer _religiousQuoteTransformer;

        public ReligiousQuoteService()
        {
            _religiousQuoteTransformer = new ReligiousQuoteTransformer();
        }

        public ReligiousQuote Create(ReligiousQuote model)
        {
            throw new NotImplementedException();
        }

        public ReligiousQuote Find(int id)
        {
            var religiousQuote = new ReligiousQuote();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spFindReligiousQuote", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@religiousQuoteID", id);


                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                            religiousQuote = _religiousQuoteTransformer.Transform(reader);
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }

                return religiousQuote;
            }
        }

        public ReligiousQuote Update(int id, ReligiousQuote model)
        {
            throw new NotImplementedException();
        }

        public void Delete(ReligiousQuote model)
        {
            throw new NotImplementedException();
        }

        /// <summary>
        /// </summary>
        /// <param name="relationId">Mood</param>
        /// <param name="relationId2">User Id</param>
        /// <param name="relationId3"></param>
        /// <param name="relationId4"></param>
        /// <returns></returns>
        public List<ReligiousQuote> Get(int relationId = 0, int relationId2 = 0, int relationId3 = 0,
            int relationId4 = 0)
        {
            var mood = new Mood();
            var religiousQuotes = new List<ReligiousQuote>();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spGetReligiousQuote", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@moods", mood.GetValue(relationId));
                        cmd.Parameters.AddWithValue("@userID", relationId2);

                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            var religiousQuote = _religiousQuoteTransformer.Transform(reader);
                            religiousQuote.IsFavorite = Convert.ToBoolean(reader["isFavorite"]);

                            religiousQuotes.Add(religiousQuote);
                        }
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                    finally
                    {
                        dbconn.Close();
                        dbconn.Dispose();
                    }
                }
            }

            return religiousQuotes;
        }
    }
}
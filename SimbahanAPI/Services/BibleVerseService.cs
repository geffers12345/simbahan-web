using System;
using System.Data;
using SimbahanApp.Models;
using System.Configuration;
using System.Data.SqlClient;
using SimbahanApp.Transformers;
using System.Collections.Generic;

namespace SimbahanApp.Services
{
    public class BibleVerseService : IBasicService<BibleVerse>
    {
        private BibleVerseTransformer _bibleVerseTransformer;

        public BibleVerseService()
        {
            _bibleVerseTransformer = new BibleVerseTransformer();
        }

        public BibleVerse Create(BibleVerse model)
        {
            throw new NotImplementedException();
        }

        public void Delete(BibleVerse model)
        {
            throw new NotImplementedException();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="relationId">Mood</param>
        /// <param name="relationId2">User Id</param>
        /// <param name="relationId3"></param>
        /// <param name="relationId4"></param>
        /// <returns></returns>
        public List<BibleVerse> Get(int relationId = 0, int relationId2 = 0, int relationId3 = 0, int relationId4 = 0)
        {
            var bibleVerses = new List<BibleVerse>();
            var mood = new Mood();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spGetBibleVerse", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@moods", mood.GetValue(relationId));
                        cmd.Parameters.AddWithValue("@userID", relationId2);

                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            var verse = _bibleVerseTransformer.Transform(reader);
                            verse.IsFavorite = Convert.ToBoolean(reader["isFavorite"]);

                            bibleVerses.Add(verse);
                        }
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return bibleVerses;
        }

        public BibleVerse Update(int id, BibleVerse model)
        {
            throw new NotImplementedException();
        }

        public BibleVerse Find(int id)
        {
            var bibleVerse = new BibleVerse();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spFindBibleVerse", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@verseID", id);


                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                            bibleVerse = _bibleVerseTransformer.Transform(reader);
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return bibleVerse;
        }
    }
}
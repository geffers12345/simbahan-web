using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Services;
using System.Web.UI;

namespace SimbahanApp
{
    public partial class Musical_Alone : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Page.Title = "Inspirational Music About Alone | MyCatholicPortal.org";
            //Page.MetaKeywords = "alone, music, inspiration";
            //Page.MetaDescription =
            //    "Need Inspiration if you're feeling alone. Listen, Reflect and Be Motivated by our Selection of Inspirational Music.";
        }

        [WebMethod]
        public static Models.MusicalInspiration getSong(string title)
        {
            var songs = new Models.MusicalInspiration();

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
                        cmd.Parameters.AddWithValue("@moods", "alone");
                        cmd.Parameters.AddWithValue("@title", title);

                        var _reader = cmd.ExecuteReader();

                        while (_reader.Read())
                        {
                            songs.SongTitle = _reader["SongTitle"].ToString();
                            songs.Artist = _reader["Artist"].ToString();
                            songs.Lyrics = _reader["Lyrics"].ToString();
                        }
                    }
                    catch (Exception ex)
                    {
                        throw new Exception(ex.Message);
                    }
                    finally
                    {
                        dbconn.Close();
                        dbconn.Dispose();
                    }
                }

                return songs;
            }
        }
    }
}
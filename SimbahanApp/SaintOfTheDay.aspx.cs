using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Services;
using System.Web.UI;
using SimbahanApp.Models;
using SimbahanApp.Services;
using SimbahanApp.Transformers;

namespace SimbahanApp
{
    public partial class SaintOfTheDay : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                DateTime readingDate;

                if (Request["date"] != null)
                    readingDate = Convert.ToDateTime(Request["date"]);
                else
                    readingDate = DateTime.UtcNow;

                var saints = getSaints(readingDate);

                SaintsID.Value = saints.Id.ToString();
                SaintDate.InnerHtml = saints.PublicationDate.DayOfWeek + ", " +
                                      saints.PublicationDate.ToString("MMMM dd, yyyy");
                FeaturedSaint.InnerHtml = saints.Name;
                FeastDay.InnerHtml = saints.FeastDay;
                PatronOf.InnerHtml = saints.Patron;
                BirthDate.InnerHtml = saints.BirthDate;
                DeathDate.InnerHtml = saints.DeathDate;
                SaintBio.InnerHtml = saints.Biography;
                CanonizedDate.InnerHtml = saints.CanonizeDate;
                ImagePath.Src = saints.ImagePath;

                DateTime VerseDate;

                if (Request["date"] != null)
                    VerseDate = Convert.ToDateTime(Request["date"]);
                else
                    VerseDate = DateTime.UtcNow;

                var verse = getVerse(VerseDate);

                BibleQuote.InnerHtml = verse.BibleVerseContent;
                BibleVerse.InnerHtml = verse.ChapterTitle;


                DateTime QuoteDate;

                if (Request["date"] != null)
                    QuoteDate = Convert.ToDateTime(Request["date"]);
                else
                    QuoteDate = DateTime.UtcNow;

                var quote = getQuote(QuoteDate);

                RelQuote.InnerHtml = quote.Quote;
                Author.InnerHtml = quote.Author;


                var service = new SaintReflectionService();

                if (service.UserHasReflection(Auth.user().Id, Convert.ToInt32(saints.Id)))
                {
                    var reflection = service.GetUserReflection(Auth.user().Id, Convert.ToInt32(saints.Id));
                    GReflectTitle.Value = reflection.Title;
                    GReflectContent.Value = reflection.Content;
                }
            }
        }

        [WebMethod]
        public static Saint getSaints(DateTime date)
        {
            var saint = new Saint();
            var saintTransformer = new SaintTransformer();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spGetSaintOfTheDay", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@dateofFeast", date.ToString("MMMM d, yyyy"));

                        var reader = cmd.ExecuteReader();
                        
                        while (reader.Read())
                            saint = saintTransformer.Transform(reader);
                    }
                    catch (Exception)
                    {
                        // Ignored
                    }
                }
            }

            return saint;
        }

        [WebMethod]
        public static BibleVerse getVerse(DateTime date)
        {
            var bibleVerseTransformer = new BibleVerseTransformer();
            var verse = new BibleVerse();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spGetDailyBibleVerse", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@dateofVerse", date.ToString("MM/dd/yyyy"));

                        var _reader = cmd.ExecuteReader();

                        while (_reader.Read())
                            verse = bibleVerseTransformer.Transform(_reader);
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
                return verse;
            }
        }

        [WebMethod]
        public static ReligiousQuote getQuote(DateTime date)
        {
            var religiosQuoteTransformer = new ReligiousQuoteTransformer();
            var quote = new ReligiousQuote();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spGetDailyReligiousQuote", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@dateofQuote", date.ToString("MM/dd/yyyy"));

                        var _reader = cmd.ExecuteReader();

                        while (_reader.Read())
                            quote = religiosQuoteTransformer.Transform(_reader);
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
                return quote;
            }
        }

        [WebMethod]
        public static void SaveSaintReflection(int saintId, string title, string content)
        {
            var service = new SaintReflectionService();

            var saintReflection = new SaintReflection
            {
                SaintId = saintId,
                UserId = Auth.user().Id,
                Title = title,
                Content = content
            };

            if (service.UserHasReflection(Auth.user().Id, saintId))
            {
                service.Update(saintId, saintReflection);
            }
            else
            {
                service.Create(saintReflection);
            }
        }

        //[WebMethod]
        //public static DailyGospelReflection GetUserReflection(int gospelId)
        //{
        //    DailyGospelReflectionService service = new DailyGospelReflectionService();

        //    return service.GetUserReflection(Auth.user().Id, gospelId);
        //}
    }
}
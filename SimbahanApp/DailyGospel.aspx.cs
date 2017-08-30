using System;
using System.Data;
using System.Web.UI;
using SimbahanApp.Models;
using System.Web.Services;
using System.Configuration;
using SimbahanApp.Services;
using System.Data.SqlClient;
using SimbahanApp.Transformers;

namespace SimbahanApp
{
    public partial class DailyGospel : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Models.DailyGospel dailyGospel;
                var dailyGospelService = new DailyGospelService();

                if (Page.RouteData.Values["gospel-id"] != null)
                {
                    int id;
                    if (int.TryParse(Page.RouteData.Values["gospel-id"].ToString(), out id))
                    {
                        dailyGospel = dailyGospelService.Find(id);
                    }
                    else if (Page.RouteData.Values["gospel-id"].ToString().Length > 1)
                    {
                        dailyGospel =
                            dailyGospelService.FindByDate(Convert.ToDateTime(Page.RouteData.Values["gospel-id"]));
                    }
                    else
                    {
                        dailyGospel = dailyGospelService.FindByDate(DateTime.Now);
                    }
                }

                else
                {
                    var date = Request["date"] != null ? Convert.ToDateTime(Request["date"]) : DateTime.Now;

                    dailyGospel = GetReading(date);
                }

                GospelID.Value = dailyGospel.Id.ToString();
                SourceContent.InnerHtml = dailyGospel.Source;
                GospelDate.InnerHtml = dailyGospel.DateOfGospel.DayOfWeek + ", " +
                                       dailyGospel.DateOfGospel.ToString("MMMM dd, yyyy");
                FRTitle.InnerHtml = dailyGospel.FirstReadingTitle;
                FRContent.InnerHtml = dailyGospel.FirstReadingContent;
                RPTitle.InnerHtml = dailyGospel.ResponsorialPsalmTitle;
                RPContent.InnerHtml = dailyGospel.ResponsorialPsalmContent;
                SRTitle.InnerHtml = dailyGospel.SecondReadingTitle;
                SRContent.InnerHtml = dailyGospel.SecondReadingContent;
                VBGTitle.InnerHtml = dailyGospel.VerseBeforeGospelTitle;
                VBGContent.InnerHtml = dailyGospel.VerseBeforeGospelContent;
                DGospelTitle.InnerHtml = dailyGospel.GospelTitle;
                DGospelContent.InnerHtml = dailyGospel.GospelContent;

                SecondReading.Attributes.Add("style",
                    dailyGospel.SecondReadingTitle == "" ? "display:none" : "display:block");

                SecondReading.Attributes.Add("style",
                    dailyGospel.SecondReadingContent == "" ? "display:none" : "display:block");

                VerseBeforeGospel.Attributes.Add("style",
                    dailyGospel.VerseBeforeGospelTitle == "" ? "display:none" : "display:block");

                VerseBeforeGospel.Attributes.Add("style",
                    dailyGospel.VerseBeforeGospelContent == "" ? "display:none" : "display:block");


                DateTime dateParam;

                dateParam = Request["date"] != null ? Convert.ToDateTime(Request["date"]) : DateTime.Now;

                var verse = GetVerse(dateParam);
                var quote = GetQuote(dateParam);


                BibleQuote.InnerHtml = verse.BibleVerseContent;
                BibleVerse.InnerHtml = verse.ChapterTitle;

                RelQuote.InnerHtml = quote.Quote;
                Author.InnerHtml = quote.Author;


                var service = new DailyGospelReflectionService();

                if (!service.UserHasReflection(Auth.user().Id, dailyGospel.Id)) return;

                var reflection = service.GetUserReflection(Auth.user().Id, dailyGospel.Id);
                GReflectTitle.Value = reflection.Title;
                GReflectContent.Value = reflection.ReflectionContent;
            }
        }

        [WebMethod]
        public static Models.DailyGospel GetReading(DateTime date)
        {
            var service = new DailyGospelService();

            return service.FindByDate(date);
        }

        [WebMethod]
        public static BibleVerse GetVerse(DateTime date)
        {
            var verse = new BibleVerse();
            var bibleVerseTransformer = new BibleVerseTransformer();

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


                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                            verse = bibleVerseTransformer.Transform(reader);
                    }
                    catch (Exception)
                    {
                        // Ignored
                    }
                }
                return verse;
            }
        }

        [WebMethod]
        public static ReligiousQuote GetQuote(DateTime date)
        {
            var religiousTransformer = new ReligiousQuoteTransformer();
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

                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            quote = religiousTransformer.Transform(reader);
                        }
                    }
                    catch (Exception)
                    {
                        // Ignored
                    }
                }
                return quote;
            }
        }

        [WebMethod]
        public static void SaveDailyGospelReflection(int gospelId, string title, string content)
        {
            var service = new DailyGospelReflectionService();

            if (service.UserHasReflection(Auth.user().Id, gospelId))
            {
                var dailyGospelReflection = new DailyGospelReflection
                {
                    UserId = Auth.user().Id,
                    DailyGospelId = gospelId,
                    Title = title,
                    ReflectionContent = content
                };

                if (string.IsNullOrWhiteSpace(title) && string.IsNullOrWhiteSpace(content))
                    service.Delete(dailyGospelReflection);
                else
                    service.Update(gospelId, dailyGospelReflection);
            }
            else
            {
                var dailyGospelReflection = new DailyGospelReflection
                {
                    UserId = Auth.user().Id,
                    DailyGospelId = gospelId,
                    Title = title,
                    ReflectionContent = content
                };

                service.Create(dailyGospelReflection);
            }
        }

        [WebMethod]
        public static DailyGospelReflection GetUserReflection(int gospelId)
        {
            var service = new DailyGospelReflectionService();

            return service.GetUserReflection(Auth.user().Id, gospelId);
        }
    }
}
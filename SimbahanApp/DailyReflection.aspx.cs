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
    public partial class DailyReflection : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                DateTime reflectionDate;

                if (Request["date"] != null)
                    reflectionDate = Convert.ToDateTime(Request["date"]);
                else
                    reflectionDate = DateTime.UtcNow;

                var reflection = GetReflection(reflectionDate);

                ReflectionID.Value = reflection.Id.ToString();
                SourceContent.InnerHtml = reflection.Source;
                ReflectionDate.InnerHtml = reflection.DateOfReflection.DayOfWeek + ", " +
                                           reflection.DateOfReflection.ToString("MMMM dd, yyyy");
                FirstTitle.InnerHtml = reflection.FirstContentTitle;
                FContent.InnerHtml = reflection.FirstContent;
                SCTitle.InnerHtml = reflection.SecondContentTitle;
                SContent.InnerHtml = reflection.SecondContent;
                TCTitle.InnerHtml = reflection.ThirdContentTitle;
                TContent.InnerHtml = reflection.ThirdContent;
                FTitle.InnerHtml = reflection.FourthContentTitle;
                FTContent.InnerHtml = reflection.FourthContent;
                FiveTitle.InnerHtml = reflection.FifthContentTitle;
                FiveContent.InnerHtml = reflection.FifthContent;
                SixTitle.InnerHtml = reflection.SixthContentTitle;
                SixContent.InnerHtml = reflection.SixthContent;
                PContent.InnerHtml = reflection.Prayer;


                if (reflection.SecondContentTitle == "")
                    SecondContent.Attributes.Add("style", "display:none");
                else
                    SecondContent.Attributes.Add("style", "display:block");

                if (reflection.SecondContent == "")
                    SecondContent.Attributes.Add("style", "display:none");
                else
                    SecondContent.Attributes.Add("style", "display:block");

                if (reflection.ThirdContentTitle == "")
                    ThirdContent.Attributes.Add("style", "display:none");
                else
                    ThirdContent.Attributes.Add("style", "display:block");

                if (reflection.ThirdContent == "")
                    ThirdContent.Attributes.Add("style", "display:none");
                else
                    ThirdContent.Attributes.Add("style", "display:block");

                if (reflection.FourthContentTitle == "")
                    FourthContent.Attributes.Add("style", "display:none");
                else
                    FourthContent.Attributes.Add("style", "display:block");

                if (reflection.FourthContent == "")
                    FourthContent.Attributes.Add("style", "display:none");
                else
                    FourthContent.Attributes.Add("style", "display:block");

                if (reflection.FifthContentTitle == "")
                    FifthContent.Attributes.Add("style", "display:none");
                else
                    FifthContent.Attributes.Add("style", "display:block");

                if (reflection.FifthContent == "")
                    FifthContent.Attributes.Add("style", "display:none");
                else
                    FifthContent.Attributes.Add("style", "display:block");

                if (reflection.SixthContentTitle == "")
                    SixthContent.Attributes.Add("style", "display:none");
                else
                    SixthContent.Attributes.Add("style", "display:block");

                if (reflection.SixthContent == "")
                    SixthContent.Attributes.Add("style", "display:none");
                else
                    SixthContent.Attributes.Add("style", "display:block");

                DateTime VerseDate;

                if (Request["date"] != null)
                    VerseDate = Convert.ToDateTime(Request["date"]);
                else
                    VerseDate = DateTime.UtcNow;

                var verse = GetVerse(VerseDate);

                BibleQuote.InnerHtml = verse.BibleVerseContent;
                BibleVerse.InnerHtml = verse.ChapterTitle;

                DateTime QuoteDate;

                if (Request["date"] != null)
                    QuoteDate = Convert.ToDateTime(Request["date"]);
                else
                    QuoteDate = DateTime.UtcNow;

                var quote = GetQuote(QuoteDate);

                RelQuote.InnerHtml = quote.Quote;
                Author.InnerHtml = quote.Author;

                var reflectionService = new DailyReflectionReflectionService();

                if (reflectionService.UserHasReflection(Auth.user().Id, reflection.Id))
                {
                    var reflectionInstance = reflectionService.GetUserReflection(Auth.user().Id, reflection.Id);

                    DReflectTitle.Value = reflectionInstance.Title;
                    DReflectContent.Value = reflectionInstance.ReflectionContent;
                }
            }
        }

        [WebMethod]
        public static Models.DailyReflection GetReflection(DateTime date)
        {
            return new DailyReflectionService().FindByDate(date);
        }

        [WebMethod]
        public static BibleVerse GetVerse(DateTime date)
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
            var religiousQuoteTransformer = new ReligiousQuoteTransformer();
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
                            quote = religiousQuoteTransformer.Transform(reader);
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
        public static void SaveDailyReflectionReflection(int reflectionId, string title, string content)
        {
            var service = new DailyReflectionReflectionService();

            if (service.UserHasReflection(Auth.user().Id, reflectionId))
            {
                var dailyReflectionReflection = new DailyReflectionReflection
                {
                    UserId = Auth.user().Id,
                    DailyReflectionId = reflectionId,
                    Title = title,
                    ReflectionContent = content
                };

                if (string.IsNullOrWhiteSpace(title) && string.IsNullOrWhiteSpace(content))
                    service.Delete(dailyReflectionReflection);
                else
                    service.Update(reflectionId, dailyReflectionReflection);
            }
            else
            {
                var dailyReflectionReflection = new DailyReflectionReflection
                {
                    UserId = Auth.user().Id,
                    DailyReflectionId = reflectionId,
                    Title = title,
                    ReflectionContent = content
                };

                service.Create(dailyReflectionReflection);
            }
        }

        [WebMethod]
        public static DailyReflectionReflection GetUserReflection(int reflectionId)
        {
            var service = new DailyReflectionReflectionService();

            return service.GetUserReflection(Auth.user().Id, reflectionId);
        }
    }
}
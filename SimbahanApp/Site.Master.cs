using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using SimbahanApp.Components;
using SimbahanApp.Models;
using SimbahanApp.Services;

namespace SimbahanApp
{
    public partial class SiteMaster : MasterPage
    {
        private const string AntiXsrfTokenKey = "__AntiXsrfToken";
        private const string AntiXsrfUserNameKey = "__AntiXsrfUserName";
        private string _antiXsrfTokenValue;

        public string MetaTitle { get; set; }
        public string MetaDescription { get; set; }
        public string MetaUrl { get; set; }
        public string MetaImage { get; set; }
        public string GoogleMetaDescription { get; set; }

        protected void Page_Init(object sender, EventArgs e)
        {
            GoogleMetaDescription = "Your single access to all your catholic needs.";
            if (Page.RouteData.Values["bible-verse-id"] != null)
            {
                var bibleVerseService = new BibleVerseService();

                var verse = bibleVerseService.Find(Convert.ToInt32(Page.RouteData.Values["bible-verse-id"]));

                MetaDescription = verse.BibleVerseContent;
                GoogleMetaDescription = MetaDescription;
                MetaTitle = "Bible Verse";
                MetaUrl = "http://www.mycatholicportal.org/BibleVerse.aspx";
                MetaImage = "http://www.mycatholicportal.org/Images/BibleVerse.png";
            }

            if (Page.RouteData.Values["religious-quote-id"] != null)
            {
                var religiousQuoteService = new ReligiousQuoteService();

                var religiousQuote =
                    religiousQuoteService.Find(Convert.ToInt32(Page.RouteData.Values["religious-quote-id"]));

                MetaDescription = religiousQuote.Quote;
                GoogleMetaDescription = MetaDescription;
                MetaTitle = "Religious Quote";
                MetaUrl = "http://www.mycatholicportal.org/ReligiousQuote.aspx";
                MetaImage = "http://www.mycatholicportal.org/Images/RelQuotes.png";
            }

            if (Page.RouteData.Values["music-id"] != null)
            {
                var musicalInspirationService = new MusicalInspirationService();

                var music =
                    musicalInspirationService.Find(Convert.ToInt32(Page.RouteData.Values["music-id"]));

                MetaDescription = "Currently playing " + music.SongTitle + " by " + music.Artist;
                GoogleMetaDescription = MetaDescription;
                MetaTitle = "Musical Inspiration";
                MetaUrl = "http://www.mycatholicportal.org/MusicalInspirations.aspx";
                MetaImage = "http://www.mycatholicportal.org/Images/Musical.png";
            }

            if (Page.RouteData.Values["church-id"] != null)
            {
                var churchService = new ChurchService();

                var church = churchService.Find(Convert.ToInt32(Page.RouteData.Values["church-id"]));

                char[] separator = { ',' };
                MetaTitle = church.Parish;
                MetaDescription = church.ChurchHistory.Split(separator)[0];
                GoogleMetaDescription = MetaDescription;
                MetaUrl = "http://www.mycatholicportal.org/Church/" + church.SimbahanID;
                MetaImage = church.ChurchPhotos.Count > 0
                    ? "http://www.mycatholicportal.org/Images/" + church.ChurchPhotos[0].ChurchPhotos
                    : "";
            }

            if (Page.RouteData.Values["organization-id"] != null)
            {
                var organizationService = new OrganizationService();

                var church = organizationService.Find(Convert.ToInt32(Page.RouteData.Values["organization-id"]));

                char[] separator = { ',' };
                MetaTitle = church.Name;
                MetaDescription = "";
                MetaUrl = "http://www.mycatholicportal.org/Organization/" + church.Id;
                MetaImage = "";
            }

            if (Page.RouteData.Values["devote-id"] != null)
            {
                var devotionService = new DevotionService();

                var devotion = devotionService.Find(Convert.ToInt32(Page.RouteData.Values["devote-id"]));

                char[] separator = { ',' };
                MetaTitle = devotion.Title;
                MetaDescription = devotion.Prayer.Split(separator)[0];
                GoogleMetaDescription = MetaDescription;
                MetaUrl = "http://www.mycatholicportal.org/Dvote/" + devotion.Id;
                MetaImage = "http://www.mycatholicportal.org/Images/prayersdefault.jpg";
                //MetaImage = church.ChurchPhotos.Count > 0 ? "http://www.mycatholicportal.org/Images/" + church.ChurchPhotos[0].ChurchPhotos : "";
            }

            if (Page.RouteData.Values["prayer-id"] != null)
            {
                var bcpService = new BasicCatholicPrayerService();

                var bcp = bcpService.Find(Convert.ToInt32(Page.RouteData.Values["prayer-id"]));

                char[] separator = { ',' };
                MetaTitle = bcp.Title;
                MetaDescription = bcp.Prayer.Split(separator)[0];
                GoogleMetaDescription = MetaDescription;
                MetaUrl = "http://www.mycatholicportal.org/Prayer/" + bcp.Id;
                MetaImage = "http://www.mycatholicportal.org/Images/prayersdefault.jpg";
                //MetaImage = church.ChurchPhotos.Count > 0 ? "http://www.mycatholicportal.org/Images/" + church.ChurchPhotos[0].ChurchPhotos : "";
            }

            if (Page.RouteData.Values["other-prayer-id"] != null)
            {
                var ocpService = new OtherCatholicPrayerService();

                var ocp = ocpService.Find(Convert.ToInt32(Page.RouteData.Values["other-prayer-id"]));

                char[] separator = { ',' };
                MetaTitle = ocp.Title;
                MetaDescription = ocp.Prayer.Split(separator)[0];
                GoogleMetaDescription = MetaDescription;
                MetaUrl = "http://www.mycatholicportal.org/OtherPrayer/" + ocp.Id;
                MetaImage = "http://www.mycatholicportal.org/Images/prayersdefault.jpg";
                //MetaImage = church.ChurchPhotos.Count > 0 ? "http://www.mycatholicportal.org/Images/" + church.ChurchPhotos[0].ChurchPhotos : "";
            }

            if (Page.RouteData.Values["saint-id"] != null)
            {
                var saintService = new SaintService();

                var saint = saintService.Find(Convert.ToInt32(Page.RouteData.Values["saint-id"]));

                MetaTitle = saint.Name;
                MetaDescription = saint.Biography;
                GoogleMetaDescription = MetaDescription;
                MetaUrl = "http://www.mycatholicportal.org/Saint/" + saint.Id;
            }

            if (Page.RouteData.Values["gospel-id"] != null)
            {
                var dailyGospelService = new DailyGospelService();
                int id;
                Models.DailyGospel gospel;

                if (int.TryParse(Page.RouteData.Values["gospel-id"].ToString(), out id))
                {
                    gospel = dailyGospelService.Find(id);
                }
                else if (Page.RouteData.Values["gospel-id"].ToString().Length > 1)
                {
                    gospel = dailyGospelService.FindByDate(Convert.ToDateTime(Page.RouteData.Values["gospel-id"]));
                }
                else
                {
                    gospel = dailyGospelService.FindByDate(DateTime.Now);
                }

                MetaDescription = gospel.FirstReadingContent;
                GoogleMetaDescription = MetaDescription;
                MetaTitle = "Daily Gospel";
                MetaUrl = "http://www.mycatholicportal.org/Gospel/" + gospel.Id;
                MetaImage = "http://www.mycatholicportal.org/Images/dailyreadings.jpg";
            }

            if (Page.RouteData.Values["daily-reflection-id"] != null)
            {
                var reflectionService = new DailyReflectionService();
                int id;
                Models.DailyReflection reflection;

                if (int.TryParse(Page.RouteData.Values["daily-reflection-id"].ToString(), out id))
                {
                    reflection = reflectionService.Find(id);
                }
                else if (Page.RouteData.Values["daily-reflection-id"].ToString().Length > 1)
                {
                    reflection =
                        reflectionService.FindByDate(Convert.ToDateTime(Page.RouteData.Values["daily-reflection-id"]));
                }
                else
                {
                    reflection = reflectionService.FindByDate(DateTime.Now);
                }

                MetaDescription = reflection.FirstContentTitle;
                GoogleMetaDescription = MetaDescription;
                MetaTitle = "Daily Reflection";
                MetaImage = "http://www.mycatholicportal.org/Images/dailyreadings.jpg";
                MetaUrl = "http://www.mycatholicportal.org/Reflection/" + reflection.Id;
                MetaImage = "http://www.mycatholicportal.org/Images/dailyreadings.jpg";
            }

            if (Page.RouteData.Values["announcement-id"] != null)
            {
                var announcementService = new AnnouncementService();

                var announcement = announcementService.Find(Convert.ToInt32(Page.RouteData.Values["announcement-id"]));

                char[] separator = { ',' };
                MetaTitle = announcement.Title;
                MetaDescription = announcement.Description;
                MetaImage = announcement.ImagePath;
                GoogleMetaDescription = MetaDescription;
                MetaUrl = "http://www.mycatholicportal.org/Announcement/" + announcement.Id;
                //MetaImage = church.ChurchPhotos.Count > 0 ? "http://www.mycatholicportal.org/Images/" + church.ChurchPhotos[0].ChurchPhotos : "";
            }

            // The code below helps to protect against XSRF attacks
            var requestCookie = Request.Cookies[AntiXsrfTokenKey];
            Guid requestCookieGuidValue;
            if (requestCookie != null && Guid.TryParse(requestCookie.Value, out requestCookieGuidValue))
            {
                // Use the Anti-XSRF token from the cookie
                _antiXsrfTokenValue = requestCookie.Value;
                Page.ViewStateUserKey = _antiXsrfTokenValue;
            }
            else
            {
                // Generate a new Anti-XSRF token and save to the cookie
                _antiXsrfTokenValue = Guid.NewGuid().ToString("N");
                Page.ViewStateUserKey = _antiXsrfTokenValue;

                var responseCookie = new HttpCookie(AntiXsrfTokenKey)
                {
                    HttpOnly = true,
                    Value = _antiXsrfTokenValue
                };
                if (FormsAuthentication.RequireSSL && Request.IsSecureConnection)
                    responseCookie.Secure = true;
                Response.Cookies.Set(responseCookie);
            }

            Page.PreLoad += master_Page_PreLoad;
        }

        protected void master_Page_PreLoad(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Set Anti-XSRF token
                ViewState[AntiXsrfTokenKey] = Page.ViewStateUserKey;
                ViewState[AntiXsrfUserNameKey] = Context.User.Identity.Name ?? string.Empty;
            }
            else
            {
                // Validate the Anti-XSRF token
                if ((string)ViewState[AntiXsrfTokenKey] != _antiXsrfTokenValue
                    || (string)ViewState[AntiXsrfUserNameKey] != (Context.User.Identity.Name ?? string.Empty))
                    throw new InvalidOperationException("Validation of Anti-XSRF token failed.");
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            // Only display notification for authenticated users.
            if (!Auth.Check())
                return;

            //            var notificationService = new NotificationService();
            //
            //            UnreadNotificationCount.InnerHtml = notificationService.GetNumberOfUnreadNotification(Auth.user().Id)
            //                .ToString();
            //
            //            var notifications = notificationService.Get(Auth.user().Id);
            //            foreach (var notification in notifications)
            //                NotificationItemContainer.InnerHtml += new NotificationItem(notification).ToHtml();
        }

        protected void Unnamed_LoggingOut(object sender, LoginCancelEventArgs e)
        {
            Context.GetOwinContext().Authentication.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
        }

        protected void LogOut(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();

            Response.Redirect("Login.aspx");
        }

        [WebMethod]
        public static List<Notification> GetNotifications()
        {
            if (!Auth.Check())
                return new List<Notification>();

            var notificationService = new NotificationService();

            return notificationService.Get(Auth.user().Id);
        }
    }
}
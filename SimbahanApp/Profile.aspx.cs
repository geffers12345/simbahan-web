using System;
using System.Collections.Generic;
using System.Net;
using System.Web;
using System.Web.Security;
using System.Web.Services;
using System.Web.UI;
using SimbahanApp.Components;
using SimbahanApp.Models;
using SimbahanApp.Services;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace SimbahanApp.Account
{
    public partial class Profile : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (SqlConnection dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                {
                    dbconn.Close();
                }
                dbconn.Open();
                if (Auth.Check())
                {
                    Name.InnerHtml = Auth.user().FullName;
                    firstName.InnerHtml = Auth.user().FirstName;
                    lastName.InnerHtml = Auth.user().LastName;
                    email.InnerHtml = Auth.user().Email;
                    gender.InnerHtml = Auth.user().Gender;
                    birthday.InnerHtml = Auth.user().DateOfBirth;

                    if (Auth.user().RoleID == 3)
                    {

                        manage.Attributes["href"] = "#" + tab5.ClientID;

                        SqlCommand cmd = new SqlCommand("SELECT Simbahan.SimbahanID, Simbahan.Parish FROM Simbahan INNER JOIN ChurchRoles ON ChurchRoles.SimbahanID = Simbahan.SimbahanID WHERE ChurchRoles.RegID = '" + Auth.user().Id + "'", dbconn);

                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            var li = new HtmlGenericControl("li");
                            li.InnerHtml = string.Format("<a href=\"{0}\">{1}</a>", "http://www.mycatholicportal.org/Churches?id=" + reader["SimbahanID"], reader["Parish"]);
                            ManageableChurch.Controls.Add(li);
                        }
                        tab5.Visible = true;
                        manage.Visible = true;
                    }
                    else
                    {
                        tab5.Visible = false;
                        manage.Visible = false;
                    }

                    var favoriteService = new FavoritesService();

                    var churches = favoriteService.GetFavoriteChurches(Auth.user().Id);

                    favoriteChurches.InnerHtml = "";

                    foreach (var church in churches)
                    {
                        var churchItem = new ChurchItem(church.SimbahanID, church.Parish, church.CompleteAddress,
                            church.ChurchPhotos[0].ChurchPhotos);
                        
                        favoriteChurches.InnerHtml += churchItem.ToHtml();
                    }

                    var favoriteServices = new FavoritesService();

                    var announcements = favoriteServices.GetFavoriteAnnouncements(Auth.user().Id);

                    favoriteAnnouncements.InnerHtml = "";

                    foreach (var announcement in announcements)
                    {
                        var announcementItem = new AnnouncementItem(announcement.SimbahanId, announcement.Title, announcement.Venue,
                            announcement.ImagePath);

                        favoriteAnnouncements.InnerHtml += announcementItem.ToHtml();
                    }

                    var favoriteServicess = new FavoritesService();

                    var organnouncements = favoriteServices.GetFavoriteOrgAnnouncements(Auth.user().Id);

                    favoriteAnnouncementss.InnerHtml = "";

                    foreach (var organnouncement in organnouncements)
                    {
                        var announcementItem = new OrganizationAnnouncementItem(organnouncement.Id, organnouncement.OrganizationId, organnouncement.Title, organnouncement.Venue,
                            organnouncement.ImagePath);

                        favoriteAnnouncementss.InnerHtml += announcementItem.ToHtml();
                    }


                    var organizations = favoriteService.GetFavoriteOrganizations(Auth.user().Id);

                    favoriteOrganizations.InnerHtml = "";

                    foreach (var organization in organizations)
                    {
                        var organizationItem =
                            new OrganizationItem(organization.Id, organization.Name, organization.Address, "");

                        favoriteOrganizations.InnerHtml += organizationItem.ToHtml();
                    }

                    var verses = favoriteService.GetFavoriteBibleVerses(Auth.user().Id);

                    favoriteBibleVerses.InnerHtml = "";

                    foreach (var verse in verses)
                    {
                        var verseItem = new BibleVerseItem(verse);

                        favoriteBibleVerses.InnerHtml += verseItem.ToHtml();
                    }

                    var quotes = favoriteService.GetFavoriteReligiousQuotes(Auth.user().Id);

                    favoriteReligiousQuotes.InnerHtml = "";

                    foreach (var quote in quotes)
                    {
                        var quoteItem = new ReligiousQuoteItem(quote);

                        favoriteReligiousQuotes.InnerHtml += quoteItem.ToHtml();
                    }

                    var prayers = favoriteService.GetFavoriteBasicCatholicPrayer(Auth.user().Id);

                    favoriteBasicCatholicPrayers.InnerHtml = "";

                    foreach (var prayer in prayers)
                    {
                        var prayerItem = new BasicCatholicPrayerItem(prayer);

                        favoriteBasicCatholicPrayers.InnerHtml += prayerItem.ToHtml();
                    }

                    var devotes = favoriteService.GetFavoriteDevotion(Auth.user().Id);

                    favoriteDevotions.InnerHtml = "";

                    foreach (var devote in devotes)
                    {
                        var devoteItem = new DevotionItem(devote);

                        favoriteDevotions.InnerHtml += devoteItem.ToHtml();
                    }

                    var otps = favoriteService.GetFavoriteOtherCatholicPrayer(Auth.user().Id);

                    favoriteOtherCatholicPrayers.InnerHtml = "";

                    foreach (var otp in otps)
                    {
                        var otpItem = new OtherCatholicPrayerItem(otp);

                        favoriteOtherCatholicPrayers.InnerHtml += otpItem.ToHtml();
                    }

                    var saints = favoriteService.GetFavoriteSaint(Auth.user().Id);

                    favoriteSaints.InnerHtml = "";

                    foreach (var saint in saints)
                    {
                        var saintItem = new SaintItem(saint);

                        favoriteSaints.InnerHtml += saintItem.ToHtml();
                    }
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }

        [WebMethod]
        public static List<DailyGospelReflection> GetGospelReflections()
        {
            var service = new DailyGospelReflectionService();

            return service.Get(Auth.user().Id);
        }

        [WebMethod]
        public static List<DailyReflectionReflection> GetReflectionReflections()
        {
            var service = new DailyReflectionReflectionService();

            return service.Get(Auth.user().Id);
        }

        [WebMethod]
        public static List<SaintReflection> GetSaintReflections()
        {
            var service = new SaintReflectionService();

            return service.Get(Auth.user().Id);
        }

        [WebMethod]
        public static List<Models.MusicalInspiration> GetMusicalInspirations()
        {
            var service = new FavoritesService();

            return service.GetFavoriteInspirationalMusic(Auth.user().Id);
        }

        [WebMethod]
        public static User UpdateUserInformation(string firstName, string lastName, bool gender, DateTime birthday)
        {
            var service = new UserService();

            var user = service.Update(Auth.user().Id, new User
            {
                Id = Auth.user().Id,
                FirstName = firstName,
                LastName = lastName,
                Gender = gender ? "Male" : "Female",
                DateOfBirth = birthday.ToString("MMMM dd, yyyy")
            });

            // Since the user has been updated, we need to update the cookie, too.
            // But we need to delete the cookie first.
            FormsAuthentication.SignOut();

            // Next, we need to automatically log the user in.
            var ticket = new FormsAuthenticationTicket(1, user.Email, DateTime.Now, DateTime.Now.AddDays(7), true,
                user.ToString());

            var encryptedCookie = FormsAuthentication.Encrypt(ticket);

            var cookie = new HttpCookie(FormsAuthentication.FormsCookieName, encryptedCookie);
            cookie.Expires = ticket.Expiration;
            cookie.Path = ticket.CookiePath;
            HttpContext.Current.Response.Cookies.Add(cookie);

            return user;
        }
    }
}
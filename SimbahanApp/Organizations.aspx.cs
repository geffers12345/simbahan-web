using System;
using System.Linq;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using SimbahanApp.Components;
using SimbahanApp.Models;
using SimbahanApp.Services;
using OrganizationReview = SimbahanApp.Models.OrganizationReview;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Collections.Generic;

namespace SimbahanApp
{
    public partial class Organizations : Page
    {
        public int orgID = 0;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            var imgArr = new List<string>();
            var organizationId = 0;
            orgID = Convert.ToInt32(Request["id"]);
            if (Request["id"] == null && Page.RouteData.Values["organization-id"] == null)
                return;

            if (Request["id"] != null)
                organizationId = Convert.ToInt32(Request["id"]);
            else if (Page.RouteData.Values["organization-id"] != null)
                organizationId = Convert.ToInt32(Page.RouteData.Values["organization-id"]);

            var organizationService = new OrganizationService();

            var organization = organizationService.Find(organizationId);
            var todayMass = organization.Masses
                .Where(mass => mass.ScheduleId == (int) DateTime.Now.DayOfWeek + 1)
                .ToList();

            OrganizationId.Value = organization.Id.ToString();
            OrganizationName.InnerHtml = organization.Name;
            OrganizationAbout.InnerHtml = organization.About;
            OrganizationAddress.InnerHtml = organization.Address;
            OrgAddress.InnerHtml = organization.Address;
            var worshipScheduleString = todayMass.Count < 0 ? "No Worship Schedule Available for This Day"
                : DateTime.Now.DayOfWeek + " " + string.Join(", ", todayMass.Select(mass => mass.Time));
            WorshipScheduleToday.InnerHtml = worshipScheduleString;
            ParentOrganization.InnerHtml = organization.ParentOrganization;
            LastUpdated.InnerHtml = organization.LastUpdate.ToString("MMMM dd, yyyy");
            Location.InnerHtml = organization.Branch;
            InfoOrganizationName.InnerHtml = organization.Name;
            InfoParentOrganization.InnerHtml = organization.ParentOrganization;
            DateEstablished.InnerHtml = organization.DateEstablished;
            ContactNumber.InnerHtml = organization.ContactNumber;
            Email.InnerHtml = organization.Email;
            Website.InnerHtml = organization.Website;
            latitude.Value = organization.Latitude.ToString();
            longitude.Value = organization.Longitude.ToString();
            organizationMapDestination.Value = organization.Address;

            RetreatSchedule.InnerHtml = organization.RetreatSchedule;
            RecollectionSchedule.InnerHtml = organization.RecollectionSchedule;
            TalkSchedule.InnerHtml = organization.TalkSchedule;
            CampSchedule.InnerHtml = organization.CampSchedule;
            VolunteerSchedule.InnerHtml = organization.VolunteerSchedule;


            foreach (var activity in organization.Activities)
                Activities.InnerHtml += new CheckLabel(activity).ToHtml();

            foreach (var attendee in organization.Attendees)
                Attendees.InnerHtml += new CheckLabel(attendee).ToHtml();

            foreach (var location in organization.Locations)
                Venues.InnerHtml += new CheckLabel(location).ToHtml();

            foreach (var ventilation in organization.Ventilations)
                Ventilations.InnerHtml += new CheckLabel(ventilation).ToHtml();

            foreach (var parking in organization.Parkings)
                Parkings.InnerHtml += new CheckLabel(parking).ToHtml();

            foreach (var mass in organization.Masses)
                MassSchedule.Controls.Add(new HtmlGenericControl("li") {InnerHtml = mass.Time});

            foreach (var bibleSchedule in organization.BibleStudySchedules)
                BibleSchedule.Controls.Add(new HtmlGenericControl("li") {InnerHtml = bibleSchedule.Time});

            foreach (var worshipSchedule in organization.WorshipSchedules)
                WorshipSchedule.Controls.Add(new HtmlGenericControl("li") {InnerHtml = worshipSchedule.Time});


            char[] separator = { ',' };

            using (SqlConnection dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                {
                    dbconn.Close();
                }
                dbconn.Open();
                
                using (SqlCommand cmd = new SqlCommand("SELECT ImagePath from [tblOrganizationPhoto] where OrganizationID = '" + orgID + "'", dbconn))
                
                {
                    var reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        var photos = reader["ImagePath"].ToString().Split(separator, StringSplitOptions.None);

                        foreach (var strPix in photos)
                            imgArr.Add(strPix);

                        var carousel = new Carousel();
                        //var slider = new ImageSlider();

                        if (imgArr.Count > 0)
                        {
                            //slider.FirstImage = photos[0];

                            //for (var i = 0; i < imgArr.Count; i++)
                            //    slider.AddImage(i, imgArr[i]);

                            //cssSlider.InnerHtml = slider.ToHtml();
                            for (var i = 0; i < imgArr.Count; i++)
                                //slider.AddImage(i, churches.ChurchPhotos[i].ChurchPhotos);
                                carousel.AddImage(i, imgArr[i]);

                            //cssSlider.InnerHtml = slider.ToHtml();
                            cssSlider.InnerHtml = carousel.ToHtml();
                        }
                        else
                        {
                            cssSlider.InnerHtml = "<h3 class=\"text-center\">No Photos Available.</h3>";
                        }
                    }
                }
            }
            
            var reviews = new OrganizationReviewService().Get(organization.Id);

            foreach (var review in reviews)
            {
                var reviewItem = new Components.OrganizationReview(review);

                organizationReviewsContainer.InnerHtml += reviewItem.ToHtml();
            }

            Page.Title = organization.Name;

            if (Auth.Check())
            {
                var favoriteService = new FavoritesService();
                if (favoriteService.IsOrganizationAlreadyInFavorites(Auth.user().Id, organization.Id))
                {
                    AddFav.Attributes.Add("style", "display: none;");
                    RemoveFav.Attributes.Add("style", "display: block;");
                }
                else
                {
                    AddFav.Attributes.Add("style", "display: block;");
                    RemoveFav.Attributes.Add("style", "display: none;");
                }
            }
            else
            {
                RemoveFav.Attributes.Add("style", "display: none");
            }

            var announcementService = new OrganizationAnnouncementService();
            var announcements = announcementService.Get(organization.Id);

            foreach (Models.OrganizationAnnouncement announcement in announcements)
            {
                var component = new Components.OrganizationAnnouncement(announcement);

                announcementContainer.InnerHtml += component.ToHtml();
            }
        }

        [WebMethod]
        public static bool AddOrganizationToFavorite(int organizationId)
        {
            var service = new FavoritesService();

            return service.AddOrganization(Auth.user().Id, organizationId);
        }

        [WebMethod]
        public static bool RemoveChurchFromFavorite(int organizationId)
        {
            var service = new FavoritesService();

            return service.RemoveOrganization(Auth.user().Id, organizationId);
        }

        [WebMethod]
        public static OrganizationReview PublishReview(int organizationId, int rate, string title, string content,
            string name = "")
        {
            var review = new OrganizationReview
            {
                OrganizationId = organizationId,
                UserId = name == "" ? Auth.user().Id : 0,
                StarCount = rate,
                Title = title,
                Comment = content,
                Name = name
            };

            return review.Create();
        }

        protected void btnAddAnnouncement_Click(object sender, EventArgs e)
        {
            if (AnnouncementImage.PostedFile != null && AnnouncementImage.PostedFile.FileName != "")
            {
                AnnouncementImage.SaveAs(Server.MapPath("Images/Organizations/" + AnnouncementImage.FileName.ToString()));
            }

            var announcement = new Models.OrganizationAnnouncement()
            {
                OrganizationId = Convert.ToInt32(OrganizationId.Value),
                Title = announcementTitle.Value,
                Description = announcementContent.Value,
                Venue = announcementVenue.Value,
                StartDate = DateTime.Parse(announcementStartDate.Value),
                StartTime = announcementStartTime.Value,
                EndDate = DateTime.Parse(announcementEndDate.Value),
                EndTime = announcementEndTime.Value,
                ImagePath = "Images/Organizations/" + AnnouncementImage.FileName.ToString()
            };

            announcement.Create();
        }
    }
}
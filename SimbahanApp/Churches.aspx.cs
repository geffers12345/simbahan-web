using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using SimbahanApp.Components;
using SimbahanApp.Models;
using SimbahanApp.Services;
using Announcement = SimbahanApp.Models.Announcement;
using ChurchReview = SimbahanApp.Models.ChurchReview;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Web;

namespace SimbahanApp
{
    public partial class Churches : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //btnAddToFav.Src = "Images/star.png";

            var churchId = 0;

            if (Request["id"] == null && Page.RouteData.Values["church-id"] == null)
                return;

            if (Request["id"] != null)
                churchId = Convert.ToInt32(Request["id"]);
            else if (Page.RouteData.Values["church-id"] != null)
                churchId = Convert.ToInt32(Page.RouteData.Values["church-id"]);

            var service = new ChurchService();

            var favoriteService = new FavoritesService();

            var timeStandard = new TimeStandard();

            var churches = service.Find(churchId);

            simbahanID.Value = churchId.ToString();
            churchName.InnerHtml = churches.Parish;
            churchAddress.InnerHtml = churches.CompleteAddress;
            churchLastUpdate.InnerHtml = churches.LastUpdate.ToString("MMM d, yyyy");
            churchHistory.InnerHtml = HttpUtility.HtmlDecode(churches.ChurchHistory) == ""
                ? "<h3>No Data Available.</h3>"
                : "<strong>" + churches.Parish + "</strong> " + HttpUtility.HtmlDecode(churches.ChurchHistory);
            churchType.InnerHtml = ChurchType.parseInt(churches.ChurchTypeID);
            churchEstablished.InnerHtml = churches.DateEstablished;
            churchFeastDay.InnerHtml = churches.FeastDay;
            churchPriest.InnerHtml = churches.Priest;
            churchVicariate.InnerHtml = churches.Vicariate;
            churchDiocese.InnerHtml = churches.Diocese;
            churchContact.InnerHtml = churches.ContactNo;
            churchWebsite.InnerHtml = churches.Website;
            adorationSchedule.InnerHtml = churches.AdorationDisplayText;
            churchMapAddress.InnerHtml = churches.CompleteAddress;
            churchMapDestination.Value = churches.CompleteAddress;

            baptismSchedule.InnerHtml = churches.BaptismDetails;
            weddingSchedule.InnerHtml = churches.WeddingDetails;
            officeHours.InnerHtml = churches.OfficeHours;
            devotionSchedule.InnerHtml = churches.DevotionSchedule;
            latitude.Value = churches.Latitude.ToString();
            longitude.Value = churches.Longitude.ToString();

            editChurchHistory.InnerHtml = churches.ChurchHistory;

            if (Auth.Check())
                if (favoriteService.IsChurchAlreadyInFavorites(Auth.user().Id, churches.SimbahanID))
                {
                    AddFav.Attributes.Add("style", "display: none;");
                    RemoveFav.Attributes.Add("style", "display: block;");
                }
                else
                {
                    AddFav.Attributes.Add("style", "display: block;");
                    RemoveFav.Attributes.Add("style", "display: none;");
                }
            else
                RemoveFav.Attributes.Add("style", "display: none");

            List<MassDetailsModel> schedules;


            switch (DateTime.Now.DayOfWeek)
            {
                case DayOfWeek.Sunday:
                    schedules = churches.SundayMassSchedule;
                    break;

                case DayOfWeek.Monday:
                    schedules = churches.MondayMassSchedule;
                    break;

                case DayOfWeek.Tuesday:
                    schedules = churches.TuesdayMassSchedule;
                    break;

                case DayOfWeek.Wednesday:
                    schedules = churches.WednesdayMassSchedule;
                    break;

                case DayOfWeek.Thursday:
                    schedules = churches.ThursdayMassSchedule;
                    break;

                case DayOfWeek.Friday:
                    schedules = churches.FridayMassSchedule;
                    break;

                case DayOfWeek.Saturday:
                    schedules = churches.SaturdayMassSchedule;
                    break;

                default:
                    schedules = new List<MassDetailsModel>();
                    break;
            }

            var languages = new List<string>();
            var massSchedules = new List<string>();

            foreach (var mass in schedules)
            {
                if (mass.Language != "" && !languages.Contains(mass.Language))
                    languages.Add(mass.Language);

                massSchedules.Add(mass.Time);
            }

            var massDate = "No Mass Schedule for " + DateTime.Now.DayOfWeek;
            churchMassLanguages.Attributes.Add("style", "display: none;");
            if (massSchedules.Count > 0)
            {
                massDate = DateTime.Now.DayOfWeek + " - " + string.Join(", ", massSchedules);
                churchMassLanguages.Attributes.Add("style", "display: block;");
            }

            churchMassDates.InnerHtml = massDate;
            churchMassLanguages.InnerHtml = string.Join(", ", languages);

            adorationChapelSchedule.InnerHtml = churches.AdorationDisplayText;

            confessionSchedule.InnerHtml = churches.ConfessionDetails.Count > 0
                ? churches.ConfessionDetails[0].Text
                : "";

            if (!string.IsNullOrEmpty(churches.LocationType))
            {
                var locationLabel = new CheckLabel(churches.LocationType);
                churchLocation.InnerHtml = locationLabel.ToHtml();
            }

            foreach (var ventilation in churches.Ventilations)
            {
                var ventilationLabel = new CheckLabel(ventilation.VentType);

                churchVentilations.InnerHtml += ventilationLabel.ToHtml();
            }

            foreach (var ventilation in churches.AdorationVentilations)
            {
                var ventilationLabel = new CheckLabel(ventilation);

                adorationVentilations.InnerHtml += ventilationLabel.ToHtml();
            }

            foreach (var parking in churches.ChurchParking)
            {
                var parkingLabel = new CheckLabel(parking.ParkingType);

                churchParking.InnerHtml += parkingLabel.ToHtml();
            }

            for (var i = 5; i <= 22; i++)
            {
                var row = new HtmlTableRow();

                var dayTime = new HtmlTableCell();
                var sundayMass = new HtmlTableCell();
                var mondayMass = new HtmlTableCell();
                var tuesdayMass = new HtmlTableCell();
                var wednesdayMass = new HtmlTableCell();
                var thursdayMass = new HtmlTableCell();
                var fridayMass = new HtmlTableCell();
                var saturdayMass = new HtmlTableCell();

                var sundayTime = churches.SundayMassSchedule.FirstOrDefault(schedule => schedule.TimeStandardId == i);
                var mondayTime = churches.MondayMassSchedule.FirstOrDefault(schedule => schedule.TimeStandardId == i);
                var tuesdayTime = churches.TuesdayMassSchedule.FirstOrDefault(schedule => schedule.TimeStandardId == i);
                var wednesdayTime =
                    churches.WednesdayMassSchedule.FirstOrDefault(schedule => schedule.TimeStandardId == i);
                var thursdayTime =
                    churches.ThursdayMassSchedule.FirstOrDefault(schedule => schedule.TimeStandardId == i);
                var fridayTime = churches.FridayMassSchedule.FirstOrDefault(schedule => schedule.TimeStandardId == i);
                var saturdayTime =
                    churches.SaturdayMassSchedule.FirstOrDefault(schedule => schedule.TimeStandardId == i);

                dayTime.InnerHtml = timeStandard.Time[i - 1];

                sundayMass.InnerHtml =
                    sundayTime != null ? sundayTime.Time + "<br/>" + sundayTime.Language : "";

                mondayMass.InnerHtml =
                    mondayTime != null ? mondayTime.Time + "<br/>" + mondayTime.Language : "";

                tuesdayMass.InnerHtml =
                    tuesdayTime != null ? tuesdayTime.Time + "<br/>" + tuesdayTime.Language : "";

                wednesdayMass.InnerHtml =
                    wednesdayTime != null ? wednesdayTime.Time + "<br/>" + wednesdayTime.Language : "";

                thursdayMass.InnerHtml =
                    thursdayTime != null ? thursdayTime.Time + "<br/>" + thursdayTime.Language : "";

                fridayMass.InnerHtml =
                    fridayTime != null ? fridayTime.Time + "<br/>" + fridayTime.Language : "";

                saturdayMass.InnerHtml =
                    saturdayTime != null ? saturdayTime.Time + "<br/>" + saturdayTime.Language : "";

                row.Cells.Add(dayTime);
                row.Cells.Add(sundayMass);
                row.Cells.Add(mondayMass);
                row.Cells.Add(tuesdayMass);
                row.Cells.Add(wednesdayMass);
                row.Cells.Add(thursdayMass);
                row.Cells.Add(fridayMass);
                row.Cells.Add(saturdayMass);
                row.Attributes.Add("class", "text-center");

                massScheduleTable.Rows.Add(row);
            }

            if (churches.Announcements.Count > 0)
                foreach (var announcement in churches.Announcements)
                {
                    var announcementControl = new Components.Announcement(announcement);
                    
                    churchAnnouncementContainer.InnerHtml += announcementControl.ToHtml();
                }
            else
                churchAnnouncementContainer.InnerHtml += "<h4>No Announcement Found.</h4>";

            foreach (var review in churches.ChurchReviews)
            {
                var reviewItem = new Components.ChurchReview(review);

                churchReviewsContainer.InnerHtml += reviewItem.ToHtml();
            }

            //var slider = new ImageSlider();
            var carousel = new Carousel();

            if (churches.ChurchPhotos.Count > 0)
            {
                //slider.FirstImage = churches.ChurchPhotos[0].ChurchPhotos;

                for (var i = 0; i < churches.ChurchPhotos.Count; i++)
                    //slider.AddImage(i, churches.ChurchPhotos[i].ChurchPhotos);
                    carousel.AddImage(i, churches.ChurchPhotos[i].ChurchPhotos);

                //cssSlider.InnerHtml = slider.ToHtml();
                cssSlider.InnerHtml = carousel.ToHtml();
            }
            else
            {
                cssSlider.InnerHtml = "<h3 class=\"text-center\">No Photos Available.</h3>";
            }

            if (churches.AdorationPhotos.Count > 0)
                for (var i = 0; i < churches.AdorationPhotos.Count; i++)
                {
                    var imagePath = ResolveUrl(churches.AdorationPhotos[i]);

                    var newLi = new HtmlGenericControl("li")
                    {
                        InnerHtml = "<img src=\"" + imagePath +
                                    "\" alt=\"\" title=\"\" id=\"wows1_" + i + "\" />"
                    };
                    adorationImageList.Controls.Add(newLi);

                    var newA = new HtmlGenericControl("a");
                    newA.Attributes.Add("href", "#");
                    newA.InnerHtml = "<a href=\"#\" title=\"\"><span><img src=\"" + imagePath +
                                     "\" alt=\"\" />" + (i + 1) + "</span></a>";
                    adorationLinkList.Controls.Add(newA);
                }
            else
                adorationImageContainer.InnerHtml = "<h3>No Photos Available</h3>";

            Master.GoogleMetaDescription = massDate;
            Page.Title = churches.Parish;
        }

        [WebMethod]
        public static ChurchReview PublishReview(int simbahanId, int rate, string content, string name = "")
        {
            var review = new ChurchReview
            {
                SimbahanId = simbahanId,
                Name = name,
                StarCount = rate,
                Comment = content,
                UserId = name == "" ? Auth.user().Id : 0
            };
            
            return review.Create();
        }

        [WebMethod]
        public static bool AddChurchToFavorite(int simbahanId)
        {
            var service = new FavoritesService();

            return service.AddChurch(Auth.user().Id, simbahanId);
        }

        [WebMethod]
        public static bool RemoveChurchFromFavorite(int simbahanId)
        {
            var service = new FavoritesService();

            return service.RemoveChurch(Auth.user().Id, simbahanId);
        }

        [WebMethod]
        public static void UpdateHistory(int SimbahanID, string churchHistory)
        {
            using (SqlConnection dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                {
                    dbconn.Close();
                }
                dbconn.Open();
                {
                    try
                    {
                        string query = String.Format("UPDATE Simbahan SET ChurchHistory = '{1}' WHERE SimbahanID = {0}", SimbahanID, HttpUtility.HtmlEncode(churchHistory));

                        SqlCommand cmd = new SqlCommand(query.ToString(), dbconn);

                        cmd.ExecuteNonQuery();
                    }

                    catch (System.Data.SqlClient.SqlException ex)

                    {
                        string msg = "Insert Error:";
                        msg += ex.Message;
                        throw new Exception(msg);
                    }
                }
            }
        }

        [WebMethod]
        public static void ReportAbusiveComment(int commentId)
        {
            var service = new SpamReportService();

            service.Create(new SpamReport
            {
                CommentId = commentId,
                ReporterId = Auth.user().Id
            });
        }

        protected void btnAddAnnouncement_Click(object sender, EventArgs e)
        {
            if (AnnouncementImage.PostedFile != null && AnnouncementImage.PostedFile.FileName != "")
            {
                AnnouncementImage.SaveAs(Server.MapPath("Images/Churches/" + AnnouncementImage.FileName.ToString()));
            }

            var announcement = new Announcement()
            {
                SimbahanId = Convert.ToInt32(simbahanID.Value),
                Title = announcementTitle.Value,
                Description = announcementContent.Value,
                Venue = announcementVenue.Value,
                StartDate = DateTime.Parse(announcementStartDate.Value),
                StartTime = announcementStartTime.Value,
                EndDate = DateTime.Parse(announcementEndDate.Value),
                EndTime = announcementEndTime.Value,
                ImagePath = "Images/Churches/" + AnnouncementImage.FileName.ToString()
            };

            announcement.Create();
        }
    }
}
using SimbahanApp.Models;
using System.Web;
using SimbahanApp.Services;

namespace SimbahanApp.Components
{
    public class Announcement : IComponent
    {
        private readonly Models.Announcement _announcement;

        public Announcement(Models.Announcement announcement)
        {
            _announcement = announcement;
        }

        public string ToHtml()
        {
            var service = new FavoritesService();
            var isInFavorite = service.IsAnnouncementAlreadyInFavorites(Auth.user().Id,_announcement.Id);

            return
                @"<a id=""annoucementItem"" data-id=""" + _announcement.Id + @""" data-is-favorite=""" + isInFavorite + @""" data-title=""" + HttpUtility.HtmlEncode(_announcement.Title) + @""" data-venue=""" + HttpUtility.HtmlEncode(_announcement.Venue) + @""" data-start-date=""" + _announcement.FormattedStartDate + @""" data-start-time=""" + _announcement.StartTime + @""" data-end-date=""" + _announcement.FormattedEndDate + @""" data-end-time=""" + _announcement.EndTime + @""" data-content=""" + HttpUtility.HtmlEncode(_announcement.Description) + @""" data-image=""" + _announcement.ImagePath + @""" href=""#"">" +
                    @"<div class=""row"">
                        <div class=""col-md-2"">
                            <img class=""img-responsive"" style=""height: 130px;"" src=""" + _announcement.ImagePath + @""" />
                        </div>
                        <div class=""col-md-6"">
                            <h4 class=""text-danger"">" + _announcement.Title + @"</h4>
                            <p class=""text-muted"">" + _announcement.Venue + @"</p>
                            <p>" +
                                _announcement.FormattedStartDate + " " +
                                _announcement.StartTime + " - " +
                                _announcement.FormattedEndDate + " " +
                                _announcement.EndTime +
                            "</p>" +
                        "</div>" +
                        @"<div class=""col-md-4""> 
                        <p>" +
                              _announcement.Description + "</p>" +
                              "</br>" +
                                 "</p>" +
                                
                        "</div>" +
                    "</div>" +
                "</a>";
        }
    }
}
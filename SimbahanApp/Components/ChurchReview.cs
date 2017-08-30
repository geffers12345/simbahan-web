using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SimbahanApp.Components
{
    public class ChurchReview : IComponent
    {
        public Models.ChurchReview Review { get; set; }

        public ChurchReview(Models.ChurchReview review)
        {
            Review = review;
        }

        private double CalculateStarPercentage()
        {
            switch (Convert.ToInt32(Review.StarCount))
            {
                case 0:
                    return 0;

                case 1:
                    return 18.2;

                case 2:
                    return 36.4;

                case 3:
                    return 54.6;

                case 4:
                    return 72.8;

                case 5:
                    return 91;

                default: return 0;
            }
        }

        public string ToHtml()
        {
            var reviewerName = Review.UserId == 0 ? Review.Name : Review.User.FullName;

            return
                "<li itemprop=\"review\" itemtype=\"http://schema.org/Review\">" +
                    "<div class=\"eltd-comment clearfix\">" +
                        "<div class=\"eltd-comment-image\" itemprop=\"author\" itemtype=\"http://schema.org/Person\">" +
                            "<img alt=\"\" src=\"Images\\default_avatar.png\" class=\"avatar avatar-98 photo\" height=\"98\" width=\"98\" />" +
                        "</div>" +
                        "<div class=\"eltd-comment-text\">" +
                            "<div class=\"eltd-comment-info\">" +
                                "<div class=\"eltd-review-rating\">" +
                                    "<span class=\"rating-inner\" style=\"width: " + CalculateStarPercentage() + "%;\"></span>" +
                                    "<a href=\"#\" id=\"reportSpam\" data-id=\"" + Review.Id + "\" data-toggle=\"tooltip\" data-placement=\"top\" title=\"Report as abusive\"><i class=\"fa fa-exclamation 5x\" style=\"color: red;\" aria-hidden=\"true\"></i></a>" +
                                "</div>" +
                                "<div class=\"eltd-review-title\">" +
                                    "<span>" + reviewerName + "</span>" +
                                "</div>" +
                                "<div class=\"eltd-review-title\">" +
                                    "<span>" + Review.Title + "</span>" +
                                "</div>" +
                            "</div>" +
                            "<div class=\"eltd-text-holder\" id=\"comment-42\" itemprop=\"reviewBody\">" +
                                "<p>" + Review.Comment + "</p>" +
                            "</div>" +
                            "<div class=\"eltd-comment-bottom-info\">" +
                                "<span class=\"eltd-comment-date\" itemprop=\"datePublished\" content=\"2017 - 02 - 22T11: 36:00 + 0000\">" + Review.FormattedDate + "</span>" +
                            "</div>" +
                        "</div>" +
                    "</div>" +
                "</li>";
        }
    }
}
using System;
using System.Text;

namespace SimbahanApp.Components
{
    public class OrganizationReview : IComponent
    {
        public OrganizationReview(Models.OrganizationReview review)
        {
            Review = review;
        }

        public Models.OrganizationReview Review { get; set; }

        public string ToHtml()
        {
            var reviewerName = Review.UserId == 0 ? Review.Name : Review.User.FullName;

            StringBuilder sb = new StringBuilder();

            for (int i = 0; i < Review.StarCount; i++)
            {
                sb.Append(@"<i class='fa fa-star' style='color: yellow; font-size: 18pt'></i>");
            }

            for (int i = 0; i < 5 - Review.StarCount; i++)
            {
                sb.Append(@"<i class='fa fa-star-o' style='font-size: 18pt'></i>");
            }
            return
                "<li itemprop=\"review\" itemtype=\"http://schema.org/Review\">" +
                "<div class=\"eltd-comment clearfix\">" +
                "<div class=\"eltd-comment-image\" itemprop=\"author\" itemtype=\"http://schema.org/Person\">" +
                "<img alt=\"\" src=\"Images\\default_avatar.png\" class=\"avatar avatar-98 photo\" height=\"98\" width=\"98\" />" +
                "</div>" +
                "<div class=\"eltd-comment-text\">" +
                "<div class=\"eltd-comment-info\">" +
                "<div>" +
                //"<span class=\"rating-inner\" style=\"width: " + CalculateStarPercentage() + "%;\"></span>" +
                //"<a href=\"#\" data-toggle=\"tooltip\" data-placement=\"top\" title=\"Report as abusive\"><i class=\"fa fa-exclamation 5x\" style=\"color: red;\" aria-hidden=\"true\"></i></a>" +
                sb.ToString() +
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
                "<span class=\"eltd-comment-date\" itemprop=\"datePublished\" content=\"2017 - 02 - 22T11: 36:00 + 0000\">" +
                Review.FormattedDate + "</span>" +
                "</div>" +
                "</div>" +
                "</div>" +
                "</li>";
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
    }
}
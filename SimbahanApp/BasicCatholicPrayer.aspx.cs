using System;
using System.Web.Services;
using System.Web.UI;
using SimbahanApp.Models;
using SimbahanApp.Services;

namespace SimbahanApp
{
    public partial class BasicCatholicPrayer : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request["id"] == null && Page.RouteData.Values["prayer-id"] == null)
                return;

            var bcpid = 0;

            if (Request["id"] != null)
                bcpid = Convert.ToInt32(Request["id"]);

            else if (Page.RouteData.Values["prayer-id"] != null)
                bcpid = Convert.ToInt32(Page.RouteData.Values["prayer-id"]);

            var bcpService = new BasicCatholicPrayerService();
            var bcp = bcpService.Find(bcpid);

            PrayerTitle.InnerHtml = bcp.Title;
            PrayerContent.InnerHtml = bcp.Prayer;
            ImagePath.Src = bcp.ImagePath;

            var favoritesService = new FavoritesService();

            var isInFavorites = favoritesService.IsBasicCatholicPrayerAlreadyInFavorites(Auth.user().Id, bcpid);

            if (isInFavorites)
                btnAddToFav.Attributes.Add("src", "/Images/starcolored.png");
            else
                btnAddToFav.Attributes.Add("src", "/Images/star.png");
        }

        [WebMethod]
        public static void OnFavoriteBasicCatholicPrayer(int basicCatholicPrayerId)
        {
            var userId = Auth.user().Id;

            var service = new FavoritesService();

            if (service.IsBasicCatholicPrayerAlreadyInFavorites(userId, basicCatholicPrayerId))
                service.RemoveBasicCatholicPrayer(userId, basicCatholicPrayerId);
            else
                service.AddBasicCatholicPrayer(userId, basicCatholicPrayerId);
        }
    }
}
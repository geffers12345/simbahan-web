using System;
using System.Web.Services;
using System.Web.UI;
using SimbahanApp.Models;
using SimbahanApp.Services;

namespace SimbahanApp
{
    public partial class OtherCatholicPrayer : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request["id"] == null && Page.RouteData.Values["other-prayer-id"] == null)
                return;

            var othercatholicprayerid = 0;

            if (Request["id"] != null)
                othercatholicprayerid = Convert.ToInt32(Request["id"]);

            else if (Page.RouteData.Values["other-prayer-id"] != null)
                othercatholicprayerid = Convert.ToInt32(Page.RouteData.Values["other-prayer-id"]);

            var otherCatholicPrayerService = new OtherCatholicPrayerService();
            var othercatholicprayer = otherCatholicPrayerService.Find(othercatholicprayerid);

            Title.InnerHtml = othercatholicprayer.Title;
            prayer.InnerHtml = othercatholicprayer.Prayer;
            ImagePath.Src = othercatholicprayer.ImagePath;

            var favoritesService = new FavoritesService();
            var isinfavorite =
                favoritesService.IsOtherCatholicPrayerAlreadyInFavorites(Auth.user().Id, othercatholicprayerid);
            if (isinfavorite)
                btnAddToFave.Attributes["src"] = "/Images/starcolored.png";
            else btnAddToFave.Attributes["src"] = "/Images/star.png";
        }

        [WebMethod]
        public static void OnFavoriteOtherCatholicPrayer(int otherCatholicPrayerId)
        {
            var userId = Auth.user().Id;

            var service = new FavoritesService();

            if (service.IsOtherCatholicPrayerAlreadyInFavorites(userId, otherCatholicPrayerId))
                service.RemoveOtherCatholicPrayer(userId, otherCatholicPrayerId);
            else
                service.AddOtherCatholicPrayer(userId, otherCatholicPrayerId);
        }
    }
}
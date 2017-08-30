using System;
using System.Web.UI;
using SimbahanApp.Models;
using System.Web.Services;
using SimbahanApp.Services;

namespace SimbahanApp
{
    public partial class Devotion : Page
    {
        protected void Page_Load(object sender, EventArgs e)

        {
            if (Request["id"] == null && Page.RouteData.Values["devote-id"] == null)
                return;

            var devotionid = 0;

            if (Request["id"] != null)
                devotionid = Convert.ToInt32(Request["id"]);

            else if (Page.RouteData.Values["devote-id"] != null)
                devotionid = Convert.ToInt32(Page.RouteData.Values["devote-id"]);

            var devotionService = new DevotionService();
            var devotion = devotionService.Find(devotionid);

            PrayerTitle.InnerHtml = devotion.Title;
            PrayerContent.InnerHtml = devotion.Prayer;
            ImagePath.Src = devotion.ImagePath;

            var favoritesService = new FavoritesService();
            var isinfavorite = favoritesService.IsDevotionAlreadyInFavorites(Auth.user().Id, devotionid);
            if (isinfavorite)
                btnAddToFavo.Attributes["src"] = "/Images/starcolored.png";
            else
                btnAddToFavo.Attributes["src"] = "/Images/star.png";
        }

        [WebMethod]
        public static void OnFavoriteDevotion(int devotionId)
        {
            var userId = Auth.user().Id;

            var favoritesService = new FavoritesService();

            if (favoritesService.IsDevotionAlreadyInFavorites(userId, devotionId))
                favoritesService.RemoveDevotion(userId, devotionId);
            else
                favoritesService.AddDevotion(userId, devotionId);
        }
    }
}
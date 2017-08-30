using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using SimbahanApp.Models;
using SimbahanApp.Services;
using SimbahanApp.Transformers;

namespace SimbahanApp
{
    public partial class MusicalInspirations : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "Pool of Inspirational Music to Suit Your Mood | MyCatholicPortal.org";
            Page.MetaKeywords = "music, inspiration";
            Page.MetaDescription =
                "Listen and Be Motivated by  our Selection of Inspirational Musics Grouped per Mood. God's Message for You can also be in the Form of Music.";
        }

        [WebMethod]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public static List<Models.MusicalInspiration> GetMusic(string moods)
        {
            var service = new MusicalInspirationService();

            return service.GetAll(moods, Auth.user().Id);
        }

        [WebMethod]
        public static void OnFavoriteMusicalInspiration(int musicalInspirationId)
        {
            int userId = Auth.user().Id;

            FavoritesService service = new FavoritesService();

            if (service.IsInspirationalMusicAlreadyInFavorites(userId, musicalInspirationId))
                service.RemoveInspirationalMusic(userId, musicalInspirationId);
            else
                service.AddInspirationalMusic(userId, musicalInspirationId);
        }
    }
}
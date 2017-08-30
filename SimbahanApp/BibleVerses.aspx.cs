using System;
using System.Web.UI;
using SimbahanApp.Models;
using System.Web.Services;
using SimbahanApp.Services;
using System.Collections.Generic;

namespace SimbahanApp
{
    public partial class BibleVerses : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static List<BibleVerse> GetVerse(string moods)
        {
            var service = new BibleVerseService();
            var mood = new Mood();

            return service.Get(mood.GetKey(moods), Auth.user().Id);
        }

        [WebMethod]
        public static void OnFavoriteBibleVerse(int bibleVerseId)
        {
            var userId = Auth.user().Id;

            var service = new FavoritesService();

            if (service.IsBibleVerseAlreadyInFavorites(userId, bibleVerseId))
                service.RemoveBibleVerse(userId, bibleVerseId);
            else
                service.AddBibleVerse(userId, bibleVerseId);
        }
    }
}
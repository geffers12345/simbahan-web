using System;
using System.Web.UI;
using SimbahanApp.Models;
using System.Web.Services;
using SimbahanApp.Services;
using System.Collections.Generic;

namespace SimbahanApp
{
    public partial class ReligiousQuotes : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        [WebMethod]
        public static List<ReligiousQuote> GetQuotes(string moods)
        {
            var service = new ReligiousQuoteService();
            var mood = new Mood();

            return service.Get(mood.GetKey(moods), Auth.user().Id);
        }

        [WebMethod]
        public static void OnFavoriteBibleVerse(int religiousQuoteId)
        {
            var userId = Auth.user().Id;

            var service = new FavoritesService();

            if (service.IsReligiousQuoteAlreadyInFavorites(userId, religiousQuoteId))
                service.RemoveReligiousQuote(userId, religiousQuoteId);
            else
                service.AddReligiousQuote(userId, religiousQuoteId);
        }
    }
}
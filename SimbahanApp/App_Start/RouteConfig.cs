using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Routing;
using Microsoft.AspNet.FriendlyUrls;

namespace SimbahanApp
{
    public static class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            //var settings = new FriendlyUrlSettings();
            //settings.AutoRedirectMode = RedirectMode.Off;
            //routes.EnableFriendlyUrls(settings);
            ////routes.Ignore("{assets}", new { assets = @".*\.(css|js|gif|jpg)(/.)?" });

            routes.MapPageRoute("BibleVerse",
                "BibleVerse/{bible-verse-id}",
                "~/BibleVerses.aspx");

            routes.MapPageRoute("ReligiousQuote",
                "ReligiousQuote/{religious-quote-id}",
                "~/ReligiousQuotes.aspx");

            routes.MapPageRoute("Announcement",
                 "Church/{church-id}/{announcement-id}",
                 "~/Churches.aspx");

            routes.MapPageRoute("Church",
                "Churches.aspx/{church-id}/{announcement-id}",
                "~/Churches.aspx");

            routes.MapPageRoute("Churches",
                "Churches.aspx/{church-id}/{church-name}",
                "~/Churches.aspx");

            routes.MapPageRoute("Organization",
                "Organization/{organization-id}",
                "~/Organizations.aspx");

            routes.MapPageRoute("Devotion",
                "Dvote/{devote-id}",
                "~/Devotion.aspx");

            routes.MapPageRoute("BasicCatholicPrayer",
                "Prayer/{prayer-id}",
                "~/BasicCatholicPrayer.aspx");
            
            routes.MapPageRoute("OtherCatholicPrayer",
                "OtherPrayer/{other-prayer-id}",
                "~/OtherCatholicPrayer.aspx");

            routes.MapPageRoute("Gospel",
                "Gospel/{gospel-id}",
                "~/DailyGospel.aspx");

            routes.MapPageRoute("DailyReflection",
                "Reflection/{daily-reflection-id}",
                "~/DailyReflection.aspx");

            routes.MapPageRoute("MusicalInspiration",
                "MusicalInspiration/{music-id}",
                "~/MusicalInspirations.aspx");

            routes.MapPageRoute("Saint",
                "Saint/{saint-id}",
                "~/Saintlisting.aspx");
          
        }
    }
}

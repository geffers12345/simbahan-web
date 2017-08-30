using System;
using System.Collections.Generic;
using System.Web.Services;
using System.Web.UI;
using SimbahanApp.Services;

namespace SimbahanApp
{
    public partial class Devotions : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static List<Models.Devotion> GetDevotions()
        {
            var devotionService = new DevotionService();

            return devotionService.Get();
        }
    }
}
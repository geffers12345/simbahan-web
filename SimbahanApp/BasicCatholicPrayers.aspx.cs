using System;
using System.Web.UI;
using System.Web.Services;
using SimbahanApp.Services;
using System.Collections.Generic;

namespace SimbahanApp
{
    public partial class BasicCatholicPrayers : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        [WebMethod]
        public static List<Models.BasicCatholicPrayer> GetBasicCatholicPrayers()
        {
            var basicCatholicPrayerService = new BasicCatholicPrayerService();

            return basicCatholicPrayerService.Get();
        }
    }
}
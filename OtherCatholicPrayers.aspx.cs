using System;
using System.Collections.Generic;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using SimbahanApp.Services;

namespace SimbahanApp
{
    public partial class OtherCatholicPrayers : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            var otherCatholicPrayerService = new OtherCatholicPrayerService();

            var categories = otherCatholicPrayerService.GetCategories();

            foreach (string category in categories)
            {
                if (string.IsNullOrWhiteSpace(category))
                {
                    continue;
                }
                var catgr = category.Replace(' ', '-').ToLower();

                var list = new HtmlGenericControl("li");
                list.InnerHtml = @"<button class=""button"" data-filter=""" + catgr + @""">" + category + "</button>";


                ButtonContainer.Controls.Add(list);
            }
        }

        [WebMethod]
        public static List<Models.OtherCatholicPrayer> GetOtherCatholicPrayers()
        {
            var otherCatholicPrayerService = new OtherCatholicPrayerService();

            return otherCatholicPrayerService.Get();
        }
    }
}
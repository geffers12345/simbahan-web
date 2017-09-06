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


        }

        [WebMethod]
        public static List<Category> GetCategories()
        {
            var otherCatholicPrayerService = new OtherCatholicPrayerService();

            var categories = otherCatholicPrayerService.GetCategories();
            var filteredCategories = new List<Category>();

            foreach (string category in categories)
            {
                if (string.IsNullOrWhiteSpace(category))
                    continue;

                var catgr = category.Replace(' ', '-').ToLower();

                filteredCategories.Add(new Category(category, catgr));
            }

            return filteredCategories;
        }

        [WebMethod]
        public static List<Models.OtherCatholicPrayer> GetOtherCatholicPrayers()
        {
            var otherCatholicPrayerService = new OtherCatholicPrayerService();

            return otherCatholicPrayerService.Get();
        }
        public class Category
        {
            public string Name { get; set; }
            public string Class { get; set; }

            public Category(string name, string classx)

            {
                Name = name;
                Class = classx;
            }
        }
    }
}
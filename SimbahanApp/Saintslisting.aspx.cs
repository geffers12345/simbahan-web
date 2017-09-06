using System;
using System.Collections.Generic;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using SimbahanApp.Models;
using SimbahanApp.Services;

namespace SimbahanApp
{
    public partial class Saintslisting : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        [WebMethod]
        public static List<Category> GetCategories()
        {
            var catgr = new List<Category>();
            var SaintService = new SaintService();

            var patron = SaintService.GetPatron();

            foreach (string Patron in patron)
            {
                if (string.IsNullOrWhiteSpace(Patron))
                    continue;


                var patr = Patron.Replace(' ', '-').ToLower();

                catgr.Add(new Category(Patron, patr));
            }

            return catgr;
        }

        [WebMethod]
        public static List<Saint> GetSaints()
        {
            var saintList = new SaintService();

            return saintList.Get();
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
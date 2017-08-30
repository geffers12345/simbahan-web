using System;
using System.Web.UI;
using SimbahanApp.Services;

namespace SimbahanApp
{
    public partial class Saintlisting : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request["id"] == null && Page.RouteData.Values["saint-id"] == null)
                return;

            var saintId = 0;
            if (Request["id"] != null)
                saintId = Convert.ToInt32(Request["id"]);
            else if (Page.RouteData.Values["saint-id"] != null)
                saintId = Convert.ToInt32(Page.RouteData.Values["saint-id"]);
            else return;

            var saintlistService = new SaintService();
            var saintlist = saintlistService.Find(saintId);

            FeaturedSaint.InnerHtml = saintlist.Name;
            FeastDay.InnerHtml = saintlist.FeastDay;
            PatronOf.InnerHtml = saintlist.Patron;
            SaintID.Value = saintId.ToString();


            BirthDate.InnerHtml = saintlist.BirthDate;
            DeathDate.InnerHtml = saintlist.DeathDate;
            SaintBio.InnerHtml = saintlist.Biography;
            CanonizedDate.InnerHtml = saintlist.CanonizeDate;
            ImagePath.Src = saintlist.ImagePath;
        }
    }
}
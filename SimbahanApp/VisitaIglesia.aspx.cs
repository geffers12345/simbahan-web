using SimbahanAPI.Models;
using SimbahanApp.Models;
using SimbahanApp.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SimbahanApp
{
    public partial class VisitaIglesia : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        [WebMethod]
        public static List<ChurchInfo> GetChurchesNearby(double latitude, double longitude, int limit = 9999)
        {
            ChurchService service = new ChurchService();
            Coordinate source = new Coordinate() { Latitude = latitude, Longitude = longitude };

            List<ChurchInfo> coordinates = service.GetCoordinates(new Coordinate() { Latitude = Math.Truncate(latitude), Longitude = Math.Truncate(longitude) }, limit);

            return coordinates.OrderBy(coordinate => NearDistance(source, new Coordinate() { Latitude = coordinate.Latitude, Longitude = coordinate.Longitude })).ToList<ChurchInfo>();
        }

        private static double NearDistance(Coordinate source, Coordinate target)
        {
            return Math.Sqrt(Math.Pow(target.Longitude - source.Longitude, 2) + Math.Pow(target.Latitude - source.Latitude, 2));
        }

        public void SaveChurches_Click(object sender, EventArgs e)
        {
            VisitaIglesiaService service = new VisitaIglesiaService();

            var hasData = service.HasExistingData(Auth.user().Id);

            if (hasData)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallUserHasExistingData", "UserHasExistingData()", true);
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallUserHasNoExistingData", "UserHasNoExistingData()", true);
            }
        }

        [WebMethod]
        public static bool CheckUserHasExistingData()
        {
            VisitaIglesiaService service = new VisitaIglesiaService();

            var hasData = service.HasExistingData(Auth.user().Id);

            return hasData;
        }

        [WebMethod]
        public static void ShowVisitaIglesia(bool response, int[] churches)
        {
            var service = new VisitaIglesiaService();

            if (response) return;

            service.Delete(new Models.VisitaIglesia
            {
                UserId = Auth.user().Id
            });

            foreach (var churchId in churches)
            {
                var visitaIglesia = new Models.VisitaIglesia
                {
                    SimbahanId = churchId,
                    UserId = Auth.user().Id,
                    StatusId = 2
                };

                service.Create(visitaIglesia);
            }
        }
    }
}
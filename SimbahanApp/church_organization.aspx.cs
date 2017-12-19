using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Services;
using System.Web.UI;
using Microsoft.Ajax.Utilities;
using SimbahanApp.Models;
using SimbahanApp.Services;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Web;
using SimbahanApp.Transformers;

namespace SimbahanApp
{
    public partial class church_organization : Page
    {

        public int LongCS = 0;
        public int LatCS = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                var category = "";
                var keyword = "";
                var location = "";

                if (Request["Category"] != null)
                    category = Request["Category"];

                if (Request["Keywords"] != null)
                    keyword = Request["Keywords"];

                if (Request["Location"] != null)
                    location = Request["Location"];

                selectedCategory.Value = category;

                switch (category)
                {
                    case Categories.Church:
                        churchKeyword.Value = keyword;
                        churchLocation.Value = location;

                        break;

                    case Categories.Organization:
                        organizationKeyword.Value = keyword;
                        organizationLocation.Value = location;

                        break;

                    case Categories.Adoration:
                        adorationKeyword.Value = keyword;
                        adorationLocation.Value = location;

                        break;

                    default:
                        churchKeyword.Value = keyword;
                        churchLocation.Value = location;

                        organizationKeyword.Value = keyword;
                        organizationLocation.Value = location;

                        adorationKeyword.Value = keyword;
                        adorationLocation.Value = location;

                        break;
                }
            }
        }

        [WebMethod]
        public static List<Organization> GetOrganizations(string keyword, string location,
            string parentOrganization, string schedule, string day, string time, string language,
            bool activityWorship, bool activityBibleStudy, bool activityMass, bool activityRetreats,
            bool activityRecollection, bool activityVolunteerWorks, bool activityTalks, bool activityCamp,
            bool attendeeMen, bool attendeeWomen, bool attendeeSingle, bool attendeeCouple, bool attendeeProfessional,
            bool attendeeStudent, bool attendeeMissionary, bool attendeeNonCatholic, bool venueChurch, bool venueMall, bool venueSchool,
            bool venuePrivate, bool venuePublic, bool ventAircon, bool ventCeilingFan, bool ventWallFan, bool ventStandFan,
            bool parkingStreet, bool parkingMall, bool parkingPrivate, double latitude, double longitude)
        {
            var service = new OrganizationService();

            var activityList = new List<string>();
            var attendeeList = new List<string>();
            var venueList = new List<string>();
            var ventList = new List<string>();
            var parkingList = new List<string>();

            if (activityWorship)
                activityList.Add("2");
            if (activityBibleStudy)
                activityList.Add("3");
            if (activityMass)
                activityList.Add("4");
            if (activityRetreats)
                activityList.Add("5");
            if (activityRecollection)
                activityList.Add("6");
            if (activityVolunteerWorks)
                activityList.Add("7");
            if (activityTalks)
                activityList.Add("8");
            if (activityCamp)
                activityList.Add("9");

            var activities = string.Join(",", activityList);

            if (attendeeMen)
                attendeeList.Add("1");
            if (attendeeSingle)
                attendeeList.Add("2");
            if (attendeeProfessional)
                attendeeList.Add("3");
            if (attendeeStudent)
                attendeeList.Add("4");
            if (attendeeCouple)
                attendeeList.Add("5");
            if (attendeeWomen)
                attendeeList.Add("6");
            if (attendeeMissionary)
                attendeeList.Add("7");
            if (attendeeNonCatholic)
                attendeeList.Add("8");

            var attendees = string.Join(",", attendeeList);

            if (venueChurch)
                venueList.Add("1");
            if (venueSchool)
                venueList.Add("2");
            if (venueMall)
                venueList.Add("3");
            if (venuePublic)
                venueList.Add("4");
            if (venuePrivate)
                venueList.Add("5");

            var venues = string.Join(",", venueList);

            if (ventAircon)
                ventList.Add("1");
            if (ventCeilingFan)
                ventList.Add("2");
            if (ventWallFan)
                ventList.Add("3");
            if (ventStandFan)
                ventList.Add("4");

            var ventilations = string.Join(",", ventList);

            if (parkingStreet)
                parkingList.Add("1");
            if (parkingMall)
                parkingList.Add("2");
            if (parkingPrivate)
                parkingList.Add("3");
            
            var parkings = string.Join(",", parkingList);

            return service.Search(keyword, location, parentOrganization, schedule, time, language, day, activities, attendees, ventilations, parkings, venues);
        }

        [WebMethod]
        public static List<ChurchInfo> GetChurches(string churchKeyword, string churchLocation,
            string selectChurchSchedule, string selectChurchMassTime,
            string selectChurchLanguage, string selectChurchConfessionDay,
            string selectChurchConfessionTime, bool churchHasAirConditioned, bool churchHasCeilingFan,
            bool churchHasOrdinaryFan, string churchType, string churchLocationId,
            bool churchHasStreetParking, bool churchHasMallParking, bool churchHasPrivateParking,
            double latitude, double longitude, int limit, int page, int radius)
        {
            var service = new ChurchService();

            var ventilationList = new List<string>();
            var parkingList = new List<string>();

            if (churchHasAirConditioned)
                ventilationList.Add("1");

            if (churchHasCeilingFan)
                ventilationList.Add("2");

            if (churchHasOrdinaryFan)
                ventilationList.Add("3");

            var ventilations = string.Join(",", ventilationList);

            if (churchHasPrivateParking)
                parkingList.Add("1");

            if (churchHasMallParking)
                parkingList.Add("2");

            if (churchHasStreetParking)
                parkingList.Add("3");

            var parkings = string.Join(",", parkingList);

            if (selectChurchSchedule == "8")
                switch (DateTime.UtcNow.DayOfWeek)
                {
                    case DayOfWeek.Sunday:
                        selectChurchSchedule = "1";
                        break;
                    case DayOfWeek.Monday:
                        selectChurchSchedule = "2";
                        break;
                    case DayOfWeek.Tuesday:
                        selectChurchSchedule = "3";
                        break;
                    case DayOfWeek.Wednesday:
                        selectChurchSchedule = "4";
                        break;
                    case DayOfWeek.Thursday:
                        selectChurchSchedule = "5";
                        break;
                    case DayOfWeek.Friday:
                        selectChurchSchedule = "6";
                        break;
                    default:
                        selectChurchSchedule = "7";
                        break;
                }

            if (selectChurchConfessionDay == "8")
                switch (DateTime.UtcNow.DayOfWeek)
                {
                    case DayOfWeek.Sunday:
                        selectChurchConfessionDay = "1";
                        break;
                    case DayOfWeek.Monday:
                        selectChurchConfessionDay = "2";
                        break;
                    case DayOfWeek.Tuesday:
                        selectChurchConfessionDay = "3";
                        break;
                    case DayOfWeek.Wednesday:
                        selectChurchConfessionDay = "4";
                        break;
                    case DayOfWeek.Thursday:
                        selectChurchConfessionDay = "5";
                        break;
                    case DayOfWeek.Friday:
                        selectChurchConfessionDay = "6";
                        break;
                    default:
                        selectChurchConfessionDay = "7";
                        break;
                }

            var churches = service.Search(churchKeyword, "", churchType, churchLocationId, "",
                selectChurchSchedule,
                selectChurchMassTime, selectChurchLanguage, selectChurchConfessionTime,
                selectChurchConfessionDay, ventilations, parkings, "");

            if (churchLocation.IsNullOrWhiteSpace())
                return churches;

            //return churches
            //    .Where(coordinate => WithinRadius(NearDistance(new Coordinate { Latitude = latitude, Longitude = longitude },
            //        new Coordinate { Latitude = coordinate.Latitude, Longitude = coordinate.Longitude }), radius))
            //    .OrderBy(coordinate => NearDistance(new Coordinate { Latitude = latitude, Longitude = longitude },
            //        new Coordinate { Latitude = coordinate.Latitude, Longitude = coordinate.Longitude }))
                    
            //    .ToList();
            var filteredChurch = from church in churches
                   where NearDistance(
                            new Coordinate { Latitude = latitude, Longitude = longitude },
                            new Coordinate { Latitude = church.Latitude, Longitude = church.Longitude }
                       ) < 0.04
                   select church;

            return filteredChurch.ToList();
        }

        private static bool WithinRadius(double distance, int radius)
        {
            double kilometer = distance / 111;

            return kilometer <= radius;
        }

        private static double NearDistance(Coordinate source, Coordinate target)
        {
            return Math.Sqrt(Math.Pow(target.Longitude - source.Longitude, 2) +
                             Math.Pow(target.Latitude - source.Latitude, 2));
        }

        [WebMethod]
        public static List<Adoration> GetAdorations(string keyword, string location, string day, string time,
            string adorationlocation, bool hasAircondition, bool hasElectricFan, double longitude, double latitude)
        {
            var service = new AdorationService();

            if (day == "8")
                switch (DateTime.UtcNow.DayOfWeek)
                {
                    case DayOfWeek.Sunday:
                        day = "1";
                        break;
                    case DayOfWeek.Monday:
                        day = "2";
                        break;
                    case DayOfWeek.Tuesday:
                        day = "3";
                        break;
                    case DayOfWeek.Wednesday:
                        day = "4";
                        break;
                    case DayOfWeek.Thursday:
                        day = "5";
                        break;
                    case DayOfWeek.Friday:
                        day = "6";
                        break;
                    default:
                        day = "7";
                        break;
                }

            var ventilationsList = new List<string>();

            if (hasAircondition)
                ventilationsList.Add("1");

            if (hasElectricFan)
                ventilationsList.Add("3");

            var ventilations = string.Join(",", ventilationsList);

            var adorations = service.Search(keyword, "", day, time, adorationlocation, ventilations);

            if (day != string.Empty)
                foreach (var adoration in adorations)
                    switch (day)
                    {
                        case "1":
                            adoration.Masses = adoration.SundaySchedule;
                            break;
                        case "2":
                            adoration.Masses = adoration.MondaySchedule;
                            break;
                        case "3":
                            adoration.Masses = adoration.TuesdaySchedule;
                            break;
                        case "4":
                            adoration.Masses = adoration.WednesdaySchedule;
                            break;
                        case "5":
                            adoration.Masses = adoration.ThursdaySchedule;
                            break;
                        case "6":
                            adoration.Masses = adoration.FridaySchedule;
                            break;
                        default:
                            adoration.Masses = adoration.SaturdaySchedule;
                            break;
                    }
            else
                foreach (var adoration in adorations)
                    switch (DateTime.UtcNow.DayOfWeek)
                    {
                        case DayOfWeek.Sunday:
                            adoration.Masses = adoration.SundaySchedule;
                            break;
                        case DayOfWeek.Monday:
                            adoration.Masses = adoration.MondaySchedule;
                            break;
                        case DayOfWeek.Tuesday:
                            adoration.Masses = adoration.TuesdaySchedule;
                            break;
                        case DayOfWeek.Wednesday:
                            adoration.Masses = adoration.WednesdaySchedule;
                            break;
                        case DayOfWeek.Thursday:
                            adoration.Masses = adoration.ThursdaySchedule;
                            break;
                        case DayOfWeek.Friday:
                            adoration.Masses = adoration.FridaySchedule;
                            break;
                        default:
                            adoration.Masses = adoration.SaturdaySchedule;
                            break;
                    }

            if (location.IsNullOrWhiteSpace())
                return adorations;

            return adorations
                .OrderBy(adoration => NearDistance(new Coordinate { Latitude = latitude, Longitude = longitude },
                    new Coordinate { Latitude = adoration.Church.Latitude, Longitude = adoration.Church.Longitude }))
                .ToList();
        }

        public decimal longi = 0;
        public decimal lati = 0;
        [WebMethod]
        public static void getChurchLongLat(int churchID)
        {
            using (SqlConnection dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                {
                    dbconn.Close();
                }
                dbconn.Open();

                ChurchTransformer churchTransformer = new ChurchTransformer();
                ChurchInfo church = new ChurchInfo();

                using (SqlCommand cmd = new SqlCommand("SELECT Longitude, Latitude FROM [Simbahan] where SimbahanID = " + churchID, dbconn))
                {
                    var reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        HttpContext.Current.Session["Longi"] = Convert.ToDecimal(reader["Longitude"].ToString());
                        church.Longitude = Convert.ToDouble(HttpContext.Current.Session["Longi"]);

                        HttpContext.Current.Session["Lati"] = Convert.ToDecimal(reader["Latitude"].ToString());
                        church.Latitude = Convert.ToDouble(HttpContext.Current.Session["Lati"]);
                    }                    
                }
            }
        }

        public void passLocation()
        {
            Longitude.Value = HttpContext.Current.Session["Longi"].ToString();
            
            Latitude.Value = HttpContext.Current.Session["Lati"].ToString();
            
        }

        protected void triggerMe_Click(object sender, EventArgs e)
        {
            passLocation();
        }
    }
}
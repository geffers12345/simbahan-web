using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using SimbahanApp.Models;
using SimbahanApp.Transformers;

namespace SimbahanApp.Services
{
    public class ChurchService
    {
        #region Constructors and Deconstructors

        public ChurchService()
        {
            _churchTransformer = new ChurchTransformer();
            _massDetailTransformer = new MassDetailTransformer();
            _userTransformer = new UserTransformer();
            _churchReviewTransformer = new ChurchReviewTransformer();
            _announcementTransformer = new AnnouncementTransformer();
        }

        #endregion

        public ChurchInfo Find(int churchId)
        {
            var simbahanInfo = new ChurchInfo {SimbahanID = churchId};

            var schedulesList = new List<ChurchScheduleModel>();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spGetChurches", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@simbahanID", simbahanInfo.SimbahanID);

                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                            simbahanInfo = _churchTransformer.Transform(reader);

                        char[] separator = {','};

                        // Ventilation Processing...
                        reader.NextResult();
                        while (reader.Read())
                        {
                            var ventilations = reader["VentType"].ToString().Split(separator, StringSplitOptions.None);

                            foreach (var ventilation in ventilations)
                                simbahanInfo.Ventilations.Add(new VentilationModel {VentType = ventilation});
                        }

                        // Mass Schedules Processing...
                        reader.NextResult();
                        while (reader.Read())
                        {
                            var massDetail = _massDetailTransformer.Transform(reader);

                            switch (Convert.ToInt32(reader["ScheduleId"]))
                            {
                                case 1:
                                    massDetail.Days = "Sunday";
                                    simbahanInfo.SundayMassSchedule.Add(massDetail);
                                    break;

                                case 2:
                                    massDetail.Days = "Monday";
                                    simbahanInfo.MondayMassSchedule.Add(massDetail);
                                    break;

                                case 3:
                                    massDetail.Days = "Tuesday";
                                    simbahanInfo.TuesdayMassSchedule.Add(massDetail);
                                    break;

                                case 4:
                                    massDetail.Days = "Wednesday";
                                    simbahanInfo.WednesdayMassSchedule.Add(massDetail);
                                    break;

                                case 5:
                                    massDetail.Days = "Thursday";
                                    simbahanInfo.ThursdayMassSchedule.Add(massDetail);
                                    break;

                                case 6:
                                    massDetail.Days = "Friday";
                                    simbahanInfo.FridayMassSchedule.Add(massDetail);
                                    break;

                                case 7:
                                    massDetail.Days = "Saturday";
                                    simbahanInfo.SaturdayMassSchedule.Add(massDetail);
                                    break;
                            }
                        }
                        simbahanInfo.ChurchSchedules = schedulesList;

                        //// Church Reviews Processing...
                        reader.NextResult();
                        while (reader.Read())
                        {
                            var review = _churchReviewTransformer.Transform(reader);

                            if (review.UserId != 0)
                                review.User = _userTransformer.Transform(reader);

                            simbahanInfo.ChurchReviews.Add(review);
                        }

                        // Church Parking Processing...
                        reader.NextResult();
                        while (reader.Read())
                        {
                            var parkings = reader["ParkingType"].ToString().Split(separator, StringSplitOptions.None);

                            foreach (var parking in parkings)
                                simbahanInfo.ChurchParking.Add(new ParkingSlot {ParkingType = parking});
                        }

                        // Church Photos Processing...
                        reader.NextResult();
                        while (reader.Read())
                        {
                            var photos = reader["ImagePath"].ToString().Split(separator, StringSplitOptions.None);

                            foreach (var strPix in photos)
                                simbahanInfo.ChurchPhotos.Add(new ChurchPhotosModel {ChurchPhotos = strPix});
                        }

                        // Church Announcement Processing...
                        reader.NextResult();
                        while (reader.Read())
                            simbahanInfo.Announcements.Add(_announcementTransformer.Transform(reader));

                        // Adoration Chapel Schedule Processing...
                        reader.NextResult();
                        while (reader.Read())
                        {
                            simbahanInfo.AdorationDisplayText = Convert.IsDBNull(reader["DisplayText"].ToString())
                                ? ""
                                : reader["DisplayText"].ToString();

                            simbahanInfo.AdorationChapelSchedule.Add(new AdorationChapel
                            {
                                AdorationDay = reader["Days"].ToString(),
                                AdorationTime = reader["Time"].ToString(),
                                Open24Hours = reader["Open24Hours"].ToString()
                            });
                        }

                        // Church Type Processing...
                        reader.NextResult();
                        while (reader.Read())
                            simbahanInfo.ChurchType = reader["ChurchType"].ToString();

                        // Location Type Processing...
                        reader.NextResult();
                        while (reader.Read())
                            simbahanInfo.LocationType = reader["LocationType"].ToString();

                        // Baptism Details Processing...
                        reader.NextResult();
                        while (reader.Read())
                            simbahanInfo.BaptismDetails = reader["Text"].ToString();

                        // Confession Details Processing...
                        reader.NextResult();
                        while (reader.Read())
                            simbahanInfo.ConfessionDetails.Add(new ConfessionSchedule
                            {
                                Confess_Day = reader["ConfessDay"].ToString(),
                                Confess_Time = reader["ConfessTime"].ToString(),
                                Text = reader["ConfessText"].ToString()
                            });

                        // Wedding Details Processing...
                        reader.NextResult();
                        while (reader.Read())
                            simbahanInfo.WeddingDetails = reader["Text"].ToString();

                        // Country Details Processing...
                        reader.NextResult();
                        while (reader.Read())
                            simbahanInfo.Country = reader["Country"].ToString();

                        // Adoration Ventilation Processing...
                        reader.NextResult();
                        while (reader.Read())
                            simbahanInfo.AdorationVentilations.Add(reader["VentType"].ToString());

                        // Adoration Photos Processing...
                        reader.NextResult();
                        while (reader.Read())
                            simbahanInfo.AdorationPhotos.Add(@"Images\Photos\" + reader["ImagePath"]);
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                    finally
                    {
                        dbconn.Close();
                        dbconn.Dispose();
                    }
                }
            }

            return simbahanInfo;
        }

        internal object Find(object simbahanId)
        {
            throw new NotImplementedException();
        }

        public List<ChurchInfo> Search(string parish, string stateProvince, string churchTypeId,
            string churchLocationId,
            string hasAdorationChapel, string massScheduleId, string massTime, string massLanguage,
            string confessionTime, string confessionScheduleId, string ventilation, string parking,
            string countryId)
        {
            var churches = new List<ChurchInfo>();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spSearchChurches", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@parish", parish);
                        cmd.Parameters.AddWithValue("@stateOrProvince", stateProvince);
                        cmd.Parameters.AddWithValue("@churchTypeID", churchTypeId);
                        cmd.Parameters.AddWithValue("@churchLocationID", churchLocationId);
                        cmd.Parameters.AddWithValue("@hasAdorationChapel", hasAdorationChapel);
                        cmd.Parameters.AddWithValue("@massScheduleID", massScheduleId);
                        cmd.Parameters.AddWithValue("@massTime", massTime);
                        cmd.Parameters.AddWithValue("@massLanguage", massLanguage);
                        cmd.Parameters.AddWithValue("@confessionScheduleID", confessionScheduleId);
                        cmd.Parameters.AddWithValue("@confessionTime", confessionTime);
                        cmd.Parameters.AddWithValue("@ventilation", ventilation);
                        cmd.Parameters.AddWithValue("@parking", parking);
                        cmd.Parameters.AddWithValue("@countries", countryId);

                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            var church = _churchTransformer.Transform(reader);

                            // Ventilation Processing...
                            char[] separator = {','};
                            var ventilations = reader["Ventilations"]
                                .ToString()
                                .Split(separator, StringSplitOptions.None);
                            foreach (var ventilationItem in ventilations)
                                church.Ventilations.Add(new VentilationModel {VentType = ventilationItem});

                            // Mass Schedules Processing...
                            if (!Convert.IsDBNull(reader["MassSchedules"]))
                            {
                                var schedules = reader["MassSchedules"]
                                    .ToString()
                                    .Split(separator, StringSplitOptions.None);
                                foreach (var schedule in schedules)
                                {
                                    char[] pipeSeparator = {'|'};
                                    var massSchedule = schedule.Split(pipeSeparator, StringSplitOptions.None);

                                    var massDetail =
                                        new MassDetailsModel
                                        {
                                            Id = massSchedule[0] == "" ? 0 : Convert.ToInt32(massSchedule[0]),
                                            Language = massSchedule[2],
                                            Time = massSchedule[3],
                                            TimeStandardId =
                                                massSchedule[4] == "" ? 0 : Convert.ToInt32(massSchedule[4]),
                                            DateCreated = massSchedule[5] == ""
                                                ? DateTime.UtcNow
                                                : Convert.ToDateTime(massSchedule[5])
                                        };

                                    switch (Convert.ToInt32(massSchedule[1]))
                                    {
                                        case 1:
                                            massDetail.Days = "Sunday";
                                            massDetail.ScheduleId = 1;
                                            church.SundayMassSchedule.Add(massDetail);
                                            break;

                                        case 2:
                                            massDetail.Days = "Monday";
                                            massDetail.ScheduleId = 2;
                                            church.MondayMassSchedule.Add(massDetail);
                                            break;

                                        case 3:
                                            massDetail.Days = "Tuesday";
                                            massDetail.ScheduleId = 3;
                                            church.TuesdayMassSchedule.Add(massDetail);
                                            break;

                                        case 4:
                                            massDetail.Days = "Wednesday";
                                            massDetail.ScheduleId = 4;
                                            church.WednesdayMassSchedule.Add(massDetail);
                                            break;

                                        case 5:
                                            massDetail.Days = "Thursday";
                                            massDetail.ScheduleId = 5;
                                            church.ThursdayMassSchedule.Add(massDetail);
                                            break;

                                        case 6:
                                            massDetail.Days = "Friday";
                                            massDetail.ScheduleId = 6;
                                            church.FridayMassSchedule.Add(massDetail);
                                            break;

                                        case 7:
                                            massDetail.Days = "Saturday";
                                            massDetail.ScheduleId = 7;
                                            church.SaturdayMassSchedule.Add(massDetail);
                                            break;
                                        default:
                                            massDetail.Days = DateTime.UtcNow.DayOfWeek.ToString();
                                            massDetail.ScheduleId = (int)DateTime.UtcNow.DayOfWeek + 1;
                                            church.MondayMassSchedule.Add(massDetail);
                                            break;
                                    }
                                }
                            }

                            if (massScheduleId != string.Empty)
                            {
                                switch (massScheduleId)
                                {
                                    case "1":
                                        church.MassSchedules = church.SundayMassSchedule;
                                        break;
                                    case "2":
                                        church.MassSchedules = church.MondayMassSchedule;
                                        break;
                                    case "3":
                                        church.MassSchedules = church.TuesdayMassSchedule;
                                        break;
                                    case "4":
                                        church.MassSchedules = church.WednesdayMassSchedule;
                                        break;
                                    case "5":
                                        church.MassSchedules = church.ThursdayMassSchedule;
                                        break;
                                    case "6":
                                        church.MassSchedules = church.FridayMassSchedule;
                                        break;
                                    case "7":
                                        church.MassSchedules = church.SaturdayMassSchedule;
                                        break;
                                    default:
                                        church.MassSchedules = church.MondayMassSchedule;
                                        break;
                                }
                            }
                            else
                            {
                                switch (DateTime.UtcNow.DayOfWeek)
                                {
                                    case DayOfWeek.Sunday:
                                        church.MassSchedules = church.SundayMassSchedule;
                                        break;
                                    case DayOfWeek.Monday:
                                        church.MassSchedules = church.MondayMassSchedule;
                                        break;
                                    case DayOfWeek.Tuesday:
                                        church.MassSchedules = church.TuesdayMassSchedule;
                                        break;
                                    case DayOfWeek.Wednesday:
                                        church.MassSchedules = church.WednesdayMassSchedule;
                                        break;
                                    case DayOfWeek.Thursday:
                                        church.MassSchedules = church.ThursdayMassSchedule;
                                        break;
                                    case DayOfWeek.Friday:
                                        church.MassSchedules = church.FridayMassSchedule;
                                        break;
                                    case DayOfWeek.Saturday:
                                        church.MassSchedules = church.SaturdayMassSchedule;
                                        break;
                                }
                            }


                            // Church Reviews Processing...
                            var reviews = reader["Reviews"].ToString().Split(separator, StringSplitOptions.None);
                            foreach (var review in reviews)
                                church.ChurchReviews.Add(new ChurchReview
                                {
                                    Comment = review
                                });

                            // Church Photos Processing...
                            var photos = reader["ChurchPhotos"].ToString().Split(separator, StringSplitOptions.None);
                            bool thumbnailFound = false;

                            for (int i = 0; i < photos.Length; i++)
                            {
                                var photo = photos[i];

                                string thumbnailPath = ChurchPhoto.GetChurchThumbnail(church.SimbahanID, photo);

                                if (thumbnailPath != "")
                                {
                                    thumbnailFound = true;

                                    church.ChurchThumbnails.Add(new ChurchPhotosModel
                                    {
                                        ChurchPhotos = thumbnailPath
                                    });
                                }

                                church.ChurchPhotos.Add(new ChurchPhotosModel
                                {
                                    ChurchPhotos = photo == string.Empty ? "" : @"Images\Photos\" + photo
                                });


                                if (photos.Length == i + 1)
                                {
                                    if (thumbnailFound == false)
                                    {
                                        church.ChurchThumbnails.Add(new ChurchPhotosModel
                                        {
                                            ChurchPhotos = @"Images\default.jpg"
                                        });
                                    }
                                }
                            }

                            // Baptism
                            church.BaptismDetails = reader["BaptismSched"].ToString();

                            // Confession
                            char[] splitter = {',', '|'};
                            var confession = reader["ConfessionSched"]
                                .ToString()
                                .Split(splitter, StringSplitOptions.None);

                            if (confession.Length > 1)
                            {
                                int i = 0, j = 1;
                                for (; i < confession.Length;)
                                {
                                    church.ConfessionDetails.Add(new ConfessionSchedule
                                    {
                                        Confess_Day = confession[i],
                                        Confess_Time = confession[j]
                                    });
                                    i = i + 2;
                                    j = j + 2;
                                }
                            }

                            // Wedding
                            church.WeddingDetails = reader["WeddingSched"].ToString();

                            // Parking
                            var parkings = reader["ParkingSlot"].ToString().Split(separator, StringSplitOptions.None);
                            foreach (var parkingItem in parkings)
                                church.ChurchParking.Add(new ParkingSlot {ParkingType = parkingItem});

                            churches.Add(church);
                        }
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return churches;
        }

        public List<ChurchInfo> GetCoordinates(Coordinate coordinate, int limit)
        {
            var churches = new List<ChurchInfo>();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spGetChurchesNearby", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@latitude", coordinate.Latitude);
                        cmd.Parameters.AddWithValue("@longitude", coordinate.Longitude);
                        cmd.Parameters.AddWithValue("@limit", limit);

                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            var church = _churchTransformer.Transform(reader);

                            // Ventilation Processing...
                            char[] separator = {','};

                            var ventilations = reader["Ventilations"]
                                .ToString()
                                .Split(separator, StringSplitOptions.None);
                            foreach (var ventilation in ventilations)
                                church.Ventilations.Add(new VentilationModel {VentType = ventilation});

                            // Mass Schedules Processing...
                            if (!Convert.IsDBNull(reader["MassSchedules"]))
                            {
                                var schedules = reader["MassSchedules"]
                                    .ToString()
                                    .Split(separator, StringSplitOptions.None);
                                foreach (var schedule in schedules)
                                {
                                    char[] pipeSeparator = {'|'};
                                    var massSchedule = schedule.Split(pipeSeparator, StringSplitOptions.None);

                                    var massDetail =
                                        new MassDetailsModel
                                        {
                                            Id = massSchedule[0] == "" ? 0 : Convert.ToInt32(massSchedule[0]),
                                            Language = massSchedule[2],
                                            Time = massSchedule[3],
                                            TimeStandardId =
                                                massSchedule[4] == "" ? 0 : Convert.ToInt32(massSchedule[4]),
                                            DateCreated = massSchedule[5] == ""
                                                ? DateTime.UtcNow
                                                : Convert.ToDateTime(massSchedule[5])
                                        };

                                    switch (Convert.ToInt32(massSchedule[1]))
                                    {
                                        case 1:
                                            massDetail.Days = "Sunday";
                                            massDetail.ScheduleId = 1;
                                            church.SundayMassSchedule.Add(massDetail);
                                            break;

                                        case 2:
                                            massDetail.Days = "Monday";
                                            massDetail.ScheduleId = 2;
                                            church.MondayMassSchedule.Add(massDetail);
                                            break;

                                        case 3:
                                            massDetail.Days = "Tuesday";
                                            massDetail.ScheduleId = 3;
                                            church.TuesdayMassSchedule.Add(massDetail);
                                            break;

                                        case 4:
                                            massDetail.Days = "Wednesday";
                                            massDetail.ScheduleId = 4;
                                            church.WednesdayMassSchedule.Add(massDetail);
                                            break;

                                        case 5:
                                            massDetail.Days = "Thursday";
                                            massDetail.ScheduleId = 5;
                                            church.ThursdayMassSchedule.Add(massDetail);
                                            break;

                                        case 6:
                                            massDetail.Days = "Friday";
                                            massDetail.ScheduleId = 6;
                                            church.FridayMassSchedule.Add(massDetail);
                                            break;

                                        case 7:
                                            massDetail.Days = "Saturday";
                                            massDetail.ScheduleId = 7;
                                            church.SaturdayMassSchedule.Add(massDetail);
                                            break;
                                    }
                                }
                            }

                            switch (DateTime.UtcNow.DayOfWeek)
                            {
                                case DayOfWeek.Sunday:
                                    church.MassSchedules = church.SundayMassSchedule;
                                    break;
                                case DayOfWeek.Monday:
                                    church.MassSchedules = church.MondayMassSchedule;
                                    break;
                                case DayOfWeek.Tuesday:
                                    church.MassSchedules = church.TuesdayMassSchedule;
                                    break;
                                case DayOfWeek.Wednesday:
                                    church.MassSchedules = church.WednesdayMassSchedule;
                                    break;
                                case DayOfWeek.Thursday:
                                    church.MassSchedules = church.ThursdayMassSchedule;
                                    break;
                                case DayOfWeek.Friday:
                                    church.MassSchedules = church.FridayMassSchedule;
                                    break;
                                case DayOfWeek.Saturday:
                                    church.MassSchedules = church.SaturdayMassSchedule;
                                    break;
                            }


                            // Church Reviews Processing...
                            var reviews = reader["Reviews"].ToString().Split(separator, StringSplitOptions.None);
                            foreach (var review in reviews)
                                church.ChurchReviews.Add(new ChurchReview
                                {
                                    Comment = review
                                });

                            // Church Photos Processing...
                            var photos = reader["ChurchPhotos"].ToString().Split(separator, StringSplitOptions.None);
                            foreach (var photo in photos)
                                church.ChurchPhotos.Add(new ChurchPhotosModel
                                {
                                    ChurchPhotos = photo == string.Empty ? "" : @"Images\Photos\" + photo
                                });

                            // Baptism
                            church.BaptismDetails = reader["BaptismSched"].ToString();

                            // Confession
                            char[] splitter = {',', '|'};
                            var confession = reader["ConfessionSched"]
                                .ToString()
                                .Split(splitter, StringSplitOptions.None);

                            if (confession.Length > 1)
                            {
                                int i = 0, j = 1;
                                for (; i < confession.Length;)
                                {
                                    church.ConfessionDetails.Add(new ConfessionSchedule
                                    {
                                        Confess_Day = confession[i],
                                        Confess_Time = confession[j]
                                    });
                                    i = i + 2;
                                    j = j + 2;
                                }
                            }

                            // Wedding
                            church.WeddingDetails = reader["WeddingSched"].ToString();

                            // Parking
                            var parkings = reader["ParkingSlot"].ToString().Split(separator, StringSplitOptions.None);
                            foreach (var parking in parkings)
                                church.ChurchParking.Add(new ParkingSlot {ParkingType = parking});

                            churches.Add(church);
                        }
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return churches;
        }

        #region Private Properties

        private readonly ChurchTransformer _churchTransformer;
        private readonly MassDetailTransformer _massDetailTransformer;
        private readonly UserTransformer _userTransformer;
        private readonly ChurchReviewTransformer _churchReviewTransformer;
        private readonly AnnouncementTransformer _announcementTransformer;

        #endregion
    }
}
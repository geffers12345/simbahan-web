using System.Collections.Generic;

namespace SimbahanApp.Models
{
    public class ChurchInfo : SimbahanModel
    {
        public ChurchInfo()
        {
            SundayMassSchedule = new List<MassDetailsModel>();
            MondayMassSchedule = new List<MassDetailsModel>();
            TuesdayMassSchedule = new List<MassDetailsModel>();
            WednesdayMassSchedule = new List<MassDetailsModel>();
            ThursdayMassSchedule = new List<MassDetailsModel>();
            FridayMassSchedule = new List<MassDetailsModel>();
            SaturdayMassSchedule = new List<MassDetailsModel>();

            AdorationPhotos = new List<string>();
            ChurchParking = new List<ParkingSlot>();
            ChurchReviews = new List<ChurchReview>();
            AdorationVentilations = new List<string>();
            Announcements = new List<Announcement>();
            ChurchPhotos = new List<ChurchPhotosModel>();
            ChurchThumbnails = new List<ChurchPhotosModel>();
            ChurchSchedules = new List<ChurchScheduleModel>();
            AdorationChapelSchedule = new List<AdorationChapel>();
            ConfessionDetails = new List<ConfessionSchedule>();
            Ventilations = new List<VentilationModel>();
        }

        public int AdorationID { get; set; }
        public int? CountryId { get; set; }
        public List<string> AdorationPhotos { get; set; }
        public string AdorationDisplayText { get; set; }
        public List<ParkingSlot> ChurchParking { get; set; }
        public List<ChurchReview> ChurchReviews { get; set; }
        public List<ChurchScheduleModel> ChurchSchedules { get; set; }
        public List<Announcement> Announcements { get; set; }
        public List<AdorationChapel> AdorationChapelSchedule { get; set; }
        public List<MassDetailsModel> SundayMassSchedule { get; set; }
        public List<MassDetailsModel> MondayMassSchedule { get; set; }
        public List<MassDetailsModel> TuesdayMassSchedule { get; set; }
        public List<MassDetailsModel> WednesdayMassSchedule { get; set; }
        public List<MassDetailsModel> ThursdayMassSchedule { get; set; }
        public List<MassDetailsModel> FridayMassSchedule { get; set; }
        public List<MassDetailsModel> SaturdayMassSchedule { get; set; }
        public List<string> AdorationVentilations { get; set; }
        public string MaskData { get; set; }

        public string MetaTitle { get; set; }
        public string MetaDescription { get; set; }
    }
}
using System;
using System.Collections.Generic;

namespace SimbahanApp.Models
{
    public class SimbahanModel
    {
        public int SimbahanID { get; set; }
        public int? StreetNo { get; set; }
        public string StreetName { get; set; }
        public string Barangay { get; set; }
        public string City { get; set; }
        public string StateProvince { get; set; }
        public string ZipCode { get; set; }
        public string CompleteAddress { get; set; }
        public string Diocese { get; set; }
        public string Parish { get; set; }
        public string Priest { get; set; }
        public string Vicariate { get; set; }
        public string DateEstablished { get; set; }
        public string FeastDay { get; set; }
        public string ContactNo { get; set; }
        public DateTime DateCreated { get; set; }
        public DateTime LastUpdate { get; set; }
        public double Latitude { get; set; }
        public double Longitude { get; set; }
        public bool HasAdorationChapel { get; set; }
        public string ChurchHistory { get; set; }
        public string OfficeHours { get; set; }
        public int? ChurchTypeID { get; set; }
        public string ChurchType { get; set; }
        public string Website { get; set; }
        public string EmailAddress { get; set; }
        public string DevotionSchedule { get; set; }
        public int? LocationID { get; set; }
        public string LocationType { get; set; }
        public string ChurchCode { get; set; }
        public string BaptismDetails { get; set; }
        public List<ConfessionSchedule> ConfessionDetails { get; set; }
        public string WeddingDetails { get; set; }
        public string Country { get; set; }
        public List<VentilationModel> Ventilations { get; set; }
        public List<MassDetailsModel> MassSchedules { get; set; }
        public List<ChurchPhotosModel> ChurchPhotos { get; set; }
        public List<ChurchPhotosModel> ChurchThumbnails { get; set; }
    }
}
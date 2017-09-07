using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SimbahanApp.Exceptions;
using SimbahanApp.Notifications;
using SimbahanApp.Services;

namespace SimbahanApp.Models
{
    public class OrganizationAnnouncement : IModel<OrganizationAnnouncement>
    {
        #region Private Properties

        /// <summary>
        ///     Service implementation that talks to the database.
        /// </summary>
        private readonly OrganizationAnnouncementService _announcementService;

        #endregion

        #region Constructors and Deconstructors

        public OrganizationAnnouncement()
        {
            _announcementService = new OrganizationAnnouncementService();

            Id = 0;
        }

        #endregion

        private bool IsPersisted()
        {
            return Id != 0;
        }

        #region Public Properties

        /// <summary>
        ///     Unique identifier for announcement
        /// </summary>
        public int Id { get; set; }

        /// <summary>
        ///     Unique identifier for its relation to a <seealso cref="Organization">Organization</seealso>
        /// </summary>
        public int OrganizationId { get; set; }

        /// <summary>
        ///     The date this announcement begins.
        /// </summary>
        public DateTime StartDate { get; set; }

        /// <summary>
        ///     Formatted string used to display on a plain string.
        /// </summary>
        public string FormattedStartDate => StartDate.ToString("MMM d, yyyy");

        /// <summary>
        ///     Until when this announcement is due.
        /// </summary>
        public DateTime EndDate { get; set; }

        /// <summary>
        ///     Formmated string used to display on a plain string.
        /// </summary>
        public string FormattedEndDate => EndDate.ToString("MMM d, yyyy");

        /// <summary>
        ///     Time this announcement will start.
        /// </summary>
        public string StartTime { get; set; }

        /// <summary>
        ///     Time until this announcement is due.
        /// </summary>
        public string EndTime { get; set; }

        /// <summary>
        ///     Announcement heading.
        /// </summary>
        public string Title { get; set; }

        /// <summary>
        ///     Announcement details.
        /// </summary>
        public string Description { get; set; }

        /// <summary>
        ///     Path to the default image.
        /// </summary>
        public string ImagePath { get; set; }

        /// <summary>
        ///     Place where this announcement will happen.
        /// </summary>
        public string Venue { get; set; }

        /// <summary>
        ///     An event that will be raised whenever an announcement is saved.
        /// </summary>
        public event EventHandler<NotificationEventArgs> ChurchAnnouncementPublished;

        #endregion

        #region IModel Implementation

        public OrganizationAnnouncement Create()
        {
            if (IsPersisted())
                throw new ModelAlreadyPersistedException("This model is already saved in the database.");

            var announcement = _announcementService.Create(this);

            return announcement;
        }

        public OrganizationAnnouncement Find(int id)
        {
            return _announcementService.Find(id);
        }

        public OrganizationAnnouncement Update()
        {
            if (!IsPersisted())
                throw new ModelNotFoundException(
                    "Model cannot be found. Make sure the model is saved before you can update.");

            return _announcementService.Update(Id, this);
        }

        public void Delete()
        {
            if (!IsPersisted())
                throw new ModelNotFoundException(
                    "Model cannot be found. Make sure the model is saved before you can delete.");

            _announcementService.Delete(this);
        }

        public List<OrganizationAnnouncement> Get(int relationId = 0, int relationId2 = 0, int relationId3 = 0, int relationId4 = 0)
        {
            return _announcementService.Get(relationId, relationId2, relationId3, relationId4);
        }

        #endregion
    }
}
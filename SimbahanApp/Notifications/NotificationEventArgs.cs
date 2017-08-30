using System;
using SimbahanApp.Models;

namespace SimbahanApp.Notifications
{
    public class NotificationEventArgs : EventArgs
    {
        public readonly Notification Notification;

        public readonly int Id;

        public NotificationEventArgs(Notification notification, int id)
        {
            Notification = notification;
            Id = id;
        }
    }
}
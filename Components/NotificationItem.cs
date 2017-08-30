using SimbahanApp.Models;

namespace SimbahanApp.Components
{
    public class NotificationItem : IComponent
    {
        public NotificationItem(Notification notification)
        {
            Notification = notification;
        }

        public Notification Notification { get; set; }

        public string ToHtml()
        {
            return Notification.HasRead ? @"<li>" : @"<li class=""unread"">" +
                   @"<div id=""notificationItem"" data-url=""" + Notification.Action + @""" class=""notification-item"">" +
                   @"<h5>" + Notification.Title + "</h5>" +
                   @"<p class=""text-muted"">" +
                   Notification.Description.Substring(0, 48) + "..." +
                   @"</p>" +
                   @"<p class=""text-muted""><i class=""fa fa-clock-o""></i> " + Notification.TimeReadable + "</p>" +
                   @"</div>" +
                   @"</li>";
        }
    }
}
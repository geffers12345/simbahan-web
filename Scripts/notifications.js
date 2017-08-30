
var Notification = {
    container: $(".menu"),
    items: new Map(),

    Get: function() {
        (new http).post('')
            .then(function(response) {
                var notifications = response.d;
                Notification.items = new Map();

                $.each(notifications, function (key, notification) {
                    Notification.items.set(notification.Id, notification);

                    Notification.container.append(NotificationTemplate(notification));
                });
            }).run();
    },

    ItemClicked: function(e) {
        e.preventDefault();

        var notificationId = $(this).data('id');
        var notification = Notification.items.get(notificationId);

        window.location.href = notification.Action;

    }
    
}

function NotificationTemplate(notification) {
    return '' +
        '<li>' +
            '<a href="#" id="notificationItem" data-id="' + notification.Id + '">' +
//                '<div class="pull-left">' +
//                    '<img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">' +
//                '</div>' +
                '<h4>' +
                    notification.User.FullName +
                    '<small><i class="fa fa-clock-o"></i> ' + notification.CreatedAt + '</small>' +
                '</h4>' +
                '<p>' + notification.description + '</p>' +
            '</a>' +
        '</li>';
}